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
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '+971 50 987 6543',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined),
                      Text(
                        'Al Saif Gardens',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Image.asset('assets/edit.png',
              height: 24, width: 24, color: const Color.fromARGB(255, 8, 0, 0),)
        ],
      ),
    );
  }

  Widget _buildGridView(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 1,
        childAspectRatio: MediaQuery.of(context).size.width > 600 ? 3 : 4,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: _dashboardItems.length,
      itemBuilder: (context, index) {
        final item = _dashboardItems[index];
        return item.isSpecial
            ? _buildPointsCard(item)
            : _buildRegularCard(item);
      },
    );
  }

  Widget _buildPointsCard(DashboardItem item) {
    return Container(
      height: 100, // Fixed height for points card
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/background.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // Image.asset('')

              Text(
                "You've Earned: 80 points",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                '80/100 Ponits(Next Claim: 20 Ponits Needed)',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
              Padding(
                padding: EdgeInsets.only(left: 276, top: 20),
                child: Text(
                  'View Details',
                  style: TextStyle(color: Colors.white, fontSize: 9),
                ),
              )
            ],
          ),

          // TextButton(
          //   onPressed: () {},
          //   style: TextButton.styleFrom(
          //     padding: const EdgeInsets.symmetric(horizontal: 8),
          //     minimumSize: const Size(50, 30),
          //   ),
          //   child: const Text(
          //     '',
          //     style: TextStyle(color: Colors.white),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildRegularCard(DashboardItem item) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Icon(item.icon, color: Colors.grey, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                if (item.subtitle != null)
                  Text(
                    item.subtitle!,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),
          if (item.showChevron)
            const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
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
