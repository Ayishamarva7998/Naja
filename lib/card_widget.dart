import 'package:flutter/material.dart';
import 'package:naja/widgets/delete.dart';

class SettingsWidget extends StatelessWidget {
  final Function()? onOrdersTap;
  final Function()? onMostOrderedTap;
  final Function()? onLanguageTap;
  final Function()? onHelpCenterTap;
  final Function()? onFAQsTap;
  final Function()? onTermsTap;
  final Function()? onPrivacyTap;
  final Function()? onLogoutTap;

  const SettingsWidget({
    super.key,
    this.onOrdersTap,
    this.onMostOrderedTap,
    this.onLanguageTap,
    this.onHelpCenterTap,
    this.onFAQsTap,
    this.onTermsTap,
    this.onPrivacyTap,
    this.onLogoutTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(left: 12),
      children: [
        _buildMenuItem(
          image: 'assets/orders.png', // Replace with your image path
          title: 'Orders',
          subtitle: 'View and manage all your previous orders',
          onTap: onOrdersTap ?? () {},
        ),
        _buildMenuItem(
          image: 'assets/mostlyorderd.png', // Replace with your image path
          title: 'Mostly Ordered',
          subtitle: 'Reorder your most frequently purchased items quickly',
          onTap: onMostOrderedTap ?? () {},
        ),
         SizedBox(height: 10,),
        _buildMenuItem(
          image: 'assets/language.png', // Replace with your image path
          title: 'Language',
          subtitle: 'English',
          showTrailingArrow: true,
          onTap: onLanguageTap ?? () {},
        ),
        _buildMenuItem(
          image: 'assets/helpcenter.png', // Replace with your image path
          title: 'Help Center',
          onTap: onHelpCenterTap ?? () {},
        ),
        _buildMenuItem(
          image: 'assets/fAQ.png', // Replace with your image path
          title: 'FAQs',
          onTap: onFAQsTap ?? () {},
        ),
        _buildMenuItem(
          image: 'assets/terms.png', 
          title: 'Terms and Conditions', // Fix title mismatch here
          onTap: onTermsTap ?? () {},
        ),
        _buildMenuItem(
          image: 'assets/privacy.png', // Replace with your image path
          title: 'Privacy Policy',
          onTap: onPrivacyTap ?? () {},
        ),
        _buildMenuItem(
          image: 'assets/logout.png', // Replace with your image path
          title: 'Logout',
          onTap: onLogoutTap ?? () {
            showLogoutDialog(context);
          },
        ),
      ],
    );
  }

  Widget _buildMenuItem({
    required String image,
    required String title,
    String? subtitle,
    bool showTrailingArrow = false,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 12.0), // Reduced padding for smaller container
          leading: Image.asset(image, width: 20, height: 20), // Reduced icon size
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 14, 
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: subtitle != null
              ? Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12, // Reduced font size for subtitle
                  ),
                )
              : null,
          trailing: showTrailingArrow
              ? const Icon(Icons.chevron_right, color: Colors.black54)
              : null,
          onTap: onTap,
        ),
        const Divider(  // Underline effect
          color: Colors.grey,
          thickness: 1,
          indent: 2,
          endIndent: 16,
        ),
      ],
    );
  }
}
