import 'package:flutter/material.dart';

class NutritionScreen extends StatelessWidget {
  int _selectedIndex = 3; // Set the initial index to 3 for the Nutrition screen

  void _onItemTapped(BuildContext context, int index) {
    _selectedIndex = index;
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/workout');
        break;
      case 2:
        Navigator.pushNamed(context, '/progress');
        break;
      case 3:
        Navigator.pushNamed(context, '/nutrition');
        break;
      case 4:
        Navigator.pushNamed(context, '/map');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1A32),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1A32),
        elevation: 0,
        title: const Text(
          'Nutrition',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
         leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushNamed(context, '/home'); // Navigate to home
          },
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Healthy Recipes",
                style: TextStyle(color: Color(0xFFDBF352), fontSize: 16),
              ),
              const SizedBox(height: 24),
              // Horizontal Scroll for Recipes
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildHorizontalCard(
                      'images/salad.png', // Local asset
                      'Protiens Salad',
                      'Eat greens daily',
                      '200 Kcal',
                    ),
                    const SizedBox(width: 16),
                    _buildHorizontalCard(
                      'images/salmon.png', // Local asset
                      'Baked salmon',
                      'Include protiens in your diet',
                      '350 Kcal',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "Nutrition Tips",
                style: TextStyle(color: Color(0xFFDBF352), fontSize: 16),
              ),
              const SizedBox(height: 16),
              // Vertical Scroll for Tips
              Column(
                children: [
                  _buildVerticalCard(
                    'images/fruit.png', // Local asset
                    'Fruit Bowl',
                    'Eat a variety of fruits every day.',
                  ),
                  const SizedBox(height: 16),
                  _buildVerticalCard(
                    'images/smothie.png', // Local asset
                    'Healthy Smoothies',
                    'Blend your favorite fruits and veggies.',
                  ),
                  const SizedBox(height: 16),
                  _buildVerticalCard(
                    'images/breakfast.png', // Local asset
                    'Delightful Breakfast',
                    'Start your day with delight.',
                  ),
                  const SizedBox(height: 16),
                  _buildVerticalCard(
                    'images/snacks.png', // Local asset
                    'Enjoy Snacks',
                    'You can make healthy yet delicious snacks.',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1E1A32),
        selectedItemColor: const Color(0xFF000000),
        unselectedItemColor: const Color(0xFF896CFE),
        currentIndex: _selectedIndex,
        onTap: (index) => _onItemTapped(context, index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: 'Workout'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Progress'),
          BottomNavigationBarItem(icon: Icon(Icons.fastfood), label: 'Nutrition'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
        ],
      ),
    );
  }

  Widget _buildHorizontalCard(String imageUrl, String title, String time, String calories) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: const Color(0xFF2A2438),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Image.asset(
              imageUrl,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(color: Colors.white, fontSize: 14)),
                const SizedBox(height: 4),
                Text('$time | $calories',
                    style: const TextStyle(color: Colors.white54, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerticalCard(String imageUrl, String title, String description) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2A2438),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            child: Image.asset(
              imageUrl,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(
                      color: Colors.white54,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}