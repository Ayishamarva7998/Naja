import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final List<DashboardItem> _dashboardItems = [
    DashboardItem(
      title: 'Points Earned',
      image: '',
      color: Colors.indigo,
      isSpecial: true,
    ),
    DashboardItem(
      title: 'Orders',
      subtitle: 'View and manage all your previous orders',
      image: 'assets/orders.png',
    ),
    DashboardItem(
      title: 'Mostly Ordered',
      subtitle: 'Reorder your most frequently purchased items quickly',
      image: 'assets/mostlyorderd.png',
    ),
    DashboardItem(
      title: 'Language',
      subtitle: 'English',
      image: 'assets/language.png',
      showChevron: true,
    ),
    DashboardItem(
      title: 'Help Center',
      image: 'assets/helpcenter.png',
    ),
    DashboardItem(
      title: 'FAQs',
      image: 'assets/fAQ.png',
    ),
    DashboardItem(
      title: 'Terms and Conditions',
      image: 'assets/terms.png',
    ),
    DashboardItem(
      title: 'Privacy Policy',
      image: 'assets/privacy.png',
    ),
    DashboardItem(
      title: 'Logout',
      image: 'assets/logout.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(''),),
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
      child: Container(
        height: 90,
        width: 360,
        
       decoration: BoxDecoration(
        color: const Color.fromARGB(255, 239, 237, 237),
        borderRadius: BorderRadius.circular(12)
       ),
        child: Column(children: [
         
          const Padding(
            padding: EdgeInsets.only(right: 240,),
            child: Text('Hi guest',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700),),
          ),
          
          const Padding(
            padding: EdgeInsets.only(right: 190),
            child: Text('+971 50 987 6543',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 195),
            child: Container(height: 30,width: 100,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),color: const Color.fromARGB(255, 237, 211, 209)),
            child: const Row(children: [
              Icon(Icons.location_on_outlined,size: 14,),Text('Al Saif Gardens',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500),)
            ],),),
          ),

          
         
        ],),
        
        
        
    
// children: [
          // const Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text(
          //       '+971 50 987 6543',
          //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          //     ),
          //     SizedBox(height: 4),
          //     Row(
          //       children: [
          //         Icon(Icons.location_on_outlined),
          //         Text(
          //           'Al Saif Gardens',
          //           style: TextStyle(
          //             color: Colors.black,
          //             fontWeight: FontWeight.w600,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
          // Image.asset(
          //   'assets/edit.png',
          //   height: 24,
          //   width: 24,
          //   color: const Color.fromARGB(255, 8, 0, 0),
          // ),
        // ],
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
            ? _buildPointsCard(context, item)
            : _buildRegularCard(context, item);
      },
    );
  }

  Widget _buildPointsCard(BuildContext context, DashboardItem item) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/background.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "You've Earned: 80 points",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                '80/100 Points (Next Claim: 20 Points Needed)',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
              const SizedBox(height: 20),
              // TextButton(
              //   onPressed: () {
              //     // Add points details navigation logic here
              //   },
              //   child: const Text(
              //     '',
              //     style: TextStyle(color: Colors.white, fontSize: 9),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRegularCard(BuildContext context, DashboardItem item) {
    return InkWell(
      onTap: () {
        if (item.title == 'Logout') {
          showLogoutDialog(context);
        }
        // Add navigation logic for other items here
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade200),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            Image.asset(
              item.image,
              color: Colors.grey,
            ),
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
      ),
    );
  }
}

Future<void> showLogoutDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white, // Set your desired background color here
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        contentPadding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
        actionsPadding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.12,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Are you sure you want to log out?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'You will need to log in again to access your account.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Row(
            children: [
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    side: const BorderSide(color: Color.fromARGB(255, 19, 8, 227), width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Color.fromARGB(255, 19, 8, 227),
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 19, 8, 227),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Add logout logic here
                  },
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}

class DashboardItem {
  final String title;
  final String? subtitle;
  final String image;
  final Color? color;
  final bool showChevron;
  final bool isSpecial;

  DashboardItem({
    required this.title,
    this.subtitle,
    required this.image,
    this.color,
    this.showChevron = false,
    this.isSpecial = false,
  });
}
