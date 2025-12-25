import 'dart:math';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:record/record.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import '../theme/app_theme.dart';
import 'me_screen.dart';
import 'dynamic_screen.dart';
import 'user_detail_screen.dart';
import 'recommend_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _acgQuotes = [
    'This path is for the chosen, not the curious. Go, and don\'t look back.',
    'The world is not perfect, but it\'s there for us trying the best we can.',
    'Even if we forget the faces of our friends, we will never forget the bonds that were carved into our souls.',
    'A person who can\'t sacrifice everything, can\'t change anything.',
    'The world is not beautiful, therefore it is.',
    'If you don\'t like your destiny, don\'t accept it. Instead, have the courage to change it the way you want it to be.',
    'People die when they are killed.',
    'The only ones who should kill are those who are prepared to be killed.',
    'Just because you\'re correct doesn\'t mean you\'re right.',
    'I\'m not a hero. I\'m just a regular guy who got lucky.',
    'The moment you think of giving up, think of the reason why you held on so long.',
    'If you can\'t do something, then don\'t. Focus on what you can do.',
    'The world is cruel, but also very beautiful.',
    'I don\'t know everything. I only know what I know.',
    'The only way to deal with an unfree world is to become so absolutely free that your very existence is an act of rebellion.',
    'I\'m not running away. I\'m just choosing a different path.',
    'The past makes you want to die out of regret, and the future makes you depressed out of anxiety.',
    'Believe in yourself. Not in the you who believes in me. Not the me who believes in you. Believe in the you who believes in yourself.',
    'There is no such thing as a perfect being in this world. That is the truth.',
    'The future is not set in stone. It can be changed by anyone who has the will to do so.',
  ];

  late String _currentQuote;
  final Random _random = Random();
  
  // User cards
  List<Map<String, dynamic>> _userCards = [];

  // Recording state
  bool _isRecording = false;
  bool _hasRecording = false;
  bool _isPlaying = false;
  int _recordingDuration = 0;
  int _currentPlaybackPosition = 0;
  Timer? _recordingTimer;
  final AudioRecorder _audioRecorder = AudioRecorder();
  final AudioPlayer _audioPlayer = AudioPlayer();
  String? _recordingPath;

  @override
  void initState() {
    super.initState();
    _currentQuote = _acgQuotes[_random.nextInt(_acgQuotes.length)];
    _initAudioPlayer();
    _loadUserCards();
  }
  
  Future<void> _loadUserCards() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/meadoVoice/meadoacg.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final List<dynamic> users = jsonData['users'] as List<dynamic>;

      if (users.isNotEmpty) {
        final List<Map<String, dynamic>> shuffledUsers = List<Map<String, dynamic>>.from(users);
        shuffledUsers.shuffle(_random);

        final List<Map<String, dynamic>> selectedUsers = shuffledUsers.take(3).toList();

        setState(() {
          _userCards = selectedUsers.map((user) {
            final durations = [8, 10, 11, 12, 13, 14, 15, 16, 17, 18];
            final randomDuration = durations[_random.nextInt(durations.length)];

            return {
              'avatarUrl': user['avatarUrl'] as String? ?? '',
              'duration': '${randomDuration}s',
              'userId': user['userId'] as String? ?? '',
              'displayName': user['displayName'] as String? ?? '',
            };
          }).toList();
        });
      }
    } catch (e) {
      print('Error loading user cards: $e');
    }
  }

  @override
  void dispose() {
    _recordingTimer?.cancel();
    _audioRecorder.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  void _initAudioPlayer() {
    _audioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        setState(() {
          _isPlaying = false;
          _currentPlaybackPosition = 0;
        });
      }
    });

    _audioPlayer.positionStream.listen((position) {
      if (_isPlaying) {
        setState(() {
          _currentPlaybackPosition = position.inSeconds;
        });
      }
    });
  }

  void _refreshQuote() {
    setState(() {
      String newQuote;
      do {
        newQuote = _acgQuotes[_random.nextInt(_acgQuotes.length)];
      } while (newQuote == _currentQuote && _acgQuotes.length > 1);
      _currentQuote = newQuote;
    });
  }

  Future<void> _toggleRecording() async {
    if (_isRecording) {
      await _stopRecording();
    } else if (_hasRecording) {
      await _togglePlayback();
    } else {
      await _startRecording();
    }
  }

  Future<void> _startRecording() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        final directory = await getApplicationDocumentsDirectory();
        final timestamp = DateTime.now().millisecondsSinceEpoch;
        _recordingPath = '${directory.path}/recording_$timestamp.m4a';

        await _audioRecorder.start(
          const RecordConfig(),
          path: _recordingPath!,
        );

        setState(() {
          _isRecording = true;
          _recordingDuration = 0;
        });

        _recordingTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
          setState(() {
            _recordingDuration++;
          });
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Microphone permission is required'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _stopRecording() async {
    try {
      await _audioRecorder.stop();
      _recordingTimer?.cancel();
      setState(() {
        _isRecording = false;
        _hasRecording = true;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error stopping recording: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _togglePlayback() async {
    if (_recordingPath == null) return;

    try {
      if (_isPlaying) {
        await _audioPlayer.pause();
        setState(() {
          _isPlaying = false;
        });
      } else {
        if (_currentPlaybackPosition == 0) {
          await _audioPlayer.setFilePath(_recordingPath!);
        }
        await _audioPlayer.play();
        setState(() {
          _isPlaying = true;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error playing audio: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _deleteRecording() {
    _audioPlayer.stop();
    setState(() {
      _isRecording = false;
      _hasRecording = false;
      _isPlaying = false;
      _recordingDuration = 0;
      _currentPlaybackPosition = 0;
      _recordingPath = null;
    });
  }

  String _formatDuration(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackgroundImage(),
          _buildLeftActionButtons(),
          _buildBottomSection(),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Positioned.fill(
      child: Image.asset(
        'assets/meado_home_man.webp',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildLeftActionButtons() {
    return Positioned(
      left: 16,
      top: MediaQuery.of(context).padding.top + 80,
      child: Column(
        children: [
          _buildActionButton(
            'assets/Meado_home_nor.webp',
            () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const RecommendScreen(),
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          _buildActionButton(
            'assets/Meado_dynamic_nor.webp',
            () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const DynamicScreen(),
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          _buildActionButton(
            'assets/Meado_me_nor.webp',
            () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MeScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String assetPath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        assetPath,
        width: 52,
        height: 52,
      ),
    );
  }

  Widget _buildBottomSection() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.3),
              Colors.black.withOpacity(0.7),
            ],
          ),
        ),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Transform.translate(
                  offset: const Offset(0, -40),
                  child: _buildSubtitleBox(),
                ),
                const SizedBox(height: 16),
                _buildAudioPlayerSection(),
                const SizedBox(height: 16),
                _buildAudioWaveform(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubtitleBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Meado_home_subitles.webp'),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.5,
                ),
                children: [
                  const TextSpan(
                    text: 'Subtitles: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: _currentQuote,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: _refreshQuote,
            child: Image.asset(
              'assets/Meado_home_refresh.webp',
              width: 20,
              height: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAudioPlayerSection() {
    if (_userCards.isEmpty) {
      return const SizedBox(height: 44);
    }
    
    return SizedBox(
      height: 44,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: _userCards.asMap().entries.map((entry) {
          final index = entry.key;
          final user = entry.value;
          return Padding(
            padding: EdgeInsets.only(right: index < _userCards.length - 1 ? 12 : 0),
            child: _buildUserAvatar(
              user['avatarUrl'] as String,
              user['duration'] as String,
              user['userId'] as String,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildUserAvatar(String avatarUrl, String duration, String userId) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => UserDetailScreen(userId: userId),
          ),
        );
      },
      child: Container(
        width: 145,
        height: 44,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Meado_home_soundBG.webp'),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              CircleAvatar(
                radius: 14,
                backgroundImage: AssetImage(avatarUrl),
                onBackgroundImageError: (exception, stackTrace) {
                  // Handle error if image fails to load
                },
              ),
              const SizedBox(width: 8),
              Image.asset(
                'assets/Meado_home_ybo.webp',
                width: 40,
                height: 24,
              ),
              const SizedBox(width: 8),
              Text(
                duration,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAudioWaveform() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: _toggleRecording,
            child: Container(
              height: 56,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppTheme.primaryColor,
                    AppTheme.primaryColor.withOpacity(0.7),
                  ],
                ),
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primaryColor.withOpacity(0.5),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Center(
                child: _buildWaveformContent(),
              ),
            ),
          ),
        ),
        const SizedBox(width: 15),
        GestureDetector(
          onTap: _hasRecording ? _deleteRecording : null,
          child: Container(
            width: 44,
            height: 44,
            child: Center(
              child: Opacity(
                opacity: _hasRecording ? 1.0 : 0.3,
                child: Image.asset(
                  'assets/Meado_home_delete.webp',
                  width: 44,
                  height: 44,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWaveformContent() {
    if (_isRecording || _hasRecording) {
      // 计算显示时间：播放时显示剩余时间，否则显示总时长
      int displayTime;
      if (_isPlaying) {
        displayTime = _recordingDuration - _currentPlaybackPosition;
      } else {
        displayTime = _recordingDuration;
      }
      
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _formatDuration(displayTime),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 16),
          Icon(
            _isRecording
                ? Icons.mic
                : _isPlaying
                    ? Icons.pause
                    : Icons.play_arrow,
            color: Colors.white,
            size: 28,
          ),
        ],
      );
    } else {
      return Image.asset(
        'assets/Meado_home_sound.webp',
        fit: BoxFit.contain,
      );
    }
  }
}
