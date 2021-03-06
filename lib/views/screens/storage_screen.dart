import 'package:bracuspace_flutter/shared/shared.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../models/storage.dart';
import '../widgets/storage_list.dart';

class StorageDetailScreen extends StatefulWidget {
  const StorageDetailScreen({Key? key}) : super(key: key);

  @override
  State<StorageDetailScreen> createState() => _StorageDetailScreenState();
}

class _StorageDetailScreenState extends State<StorageDetailScreen> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Storage'),
        elevation: 0.0,
        foregroundColor: kSecondary,
        backgroundColor: themeData.scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: AspectRatio(
                aspectRatio: 1.4,
                child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                        touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    }),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: 40,
                    sections: showingSections(),
                  ),
                ),
              ),
            ),
            const Text(
              'Available',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              '14.64 GB',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Total 15 GB',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 30.0),
            Expanded(
              child: ListView.builder(
                itemCount: storageItems.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) => StorageListTile(
                  title: storageItems[i].title,
                  subtitle: storageItems[i].subtitle ?? '',
                  value: storageItems[i].value,
                  color: storageItems[i].color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            value: 15,
            showTitle: false,
            radius: radius,
            color: const Color(0xFF4CE364),
          );
        case 1:
          return PieChartSectionData(
            value: 40,
            showTitle: false,
            radius: radius,
            color: const Color(0xFF567DF4),
          );
        case 2:
          return PieChartSectionData(
            value: 30,
            showTitle: false,
            radius: radius,
            color: const Color(0xFF22215B),
          );
        case 3:
          return PieChartSectionData(
            value: 20,
            showTitle: false,
            radius: radius,
            color: const Color(0xFFFFC700),
          );
        default:
          throw Error();
      }
    });
  }
}
