import 'dart:io';

import 'package:bracuspace_flutter/shared/shared.dart';
import 'package:bracuspace_flutter/views/screens/side_menu_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../widgets/file_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: const SideMenuScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result =
              await FilePicker.platform.pickFiles(allowMultiple: true);
          if (result == null) return;
          final files = result.files.first;

          List<UploadTask> tasks = <UploadTask>[];
          final FirebaseAuth auth = FirebaseAuth.instance;
          final User user = auth.currentUser!;

          final Reference ref =
              FirebaseStorage.instance.ref(user.email).child(files.name);
          final UploadTask task = ref.putFile(File(files.path!));
          tasks.add(task);
        },
        backgroundColor: kSecondary,
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            SafeArea(
              child: Row(
                children: [
                  Text(
                    'BRACU Space',
                    style: TextStyle(
                        fontSize: 24.0,
                        color: kSecondary,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  IconButton(
                    alignment: Alignment.centerRight,
                    onPressed: () {
                      return scaffoldKey.currentState!.openDrawer();
                    },
                    splashRadius: 20.0,
                    icon: Image.asset(Assets.union, width: 20.0),
                  )
                ],
              ),
            ),
            Container(
              height: 55.0,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFFEEF2FE),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Folder',
                  icon: Icon(
                    Icons.search,
                    color: kSecondary,
                  ),
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                Row(
                  children: [
                    Text(
                      'List of files',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: kSecondary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down_rounded,
                    )
                  ],
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: GridView.builder(
                  itemCount: 4,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 4.2,
                  ),
                  itemBuilder: (context, index) => FileView(
                    index: index,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

// late Future<int> lengthOfFile;
//
// static Future<int> _getFileLength() async {
//   return await fileList.then((value) {
//     return value.length;
//   });
// }
// Future<File> saveFilePermanently(PlatformFile file) async {
//   final appStorage = await precacheImage(provider, context);
//   final newFile = File(appStorage.path + '/' + file.name, name: 'newFile');
// }
}
