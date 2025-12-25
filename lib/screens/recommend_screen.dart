import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_theme.dart';
import 'post_detail_screen.dart';

class RecommendScreen extends StatefulWidget {
  const RecommendScreen({super.key});

  @override
  State<RecommendScreen> createState() => _RecommendScreenState();
}

class _RecommendScreenState extends State<RecommendScreen> {
  List<Map<String, dynamic>> _topPosts = [];
  List<Map<String, dynamic>> _allPosts = [];
  List<Map<String, dynamic>> _popularPosts = [];
  List<Map<String, dynamic>> _newPosts = [];
  bool _isLoading = true;
  bool _showPopular = true;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  Future<void> _loadPosts() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/meadoVoice/meadoacg.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final List<dynamic> users = jsonData['users'] as List<dynamic>;

      // Collect all posts with user info
      List<Map<String, dynamic>> allPosts = [];
      for (var user in users) {
        final posts = user['posts'] as List<dynamic>?;
        if (posts != null) {
          for (var post in posts) {
            allPosts.add({
              'post': post,
              'user': user,
              'userId': user['userId'],
              'userName': user['displayName'],
              'userAvatar': user['avatarUrl'],
              'postId': post['postId'],
              'imageUrl': post['imageUrl'],
              'title': post['title'],
            });
          }
        }
      }

      if (allPosts.isNotEmpty) {
        allPosts.shuffle(_random);

        setState(() {
          // Top 3 posts
          _topPosts = allPosts.take(3).toList();
          
          // All posts for list
          _allPosts = allPosts.skip(3).take(4).toList();
          
          // Popular and New posts (4 each)
          _popularPosts = allPosts.skip(7).take(4).toList();
          _newPosts = allPosts.skip(11).take(4).toList();
          
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Error loading posts: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: SafeArea(
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppTheme.primaryColor,
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTopBar(),
                    const SizedBox(height: 20),
                    _buildTopRanking(),
                    const SizedBox(height: 30),
                    _buildCharacterList(),
                    const SizedBox(height: 30),
                    _buildTabSection(),
                    const SizedBox(height: 20),
                    _buildCharacterGrid(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Image.asset(
              'assets/Meado_allback.webp',
              width: 40,
              height: 40,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopRanking() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/Meado_record_acting.webp',
            width: 174,
            height: 30,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _topPosts.length,
              itemBuilder: (context, index) {
                final postData = _topPosts[index];
                return Padding(
                  padding: EdgeInsets.only(right: index < _topPosts.length - 1 ? 12 : 0),
                  child: _buildTopCard(postData, index + 1),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopCard(Map<String, dynamic> postData, int rank) {
    // Determine image and size based on rank
    String badgeImage;
    double width;
    double height;
    
    if (rank == 2) {
      badgeImage = 'assets/Meado_record_one.webp';
      width = 120;
      height = 160;
    } else if (rank == 1) {
      badgeImage = 'assets/Meado_record_two.webp';
      width = 117;
      height = 130;
    } else {
      badgeImage = 'assets/Meado_record_three.webp';
      width = 117;
      height = 130;
    }
    
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PostDetailScreen(
              post: postData['post'] as Map<String, dynamic>,
              user: postData['user'] as Map<String, dynamic>,
            ),
          ),
        );
      },
      child: Container(
        width: width,
        height: height,
        
        child: ClipRRect(
         
          child: Image.asset(
            badgeImage,
            width: width,
            height: height,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Widget _buildCharacterList() {
    return Column(
      children: _allPosts.map((postData) {
        return _buildCharacterItem(postData);
      }).toList(),
    );
  }

  Widget _buildCharacterItem(Map<String, dynamic> postData) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PostDetailScreen(
              post: postData['post'] as Map<String, dynamic>,
              user: postData['user'] as Map<String, dynamic>,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                postData['imageUrl'] as String,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    postData['title'] as String? ?? 'No title',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    (postData['post'] as Map<String, dynamic>)['content'] as String? ?? 'No description',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Image.asset(
              'assets/Meado_record_voice.webp',
              width: 40,
              height: 40,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _buildTab('popular', _showPopular),
          const SizedBox(width: 20),
          _buildTab('new', !_showPopular),
        ],
      ),
    );
  }

  Widget _buildTab(String title, bool isSelected) {
    String imagePath;
    double width;
    double height = 30;
    
    if (title == 'popular') {
      imagePath = isSelected 
          ? 'assets/Meado_record_popular_pre.webp'
          : 'assets/Meado_record_popular_nor.webp';
      width = 80;
    } else {
      imagePath = isSelected 
          ? 'assets/Meado_record_new_pre.webp'
          : 'assets/Meado_record_new_nor.webp';
      width = 46;
    }
    
    return GestureDetector(
      onTap: () {
        setState(() {
          _showPopular = title == 'popular';
        });
      },
      child: Image.asset(
        imagePath,
        width: width,
        height: height,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildCharacterGrid() {
    final posts = _showPopular ? _popularPosts : _newPosts;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
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
          return _buildCharacterCard(posts[index]);
        },
      ),
    );
  }

  Widget _buildCharacterCard(Map<String, dynamic> postData) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PostDetailScreen(
              post: postData['post'] as Map<String, dynamic>,
              user: postData['user'] as Map<String, dynamic>,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                postData['imageUrl'] as String,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
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
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  postData['userName'] as String? ?? 'Unknown',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

