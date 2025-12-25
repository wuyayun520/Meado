import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../theme/app_theme.dart';

class PostDetailScreen extends StatefulWidget {
  final Map<String, dynamic> post;
  final Map<String, dynamic> user;

  const PostDetailScreen({
    super.key,
    required this.post,
    required this.user,
  });

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  bool _isLoading = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  bool _isLiked = false;
  int _likesCount = 0;

  @override
  void initState() {
    super.initState();
    _initAudioPlayer();
    _loadLikeStatus();
  }

  Future<void> _loadLikeStatus() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final postId = widget.post['postId'] as String? ?? '';
      final isLiked = prefs.getBool('liked_$postId') ?? false;
      final initialLikes = widget.post['likes'] as int? ?? 0;
      
      setState(() {
        _isLiked = isLiked;
        _likesCount = isLiked ? initialLikes + 1 : initialLikes;
      });
    } catch (e) {
      print('Error loading like status: $e');
      final initialLikes = widget.post['likes'] as int? ?? 0;
      setState(() {
        _likesCount = initialLikes;
      });
    }
  }

  Future<void> _toggleLike() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final postId = widget.post['postId'] as String? ?? '';
      final newLikeStatus = !_isLiked;
      
      await prefs.setBool('liked_$postId', newLikeStatus);
      
      setState(() {
        _isLiked = newLikeStatus;
        if (newLikeStatus) {
          _likesCount++;
        } else {
          _likesCount--;
        }
      });
    } catch (e) {
      print('Error toggling like: $e');
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _initAudioPlayer() {
    _audioPlayer.playerStateStream.listen((state) {
      if (mounted) {
        setState(() {
          _isPlaying = state.playing;
          if (state.processingState == ProcessingState.completed) {
            _isPlaying = false;
            _position = Duration.zero;
          }
        });
      }
    });

    _audioPlayer.positionStream.listen((position) {
      if (mounted) {
        setState(() {
          _position = position;
        });
      }
    });

    _audioPlayer.durationStream.listen((duration) {
      if (mounted) {
        setState(() {
          _duration = duration ?? Duration.zero;
        });
      }
    });
  }

  Future<void> _loadAudio() async {
    try {
      setState(() {
        _isLoading = true;
      });

      final audioUrl = widget.post['audioUrl'] as String? ?? '';
      if (audioUrl.isNotEmpty) {
        await _audioPlayer.setAsset(audioUrl);
        setState(() {
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Error loading audio: $e');
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error loading audio: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _togglePlayback() async {
    try {
      final currentState = _audioPlayer.playerState;
      
      if (currentState.processingState == ProcessingState.idle ||
          currentState.processingState == ProcessingState.loading) {
        await _loadAudio();
        await _audioPlayer.play();
        setState(() {
          _isPlaying = true;
        });
      } else if (currentState.processingState == ProcessingState.completed) {
        await _audioPlayer.seek(Duration.zero);
        await _audioPlayer.play();
        setState(() {
          _isPlaying = true;
          _position = Duration.zero;
        });
      } else if (currentState.playing) {
        await _audioPlayer.pause();
        setState(() {
          _isPlaying = false;
        });
      } else {
        await _audioPlayer.play();
        setState(() {
          _isPlaying = true;
        });
      }
    } catch (e) {
      print('Error playing audio: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error playing audio: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = widget.post['imageUrl'] as String? ?? '';
    final title = widget.post['title'] as String? ?? '';
    final description = widget.post['description'] as String? ?? '';
    final characterName = widget.post['characterName'] as String? ?? '';
    final animeName = widget.post['animeName'] as String? ?? '';

    return Scaffold(
      body: Stack(
        children: [
          _buildBackgroundImage(imageUrl),
          SafeArea(
            child: Column(
              children: [
                _buildTopBar(context),
                const Spacer(),
                _buildBottomContent(
                  title: title,
                  description: description,
                  characterName: characterName,
                  animeName: animeName,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage(String imageUrl) {
    return Positioned.fill(
      child: Image.asset(
        imageUrl,
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
          GestureDetector(
            onTap: () => _showReportDialog(context),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.error,
                color: Colors.white,
                size: 44,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showReportDialog(BuildContext context) async {
    final postId = widget.post['postId'] as String? ?? '';
    
    final prefs = await SharedPreferences.getInstance();
    final isReported = prefs.getBool('reported_$postId') ?? false;
    
    if (isReported) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('You have already reported this post'),
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
                'Report Post',
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
                          await _reportPost(postId, selectedReason!);
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

  Future<void> _reportPost(String postId, String reason) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('reported_$postId', true);
      await prefs.setString('report_reason_$postId', reason);
      
      final reportedPosts = prefs.getStringList('reported_posts') ?? [];
      if (!reportedPosts.contains(postId)) {
        reportedPosts.add(postId);
        await prefs.setStringList('reported_posts', reportedPosts);
      }
    } catch (e) {
      print('Error reporting post: $e');
    }
  }

  Widget _buildBottomContent({
    required String title,
    required String description,
    required String characterName,
    required String animeName,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black.withOpacity(0.8),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                        _buildPostContent(
                          title: title,
                          description: description,
                          characterName: characterName,
                          animeName: animeName,
                        ),
            const SizedBox(height: 24),
            _buildAudioPlayer(),
          ],
        ),
      ),
    );
  }

  Widget _buildPostContent({
    required String title,
    required String description,
    required String characterName,
    required String animeName,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        if (characterName.isNotEmpty || animeName.isNotEmpty)
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              if (characterName.isNotEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    characterName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              if (animeName.isNotEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    animeName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
            ],
          ),
        if (description.isNotEmpty) ...[
          const SizedBox(height: 16),
          Text(
            description,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              height: 1.5,
            ),
          ),
        ],
        const SizedBox(height: 16),
        GestureDetector(
          onTap: _toggleLike,
          child: Row(
            children: [
              Icon(
                _isLiked ? Icons.favorite : Icons.favorite_border,
                color: _isLiked ? const Color(0xFFFF69B4) : Colors.white,
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                _likesCount.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAudioPlayer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.6),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppTheme.primaryColor.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: _isLoading ? null : _togglePlayback,
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: _isLoading
                        ? const Center(
                            child: SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            ),
                          )
                        : Icon(
                            _isPlaying ? Icons.pause : Icons.play_arrow,
                            color: Colors.white,
                            size: 32,
                          ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Slider(
                        value: _duration.inMilliseconds > 0
                            ? _position.inMilliseconds.toDouble()
                            : 0.0,
                        max: _duration.inMilliseconds > 0
                            ? _duration.inMilliseconds.toDouble()
                            : 1.0,
                        onChanged: (value) {
                          _audioPlayer.seek(
                            Duration(milliseconds: value.toInt()),
                          );
                        },
                        activeColor: AppTheme.primaryColor,
                        inactiveColor: Colors.white24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _formatDuration(_position),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            _formatDuration(_duration),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

