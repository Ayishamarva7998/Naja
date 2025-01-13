import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final List<DashboardItem> _dashboardItems = [
    DashboardItem(
      title: 'Points Earned',
      icon: Icons.stars,
      color: Colors.indigo,
      isSpecial: true,
    ),
    DashboardItem(
      title: 'Orders',
      subtitle: 'View and manage all your previous orders',
      icon: Icons.shopping_bag_outlined,
    ),
    DashboardItem(
      title: 'Mostly Ordered',
      subtitle: 'Reorder your most frequently purchased items quickly',
      icon: Icons.shopping_cart_outlined,
    ),
    DashboardItem(
      title: 'Language',
      subtitle: 'English',
      icon: Icons.translate,
      showChevron: true,
    ),
    DashboardItem(
      title: 'Help Center',
      icon: Icons.help_outline,
    ),
    DashboardItem(
      title: 'FAQs',
      icon: Icons.question_answer_outlined,
    ),
    DashboardItem(
      title: 'Terms and Conditions',
      icon: Icons.description_outlined,
    ),
    DashboardItem(
      title: 'Privacy Policy',
      icon: Icons.shield_outlined,
    ),
    DashboardItem(
      title: 'Logout',
      icon: Icons.logout,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: _buildGridView(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row( 
        
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 const Text(
                '+971 50 987 6543',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Image.asset('assets/edit.png',height: 30,width: 60,color: Colors.grey,)
              ],),
             
              const Row(
                children: [
                
                  SizedBox(width: 4),
                  Text(
                    'Al Saif Gardens',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
         
        ],
      ),
    );
  }

  Widget _buildGridView(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 1,
        childAspectRatio: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 2,
      ),
      itemCount: _dashboardItems.length,
      itemBuilder: (context, index) {
        final item = _dashboardItems[index];
        return item.isSpecial ? _buildPointsCard(item) : _buildRegularCard(item);
      },
    );
  }

  Widget _buildPointsCard(DashboardItem item) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/background.png')),
     
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          // Icon(item.icon, color: Colors.yellow),
          // SizedBox(width: 16),
          // Expanded(
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Text(
          //         "You've Earned: 80 points",
          //         style: TextStyle(
          //           color: Colors.white,
          //           fontWeight: FontWeight.bold,
          //           fontSize: 14,
          //         ),
          //       ),
          //       SizedBox(height: 4),
          //       Text(
          //         '80/100 Points (Next Claim: 20 Points Needed)',
          //         style: TextStyle(color: Colors.white70, fontSize: 12),
          //       ),
          //     ],
          //   ),
          // ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              minimumSize: const Size(60, 36),
            ),
            child: const Text(
              'View Details',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegularCard(DashboardItem item) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(item.icon, color: Colors.grey),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                if (item.subtitle != null)
                  Text(
                    item.subtitle!,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
              ],
            ),
          ),
          if (item.showChevron) const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }
}

class DashboardItem {
  final String title;
  final String? subtitle;
  final IconData icon;
  final Color? color;
  final bool showChevron;
  final bool isSpecial;

  DashboardItem({
    required this.title,
    this.subtitle,
    required this.icon,
    this.color,
    this.showChevron = false,
    this.isSpecial = false,
  });
}