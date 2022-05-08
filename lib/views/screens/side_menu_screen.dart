import 'package:bracuspace_flutter/models/menu.dart';
import 'package:bracuspace_flutter/shared/shared.dart';
import 'package:bracuspace_flutter/views/screens/landing_screen.dart';
import 'package:flutter/material.dart';

class SideMenuScreen extends StatelessWidget {
  const SideMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackground,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 210.0,
                    height: 107.0,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(53.5),
                      ),
                    ),
                    child: Container(
                      width: 114.0,
                      height: 44.24,
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 33.0,
                            height: 33.0,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                              image: DecorationImage(image: AssetImage(Assets.profileImage)),
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tanvir Rahman',
                                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: kTextHeading),
                              ),
                              Text(
                                '13.29 GB out of 15 GB used',
                                style: TextStyle(fontSize: 10.0, color: kTextSubtitle),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      splashRadius: 20.0,
                      icon: Image.asset(
                        Assets.close,
                        width: 15.0,
                        height: 15.0,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: List.generate(
                  menuItems.length,
                  (i) => ListTile(
                    onTap: menuItems[i].route != null
                        ? () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => menuItems[i].route as Widget, settings: RouteSettings(name: menuItems[i].route.toString())),
                            )
                        : null,
                    minLeadingWidth: 26.0,
                    contentPadding: const EdgeInsets.all(0),
                    leading: i == 0 ? Container(width: 4.0, color: darken(kPrimary), height: double.infinity) : const SizedBox(),
                    title: Text(
                      menuItems[i].title,
                      style: TextStyle(fontWeight: i == 0 ? FontWeight.w800 : FontWeight.normal),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => const LandingScreen()),
                        );
                      },
                      icon: Image.asset(Assets.logout, scale: 3.0),
                      label: Text(
                        'Logout',
                        style: TextStyle(fontSize: 16.0, color: kTextHeading, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  const SizedBox(height: 60.0),
                  const Padding(
                    padding: EdgeInsets.only(left: 40.0, bottom: 20.0),
                    child: Text(
                      'Version 1.0.0',
                      style: TextStyle(fontSize: 10.0, color: Color(0xFF3A4276)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
