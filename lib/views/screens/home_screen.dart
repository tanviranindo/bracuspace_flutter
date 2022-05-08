import 'package:bracuspace_flutter/views/screens/side_menu_screen.dart';
import 'package:bracuspace_flutter/shared/shared.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      drawer: const SideMenuScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
                    style: TextStyle(fontSize: 24.0, color: kSecondary, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  IconButton(
                    alignment: Alignment.centerRight,
                    onPressed: () {
                      return _scaffoldKey.currentState!.openDrawer();
                    },
                    splashRadius: 20.0,
                    icon: Image.asset(Assets.union, width: 20.0),
                  )
                ],
              ),
            ),
            Container(
              height: 55.0,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFEEF2FE), width: 3.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: 'Search files',
                  icon: Icon(Icons.search, color: kSecondary),
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
                      'Recent',
                      style: TextStyle(fontSize: 15.0, color: kSecondary, fontWeight: FontWeight.bold),
                    ),
                    const Icon(Icons.keyboard_arrow_down_rounded)
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      splashRadius: 20.0,
                      icon: Icon(Icons.table_rows, color: kSecondary),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
