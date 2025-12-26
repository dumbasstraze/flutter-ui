

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final String profileImage =
      'https://i.chzbgr.com/full/9224090624/h6825A85E/weird-meme-cartoon-nellucnhoj-com';
  final String name = 'MONGOL';
  final String followers = '106';
  final String likes = '9.4k';
  final String xp = '24x';

  // Leave this blank for now
  final String headerImage = '';

  final List<String> posts = const [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMIkkDhTh3c1Bbvg5wEn2GfN5rhn7P3ddIsw&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHsnwhOVxQqNp_vlTmvyQcsQ4q1s24jQCWcw&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQJzZqfXqvpgiwCTJ-FtbM_t2sjn_1e8aOXQ&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqkfwQb2ROXB2Dh42h8kM46ZAy6S8ENOIECA&s',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // HEADER
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 220,
                  decoration: BoxDecoration(
                    color: Colors.grey[900], // placeholder for now
                    image: headerImage.isNotEmpty
                        ? DecorationImage(
                      image: NetworkImage(headerImage),
                      fit: BoxFit.cover,
                    )
                        : null,
                  ),
                ),
                Container(
                  height: 220,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.2),
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: -50,
                  left: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 46,
                      backgroundImage: NetworkImage(profileImage),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 60),

            // NAME
            Text(
              name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 15),

            // STATS
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStat('Followers', followers),
                  _buildStat('Likes', likes),
                  _buildStat('XP', xp),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // LIKES HEADER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Likes',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Show All',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // GRID
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: posts.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      posts[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
