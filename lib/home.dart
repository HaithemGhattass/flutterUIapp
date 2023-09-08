import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food4future/pages/chat.dart';
import 'package:food4future/pages/dashboard.dart';
import 'package:food4future/pages/profile.dart';
import 'package:food4future/pages/setting.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0;
  final List<Widget> screen = [Dashboard(), Setting(), Profile(), Chat()];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Dashboard();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: HexagonFAB(
        onPressed: () {
          // FAB onPressed logic
        },
        size: 72.0,
        iconColor: Color(0xFF34D945), // Set the desired icon color
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF0A1B3D),
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Dashboard();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.mail,
                          color: currentTab == 0 ? Colors.blue : Colors.white,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Chat();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_bag_outlined,
                          color: currentTab == 1 ? Colors.blue : Colors.white,
                          size: 30,
                        ),
                      ],
                    ),
                  )
                ],
              )
              // Right tab bar icons
              ,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Profile();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.dashboard,
                          color: currentTab == 2 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          "profile",
                          style: TextStyle(
                              color:
                                  currentTab == 2 ? Colors.blue : Colors.grey),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Setting();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.dashboard,
                          color: currentTab == 3 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          "Setting",
                          style: TextStyle(
                              color:
                                  currentTab == 3 ? Colors.blue : Colors.grey),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HexagonFAB extends StatelessWidget {
  final VoidCallback onPressed;
  final double size;
  final Color iconColor; // Add this property for the icon color
  final IconData iconData; // Add this property for the icon data

  HexagonFAB({
    required this.onPressed,
    this.size = 56.0,
    this.iconColor = const Color(0xFF34D945), // Default to #34D945
    this.iconData = Icons.add, // Default to plus icon
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: HexagonClipper(),
      child: SizedBox(
        width: size,
        height: size,
        child: FloatingActionButton(
          backgroundColor: Color(0xFF1B2D51),
          onPressed: onPressed,
          child: Icon(iconData,
              color: iconColor, // Set the icon color
              size: 40),
        ),
      ),
    );
  }
}

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var radius = size.width / 2;

    path.moveTo(centerX + radius * cos(0), centerY + radius * sin(0));

    for (var i = 1; i <= 6; i++) {
      var angle = 2 * pi / 6 * i;
      var x = centerX + radius * cos(angle);
      var y = centerY + radius * sin(angle);
      path.lineTo(x, y);
    }

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
