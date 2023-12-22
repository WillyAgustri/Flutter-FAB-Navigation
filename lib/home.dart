import 'package:flutter/material.dart';
import 'package:navigation_flutter/page/chat.dart';
import 'package:navigation_flutter/page/dashboard.dart';
import 'package:navigation_flutter/page/profile.dart';
import 'package:navigation_flutter/page/setting.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0;

  final List<Widget> screens = [
    const Chat(),
    const Profile(),
    const Setting(),
    const Dashboard(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const Dashboard();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: bucket, child: currentScreen),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = const Dashboard();
                          currentTab = 0;
                        });
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.dashboard,
                                color: currentTab == 0
                                    ? Colors.blue
                                    : Colors.grey),
                            Text(
                              'Dashboard',
                              style: TextStyle(
                                  color: currentTab == 0
                                      ? Colors.blue
                                      : Colors.grey),
                            )
                          ]),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = const Chat();
                          currentTab = 1;
                        });
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.chat,
                                color: currentTab == 1
                                    ? Colors.blue
                                    : Colors.grey),
                            Text(
                              'Chat',
                              style: TextStyle(
                                  color: currentTab == 1
                                      ? Colors.blue
                                      : Colors.grey),
                            )
                          ]),
                    ),
                  ]),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen = const Setting();
                            currentTab = 3;
                          });
                        },
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.settings,
                                  color: currentTab == 3
                                      ? Colors.blue
                                      : Colors.grey),
                              Text(
                                'Settings',
                                style: TextStyle(
                                    color: currentTab == 3
                                        ? Colors.blue
                                        : Colors.grey),
                              )
                            ]),
                      ),
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen = const Profile();
                            currentTab = 4;
                          });
                        },
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.person,
                                  color: currentTab == 4
                                      ? Colors.blue
                                      : Colors.grey),
                              Text(
                                'Profile',
                                style: TextStyle(
                                    color: currentTab == 4
                                        ? Colors.blue
                                        : Colors.grey),
                              )
                            ]),
                      ),
                    ],
                  )
                ],
              ))),
    );
  }
}
