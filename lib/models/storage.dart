import 'package:bracuspace_flutter/shared/shared.dart';
import 'package:flutter/material.dart';

class Storage {
  String title;
  String? subtitle;
  double value;
  Color? color;

  Storage({
    required this.title,
    this.subtitle,
    required this.value,
    this.color,
  });
}

List<Storage> storageItems = [
  Storage(
    title: 'Music',
    subtitle: '0.36 GB',
    color: kSecondary,
    value: 0.2,
  ),
  Storage(
    title: 'Images',
    subtitle: '0.1 GB',
    color: const Color(0xFFFFC700),
    value: 0.1,
  ),
  Storage(
    title: 'Video',
    subtitle: '0.1 GB',
    color: const Color(0xFF4CE364),
    value: 0.1,
  ),
  Storage(
    title: 'Documents',
    subtitle: '0.1 GB',
    color: const Color(0xFF567DF4),
    value: 0.1,
  ),
  Storage(
    title: 'Others',
    subtitle: '0.01 GB',
    color: const Color(0xFFFF842A),
    value: 0.1,
  ),
];
