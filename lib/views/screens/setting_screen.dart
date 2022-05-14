import 'package:bracuspace_flutter/views/screens/screens.dart';
import 'package:flutter/material.dart';

import '../../shared/constants.dart';
import '../../shared/theme_data.dart';
import '../widgets/custom_switch.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> settingItems = [
      // 'Add Account',
      'Change Password',
      // 'Connect Social Account',
      // 'Multiple Account'
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: kSecondary,
        backgroundColor: themeData.scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16.0, bottom: 20.0),
              child: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Column(
              children: List.generate(
                settingItems.length,
                (i) => ListTile(
                  onTap: i == 0
                      ? () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ChangePasswordScreen()))
                      // i == 1 ? () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const UpgradeScreen()))
                      : null,
                  title: Text(settingItems[i]),
                ),
              ),
            ),
            const SizedBox(height: 25.0),
            CustomSwitchListTile(
              title: const Text(
                'Enable Sync',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              value: false,
              onToggle: (bool value) {},
            ),
            CustomSwitchListTile(
              title: const Text(
                'Enable 2 Step Verification',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              value: false,
              onToggle: (bool value) {},
            ),
          ],
        ),
      ),
    );
  }
}
