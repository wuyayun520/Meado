import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../theme/app_theme.dart';
import 'post_detail_screen.dart';
import 'meado_chat_screen.dart';
import 'meado_video_call_screen.dart';

class UserDetailScreen extends StatefulWidget {
  final String userId;

  const UserDetailScreen({
    super.key,
    required this.userId,
  });

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  Map<String, dynamic>? _userData;
  List<dynamic>? _posts;
  bool _isLoading = true;
  bool _isBlocked = false;

  @override
  void initState() {
    super.initState();
    _loadUserData();
    _loadBlockStatus();
  }

  Future<void> _loadBlockStatus() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final isBlocked = prefs.getBool('blocked_user_${widget.userId}') ?? false;
      setState(() {
        _isBlocked = isBlocked;
      });
    } catch (e) {
      print('Error loading block status: $e');
    }
  }

  Future<void> _toggleBlock() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final newBlockStatus = !_isBlocked;
      await prefs.setBool('blocked_user_${widget.userId}', newBlockStatus);
      
      final blockedUsers = prefs.getStringList('blocked_users') ?? [];
      if (newBlockStatus) {
        if (!blockedUsers.contains(widget.userId)) {
          blockedUsers.add(widget.userId);
          await prefs.setStringList('blocked_users', blockedUsers);
        }
        setState(() {
          _isBlocked = true;
        });
      } else {
        blockedUsers.remove(widget.userId);
        await prefs.setStringList('blocked_users', blockedUsers);
        
        if (_userData == null) {
          setState(() {
            _isLoading = true;
          });
          await _loadUserData();
        }
        
        setState(() {
          _isBlocked = false;
          _isLoading = false;
        });
      }
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              newBlockStatus
                  ? 'User blocked successfully'
                  : 'User unblocked successfully',
            ),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      print('Error toggling block: $e');
    }
  }

  Future<void> _showReportUserDialog(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final isReported = prefs.getBool('reported_user_${widget.userId}') ?? false;
    
    if (isReported) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('You have already reported this user'),
            backgroundColor: Colors.orange,
          ),
        );
      }
      return;
    }

    if (!mounted) return;
    
    final reportReasons = [
      'Inappropriate content',
      'Spam or misleading',
      'Harassment or bullying',
      'Violence or dangerous',
      'Copyright infringement',
      'Other',
    ];
    
    String? selectedReason;
    
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              backgroundColor: const Color(0xFF2D2544),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: const Text(
                'Report User',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: SizedBox(
                width: double.maxFinite,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Please select a reason:',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ...reportReasons.map((reason) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: GestureDetector(
                            onTap: () {
                              setDialogState(() {
                                selectedReason = reason;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: selectedReason == reason
                                    ? AppTheme.primaryColor.withOpacity(0.3)
                                    : Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: selectedReason == reason
                                      ? AppTheme.primaryColor
                                      : Colors.transparent,
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    selectedReason == reason
                                        ? Icons.radio_button_checked
                                        : Icons.radio_button_unchecked,
                                    color: selectedReason == reason
                                        ? AppTheme.primaryColor
                                        : Colors.white70,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      reason,
                                      style: TextStyle(
                                        color: selectedReason == reason
                                            ? Colors.white
                                            : Colors.white70,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(dialogContext).pop(),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: selectedReason == null
                      ? null
                      : () async {
                          await _reportUser(selectedReason!);
                          if (mounted) {
                            Navigator.of(dialogContext).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Report successful, we will strictly review the reported content'),
                                backgroundColor: Colors.green,
                              ),
                            );
                          }
                        },
                  child: Text(
                    'Report',
                    style: TextStyle(
                      color: selectedReason == null
                          ? Colors.white30
                          : AppTheme.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> _reportUser(String reason) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('reported_user_${widget.userId}', true);
      await prefs.setString('report_user_reason_${widget.userId}', reason);
      
      final reportedUsers = prefs.getStringList('reported_users') ?? [];
      if (!reportedUsers.contains(widget.userId)) {
        reportedUsers.add(widget.userId);
        await prefs.setStringList('reported_users', reportedUsers);
      }
    } catch (e) {
      print('Error reporting user: $e');
    }
  }

  Future<void> _loadUserData() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/meadoVoice/meadoacg.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final List<dynamic> users = jsonData['users'] as List<dynamic>;

      final user = users.firstWhere(
        (u) => u['userId'] == widget.userId,
        orElse: () => null,
      );

      if (user != null) {
        setState(() {
          _userData = user as Map<String, dynamic>;
          _posts = _userData!['posts'] as List<dynamic>?;
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Error loading user data: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  List<dynamic> _getPosts() {
    if (_posts == null) return [];
    return List<dynamic>.from(_posts!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          _buildBackgroundImage(),
          SafeArea(
            child: Column(
              children: [
                _buildTopBar(context),
                Expanded(
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: AppTheme.primaryColor,
                          ),
                        )
                      : _isBlocked
                          ? Center(
                              child: Padding(
                                padding: const EdgeInsets.all(40),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.block,
                                      color: Colors.white54,
                                      size: 64,
                                    ),
                                    const SizedBox(height: 16),
                                    const Text(
                                      'This user has been blocked',
                                      style: TextStyle(
                                        color: Colors.white54,
                                        fontSize: 18,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 40),
                                    _buildProfileCard(),
                                    const SizedBox(height: 24),
                                    _buildTabs(),
                                    const SizedBox(height: 40),
                                    _buildPostsGrid(),
                                    const SizedBox(height: 40),
                                  ],
                                ),
                              ),
                            ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      height: 360,
      child: Image.asset(
        'assets/Meado_meBG.webp',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 8, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Image.asset(
              'assets/Meado_allback.webp',
              width: 44,
              height: 44,
            ),
          ),
          PopupMenuButton<String>(
            icon: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.more_vert,
                color: Colors.white,
                size: 24,
              ),
            ),
            color: const Color(0xFF2D2544),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            onSelected: (value) {
              if (value == 'block' || value == 'unblock') {
                _toggleBlock();
              } else if (value == 'report') {
                _showReportUserDialog(context);
              }
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                value: _isBlocked ? 'unblock' : 'block',
                child: Row(
                  children: [
                    Icon(
                      _isBlocked ? Icons.block : Icons.block_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      _isBlocked ? 'Unblock User' : 'Block User',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'report',
                child: Row(
                  children: [
                    Icon(
                      Icons.flag_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Report User',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCard() {
    if (_userData == null) return const SizedBox();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF574F57).withOpacity(0.6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(
                  _userData!['avatarUrl'] as String? ?? '',
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            _userData!['displayName'] as String? ?? '',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.music_note,
                          color: Colors.black,
                          size: 20,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        _getVoiceType(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      _userData!['bio'] as String? ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        height: 1.4,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Buttons row
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MeadoChatScreen(
                        userId: widget.userId,
                        userName: _userData!['displayName'] as String? ?? '',
                        userAvatar: _userData!['avatarUrl'] as String? ?? '',
                      ),
                    ),
                  );
                },
                child: Image.asset(
                  'assets/Meado_me_chat.webp',
                  width: 44,
                  height: 44,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 24),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MeadoVideoCallScreen(
                        userId: widget.userId,
                        userName: _userData!['displayName'] as String? ?? '',
                        userAvatar: _userData!['avatarUrl'] as String? ?? '',
                      ),
                    ),
                  );
                },
                child: Image.asset(
                  'assets/Meado_me_video.webp',
                  width: 44,
                  height: 44,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _getVoiceType() {
    final voiceTypes = [
      'Rich Baritone',
      'Deep Bass',
      'Warm Alto',
      'Youthful Voice',
      'Crystal Soprano',
    ];
    final userNumber = _userData!['userNumber'] as int? ?? 1;
    return voiceTypes[(userNumber - 1) % voiceTypes.length];
  }

  Widget _buildTabs() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'post',
        style: TextStyle(
          color: Colors.white,
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildPostsGrid() {
    final posts = _getPosts();
    if (posts.isEmpty) {
      return const Center(
        child: Text(
          'No posts available',
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.75,
      ),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return _buildPostCard(posts[index]);
      },
    );
  }

  Widget _buildPostCard(Map<String, dynamic> post) {
    final imageUrl = post['imageUrl'] as String? ?? '';
    
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PostDetailScreen(
              post: post,
              user: _userData!,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
              bottom: 6,
              left: 8,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/Meado_shengbo.webp',
                    width: 98,
                    height: 32,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    left: 14,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: Image.asset(
                        'assets/Meado_shengbo_play.webp',
                        width: 20,
                        height: 20,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}

