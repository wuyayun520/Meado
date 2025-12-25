import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_theme.dart';
import 'user_detail_screen.dart';

class DynamicScreen extends StatefulWidget {
  const DynamicScreen({super.key});

  @override
  State<DynamicScreen> createState() => _DynamicScreenState();
}

class _DynamicScreenState extends State<DynamicScreen> {
  List<Map<String, dynamic>> _voiceCards = [];
  bool _isLoading = true;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/meadoVoice/meadoacg.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final List<dynamic> users = jsonData['users'] as List<dynamic>;

      if (users.isNotEmpty) {
        final List<Map<String, dynamic>> shuffledUsers = List<Map<String, dynamic>>.from(users);
        shuffledUsers.shuffle(_random);

        final List<Map<String, dynamic>> selectedUsers = shuffledUsers.take(5).toList();

        setState(() {
          _voiceCards = selectedUsers.map((user) {
            final durations = [8, 10, 11, 12, 13, 14, 15, 16, 17, 18];
            final randomDuration = durations[_random.nextInt(durations.length)];

            return {
              'avatar': user['avatarUrl'] as String? ?? '',
              'duration': '${randomDuration}s',
              'userId': user['userId'] as String? ?? '',
              'displayName': user['displayName'] as String? ?? '',
            };
          }).toList();
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Error loading users: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackgroundImage(),
          SafeArea(
            child: Column(
              children: [
                _buildTopBar(context),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        _buildVoiceCards(),
                        const SizedBox(height: 20),
                        _buildIntroductionSection(),
                        const SizedBox(height: 20),
                      ],
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
    return Positioned.fill(
      child: Image.asset(
        'assets/Meado_dynamic_BG.webp',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 8, right: 16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Image.asset(
              'assets/Meado_allback.webp',
              width: 44,
              height: 44,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVoiceCards() {
    if (_isLoading) {
      return const SizedBox(
        height: 600,
        child: Center(
          child: CircularProgressIndicator(
            color: AppTheme.primaryColor,
          ),
        ),
      );
    }

    if (_voiceCards.isEmpty) {
      return const SizedBox(
        height: 600,
        child: Center(
          child: Text(
            'No users available',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }

    final positions = [
      {'left': 20.0, 'top': 50.0},
      {'right': 40.0, 'top': 20.0},
      {'left': 60.0, 'top': 200.0},
      {'right': 20.0, 'top': 250.0},
      {'left': 40.0, 'top': 380.0},
    ];

    return SizedBox(
      height: 600,
      child: Stack(
        children: List.generate(
          _voiceCards.length.clamp(0, 5),
          (index) {
            final position = positions[index];
            final card = _voiceCards[index];
            
            Widget positionedCard = _buildVoiceCard(card);
            
            if (position.containsKey('left')) {
              return Positioned(
                left: position['left'],
                top: position['top'],
                child: positionedCard,
              );
            } else {
              return Positioned(
                right: position['right'],
                top: position['top'],
                child: positionedCard,
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildVoiceCard(Map<String, dynamic> data) {
    return GestureDetector(
      onTap: () {
        if (data['userId'] != null) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => UserDetailScreen(
                userId: data['userId'] as String,
              ),
            ),
          );
        }
      },
      child: Container(
        height: 44,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: const Color(0xFF2D2544).withOpacity(0.8),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: AppTheme.primaryColor.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 16,
              backgroundImage: data['avatar'] != null && data['avatar'].toString().isNotEmpty
                  ? AssetImage(data['avatar'] as String)
                  : null,
              child: data['avatar'] == null || data['avatar'].toString().isEmpty
                  ? const Icon(Icons.person, color: Colors.white, size: 20)
                  : null,
            ),
            const SizedBox(width: 8),
            _buildWaveform(),
            const SizedBox(width: 8),
            Text(
              data['duration'],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 4),
          ],
        ),
      ),
    );
  }

  Widget _buildWaveform() {
    return SizedBox(
      width: 40,
      height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(8, (index) {
          final heights = [12.0, 16.0, 10.0, 18.0, 14.0, 20.0, 12.0, 16.0];
          return Container(
            width: 2,
            height: heights[index],
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppTheme.primaryColor,
                  AppTheme.primaryColor.withOpacity(0.5),
                ],
              ),
              borderRadius: BorderRadius.circular(1),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildIntroductionSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Image.asset(
        'assets/Meado_dynamic_introduction.webp',
        fit: BoxFit.contain,
      ),
    );
  }
}

