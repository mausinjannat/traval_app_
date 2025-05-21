import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final String userName = "Mausin Jannat";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ""),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Welcome Back', style: TextStyle(fontSize: 14)),
                      Text(userName,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.orange.shade100,
                    child: Icon(Icons.notifications_none, color: Colors.orange),
                  ),
                ],
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Discover a city',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  _categoryChip("Mountain", selected: true),
                  _categoryChip("Beach"),
                  _categoryChip("Park"),
                ],
              ),
              SizedBox(height: 16),
              Text("Explore Cities", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TabBarSection(),
              SizedBox(height: 20),
              Text("Popular Categories", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _iconCategory(Icons.flight_takeoff, "Flights"),
                  _iconCategory(Icons.hotel, "Hotels"),
                  _iconCategory(Icons.directions_bus, "Transports"),
                  _iconCategory(Icons.event, "Events"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _categoryChip(String label, {bool selected = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Chip(
        label: Text(label),
        backgroundColor: selected ? Colors.orange.shade100 : Colors.grey.shade200,
      ),
    );
  }

  Widget _iconCategory(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.blue.shade50,
          child: Icon(icon, color: Colors.blue),
        ),
        SizedBox(height: 6),
        Text(label, style: TextStyle(fontSize: 12))
      ],
    );
  }
}

class TabBarSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            labelColor: Colors.orange,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.orange,
            tabs: const [
              Tab(text: 'Popular'),
              Tab(text: 'Recommended'),
              Tab(text: 'Most Viewed'),
              Tab(text: 'Recent'),
            ],
          ),
          SizedBox(
            height: 200,
            child: TabBarView(
              children: [
                _destinationList(),
                Center(child: Text('Recommended')),
                Center(child: Text('Most Viewed')),
                Center(child: Text('Recent')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _destinationList() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        _destinationCard("Cox's Bazar", "Bangladesh", 4.9, 890, 'assets/images/image2.jpg'),
        _destinationCard("Koh Phi Phi", "Bangladesh", 4.7, 950, 'assets/images/image2.jpg'),
        _destinationCard("Saint martin", "Bangladesh", 4.9, 890, 'assets/images/image2.jpg'),

        _destinationCard("Nijhum Dwip", "Bangladesh", 4.9, 890, 'assets/images/image2.jpg'),

        _destinationCard("Cox's Bazar", "Bangladesh", 4.9, 890, 'assets/images/image2.jpg'),
        _destinationCard("Cox's Bazar", "Bangladesh", 4.9, 890, 'assets/images/image2.jpg'),


      ],
    );
  }

  Widget _destinationCard(String title, String country, double rating, int price, String imagePath) {
    return Container(
      width: 160,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(country),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$$price/person", style: TextStyle(color: Colors.orange)),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        Text(rating.toString())
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
