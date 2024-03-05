import 'package:flutter/material.dart';
import 'package:the_cat_pedia/constants/constants.dart';
import 'package:the_cat_pedia/controllers/detail_breed_controller.dart';
import 'package:the_cat_pedia/manager/color_manager.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Setting',
          semanticsLabel: 'Setting Page Title',
        ),
        elevation: 0,
        backgroundColor: AppColors.primary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          ListTile(
            leading: Icon(
              Icons.rate_review,
              color: AppColors.primary,
            ),
            onTap: () {},
            title: const Text(
              "Rate us",
            ),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ),
          const Divider(
            height: 1,
            color: Colors.black12,
          ),
          ListTile(
            leading: Icon(
              Icons.share,
              color: AppColors.primary,
            ),
            onTap: () {},
            title: const Text(
              "Share App",
            ),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ),
          const Divider(
            height: 1,
            color: Colors.black12,
          ),
          ListTile(
            leading: Icon(
              Icons.privacy_tip,
              color: AppColors.primary,
            ),
            onTap: () {
              DetailBreedController.instance.launchUrlWWeb(
                Constants.privacyPolicy,
              );
            },
            title: const Text(
              "Privacy Policy",
            ),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ),
          const Divider(
            height: 1,
            color: Colors.black12,
          ),
          ListTile(
            leading: Icon(
              Icons.bookmark,
              color: AppColors.primary,
            ),
            onTap: () {
              DetailBreedController.instance
                  .launchUrlWWeb(Constants.termsAndConditions);
            },
            title: const Text(
              "Terms And Conditions",
            ),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ),
          const Divider(
            height: 1,
            color: Colors.black12,
          ),
          ListTile(
            leading: Icon(
              Icons.contact_support,
              color: AppColors.primary,
            ),
            onTap: () {
              DetailBreedController.instance.launchEmail(Constants.email);
            },
            title: const Text(
              "Contact support",
            ),
            subtitle: const Text('Send email to our support'),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ),
          const Divider(
            height: 1,
            color: Colors.black12,
          ),
        ],
      ),
    );
  }
}
