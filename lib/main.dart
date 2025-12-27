

//i used gpt a lil !!     

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final String profileImage =
      'https://i.pinimg.com/originals/63/e6/bb/63e6bb82cbdb3e836e2477ef07db7fab.gif';
  final String name = 'MONGOL';
  final String followers = '2.6M';
  final String likes = '12M';
  final String views = '24M';
  final String backgroundImage =
      'https://i.pinimg.com/1200x/ae/90/04/ae9004cb07427c72d725ba58268ec9a3.jpg';

  final List<String> middleImages = const [
    'https://i.pinimg.com/1200x/4e/52/a5/4e52a5971202d84747cf445a9d300ced.jpg',
    'https://i.pinimg.com/1200x/a1/a4/bd/a1a4bdc2bf507e5cd14fd929271c9a39.jpg',
    'https://i.pinimg.com/736x/9d/3d/4f/9d3d4f089d55a22cd70ddc51858c55ee.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
       
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(backgroundImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
        
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20), // top spacing
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                   
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey,
                        child: CircleAvatar(
                          radius: 46,
                          backgroundImage: NetworkImage(profileImage),
                        ),
                      ),
                      const SizedBox(height: 16),
                  
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 24),
                    
                      SizedBox(
                        height: 120,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              left: 0,
                              top: 50,
                              child: _buildMiddleImage(middleImages[0] ,size:70),
                            ),
                            Positioned(
                              top: 20,
                              child: _buildMiddleImage(middleImages[1], size: 70),
                            ),
                            Positioned(
                              right: 0,
                              top: 10,
                              child: _buildMiddleImage(middleImages[2], size:70),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  padding: const EdgeInsets.symmetric(
                      vertical: 15, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey[700],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStat('Followers', followers),
                      _buildStat('Likes', likes),
                      _buildStat('Views', views),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMiddleImage(String url, {double size = 60}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        url,
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildStat(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
              color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    );
  }
}
