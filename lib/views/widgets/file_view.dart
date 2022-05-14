import 'package:bracuspace_flutter/models/models.dart';
import 'package:bracuspace_flutter/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/files.dart';
import '../../shared/color_conversion.dart';

class FileView extends StatelessWidget {
  const FileView({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: lighten(Colors.indigo).withOpacity(0.1),
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              child: FutureBuilder<List<Files>>(
                  future: fileList,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data![index].name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ));
                    } else {
                      return Container();
                    }
                  }),
            ),
            Positioned(
              top: 35,
              child: FutureBuilder<List<Files>>(
                  future: fileList,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                          "${snapshot.data![index].size} bytes, ${DateFormat('MMM d, yyyy').format(snapshot.data![index].created as DateTime)}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ));
                    } else {
                      return Container();
                    }
                  }),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Spacer(),
                    PopupMenuButton(
                      onSelected: (value) {
                        if (value == 'download') {
                          // print("KI HOCCHE ESHOB");
                        }
                        if (value == 'delete') {
                          // fileList.removeAt(index);
                        }
                      },
                      itemBuilder: (context) {
                        return [
                          const PopupMenuItem(
                            value: 'open',
                            child: Text('Open'),
                          ),
                          const PopupMenuItem(
                            value: 'download',
                            child: Text('Download'),
                          ),
                          const PopupMenuItem(
                            value: 'rename',
                            child: Text('Rename'),
                          ),
                          const PopupMenuItem(
                            value: 'delete',
                            child: Text('Delete'),
                          ),
                        ];
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
