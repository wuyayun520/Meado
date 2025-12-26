import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../theme/app_theme.dart';
import '../screens/meado_wallet_screen.dart';

class UserUnlockHelper {
  static const int unlockCost = 55;
  static const String unlockedUsersKey = 'unlocked_users';
  static const String coinsKey = 'meadoCoins';

  /// 检查用户是否已解锁
  static Future<bool> isUserUnlocked(String userId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final unlockedUsers = prefs.getStringList(unlockedUsersKey) ?? [];
      return unlockedUsers.contains(userId);
    } catch (e) {
      debugPrint('Error checking unlock status: $e');
      return false;
    }
  }

  /// 获取当前金币余额
  static Future<int> getCoins() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getInt(coinsKey) ?? 0;
    } catch (e) {
      debugPrint('Error getting coins: $e');
      return 0;
    }
  }

  /// 解锁用户并扣除金币
  static Future<bool> unlockUser(String userId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final currentCoins = prefs.getInt(coinsKey) ?? 0;
      
      if (currentCoins < unlockCost) {
        return false;
      }

      // 扣除金币
      final newCoins = currentCoins - unlockCost;
      await prefs.setInt(coinsKey, newCoins);

      // 标记用户为已解锁
      final unlockedUsers = prefs.getStringList(unlockedUsersKey) ?? [];
      if (!unlockedUsers.contains(userId)) {
        unlockedUsers.add(userId);
        await prefs.setStringList(unlockedUsersKey, unlockedUsers);
      }

      debugPrint('User $userId unlocked. Remaining coins: $newCoins');
      return true;
    } catch (e) {
      debugPrint('Error unlocking user: $e');
      return false;
    }
  }

  /// 检查并处理用户解锁，返回是否应该跳转
  static Future<bool> checkAndUnlockUser(
    BuildContext context,
    String userId,
  ) async {
    // 检查是否已解锁
    final isUnlocked = await isUserUnlocked(userId);
    if (isUnlocked) {
      return true; // 已解锁，可以直接跳转
    }

    // 检查金币余额
    final coins = await getCoins();
    if (coins < unlockCost) {
      // 金币不足，显示确认对话框
      final shouldRecharge = await _showInsufficientCoinsDialog(context);
      if (shouldRecharge) {
        // 跳转到钱包页面
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const MeadoWalletScreen(),
          ),
        );
      }
      return false; // 不跳转到用户详情页
    }

    // 金币足够，显示确认对话框
    final shouldUnlock = await _showUnlockConfirmDialog(context, unlockCost);
    if (shouldUnlock) {
      // 解锁用户并扣除金币
      final success = await unlockUser(userId);
      if (success) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Unlocked successfully! -$unlockCost Coins'),
              backgroundColor: AppTheme.primaryColor,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              duration: const Duration(seconds: 2),
            ),
          );
        }
        return true; // 解锁成功，可以跳转
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Failed to unlock user'),
              backgroundColor: Colors.red,
            ),
          );
        }
        return false;
      }
    }
    return false; // 用户取消，不跳转
  }

  /// 显示金币不足的确认对话框
  static Future<bool> _showInsufficientCoinsDialog(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2D1B4E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: AppTheme.primaryColor.withOpacity(0.5),
            width: 2,
          ),
        ),
        title: Row(
          children: [
            Icon(
              Icons.account_balance_wallet,
              color: AppTheme.primaryColor,
              size: 24,
            ),
            const SizedBox(width: 8),
            const Text(
              'Insufficient Coins',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'You need 55 coins to unlock this user.',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 12),
            FutureBuilder<int>(
              future: getCoins(),
              builder: (context, snapshot) {
                final currentCoins = snapshot.data ?? 0;
                return Text(
                  'Current balance: $currentCoins coins',
                  style: TextStyle(
                    color: AppTheme.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            const SizedBox(height: 8),
            const Text(
              'Would you like to recharge?',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white70,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text(
              'Cancel',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: AppTheme.primaryGradient,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text(
                'Recharge',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    ) ?? false;
  }

  /// 显示解锁确认对话框
  static Future<bool> _showUnlockConfirmDialog(
    BuildContext context,
    int cost,
  ) async {
    return await showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2D1B4E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: AppTheme.primaryColor.withOpacity(0.5),
            width: 2,
          ),
        ),
        title: Row(
          children: [
            Icon(
              Icons.lock_open,
              color: AppTheme.primaryColor,
              size: 24,
            ),
            const SizedBox(width: 8),
            const Text(
              'Unlock User',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Unlock this user to view their profile?',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 12),
            FutureBuilder<int>(
              future: getCoins(),
              builder: (context, snapshot) {
                final currentCoins = snapshot.data ?? 0;
                return Row(
                  children: [
                    Icon(
                      Icons.monetization_on,
                      color: AppTheme.primaryColor,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Cost: $cost coins',
                      style: TextStyle(
                        color: AppTheme.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      '(Balance: $currentCoins)',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white70,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text(
              'Cancel',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: AppTheme.primaryGradient,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text(
                'Unlock',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    ) ?? false;
  }
}

