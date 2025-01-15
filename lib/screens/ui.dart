import 'package:flutter/material.dart';

class ProfileScreenx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 16),
            _buildPointsCard(),
            const Divider(),
            _buildMenuList(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            '+971 50 987 6543',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.location_on_outlined, size: 16),
              SizedBox(width: 4),
              Text(
                'Al Saif Gardens',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPointsCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade700,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "You've Earned: 80 points",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "80/100 Points (Next Claim: 20 Points Needed)",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'View Details',
                style: TextStyle(color: Colors.white,fontSize: 9),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuList() {
    final menuItems = [
      {'icon': Icons.shopping_bag_outlined, 'text': 'Orders', 'subtitle': 'View and manage all your previous orders'},
      {'icon': Icons.shopping_cart_outlined, 'text': 'Mostly Ordered', 'subtitle': 'Reorder your most frequently purchased items quickly'},
      {'icon': Icons.language, 'text': 'Language', 'subtitle': 'English'},
      {'icon': Icons.help_outline, 'text': 'Help Center', 'subtitle': ''},
      {'icon': Icons.question_answer_outlined, 'text': 'FAQs', 'subtitle': ''},
      {'icon': Icons.description_outlined, 'text': 'Terms and Conditions', 'subtitle': ''},
      {'icon': Icons.privacy_tip_outlined, 'text': 'Privacy Policy', 'subtitle': ''},
      {'icon': Icons.logout, 'text': 'Logout', 'subtitle': ''},
    ];

    return Expanded(
      child: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return ListTile(
            leading: Icon(item['icon'] as IconData),
            title: Text(item['text'] as String),
            subtitle: item['subtitle'] != '' ? Text(item['subtitle'] as String) : null,
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
             
            },
          );
        },
      ),
    );
  }
}
