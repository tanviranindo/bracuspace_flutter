import 'package:bracuspace_flutter/views/screens/screens.dart';
import 'package:flutter/material.dart';

import '../views/screens/profile_screen.dart';

class Menu {
  String title;
  Widget? route;

  Menu({
    required this.title,
    this.route,
  });
}

List<Menu> menuItems = [
  Menu(title: 'Home', route: const HomeScreen()),
  Menu(title: 'Profile', route: const ProfileScreen()),
  Menu(title: 'Storage'),
  Menu(title: 'Subscription'),
  Menu(title: 'Settings'),
  // Menu(title: 'Profile', route: const ProfileScreen()),
  // Menu(title: 'Shared'), route: const SharedScreen()),
  // Menu(title: 'Storage', route: const StorageDetailScreen()),
  // Menu(title: 'Subscription', route: const SubscriptionScreen()),
  // Menu(title: 'Settings', route: const SettingScreen()),
];
