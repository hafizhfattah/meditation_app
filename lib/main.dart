import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meditation_app/pages/home_page.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';

import 'pages/calendar_page.dart';
import 'pages/meditation_page.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 1));

    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationPage(),
    );
  }
}

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int currentIndex = 0;
  //Pages
  final screens = [
    const HomePage(),
    const MeditationPage(),
    const CalendarPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FlashyTabBar(
        animationDuration: const Duration(seconds: 1),
        selectedIndex: currentIndex,
        showElevation: true,
        onItemSelected: (index) => setState(() {
          currentIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            icon: const Icon(CupertinoIcons.home),
            title: Text("Home",
                style: GoogleFonts.montserrat(
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600,
                )),
          ),
          FlashyTabBarItem(
            icon: const Icon(CupertinoIcons.music_note),
            title: Text("Meditation",
                style: GoogleFonts.montserrat(
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600,
                )),
          ),
          FlashyTabBarItem(
            icon: const Icon(CupertinoIcons.calendar),
            title: Text("Calendar",
                style: GoogleFonts.montserrat(
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600,
                )),
          ),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}
