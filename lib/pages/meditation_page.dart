import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:draggable_fab/draggable_fab.dart';

import '../utils.dart';

class MeditationPage extends StatefulWidget {
  const MeditationPage({Key? key}) : super(key: key);

  @override
  State<MeditationPage> createState() => _MeditationPageState();
}

class _MeditationPageState extends State<MeditationPage> {
  bool isActive = false;
  int selectedIndex = 0;

  @override
  void initState() {
    _updateAppbar();
    super.initState();
  }

  void _updateAppbar() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: cream,
        toolbarHeight: 50,
        title: Row(
          children: [
            const Spacer(),
            Badge(
              position: BadgePosition.topEnd(),
              badgeContent: Text("3",
                  style: GoogleFonts.montserrat(
                    fontSize: 11,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w400,
                    color: white,
                  )),
              child: const Icon(
                CupertinoIcons.bell_fill,
                color: black,
                size: 30.0,
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
          ],
        ),
      ),
      floatingActionButton: SafeArea(
        child: DraggableFab(
          child: FloatingActionButton(
            backgroundColor: teal,
            onPressed: () {
              setState(() {
                isActive = !isActive;
              });
            },
            child: Icon(
              isActive ? Icons.pause : Icons.play_arrow,
              size: 24.0,
              color: black,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Column(
                children: [
                  Stack(
                    fit: StackFit.loose,
                    children: [
                      Lottie.network(
                        'https://assets7.lottiefiles.com/packages/lf20_kvwtrk4n.json',
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                        frameRate: FrameRate(100),
                        repeat: true,
                        animate: isActive,
                      ),
                      Lottie.network(
                        'https://assets10.lottiefiles.com/packages/lf20_z9gwyc2b.json',
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                        frameRate: FrameRate(100),
                        repeat: true,
                        animate: isActive,
                      ),
                      Lottie.network(
                        'https://assets6.lottiefiles.com/packages/lf20_Kqzytj.json',
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                        frameRate: FrameRate(100),
                        repeat: true,
                        animate: isActive,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text("Relax Meditation",
                      style: GoogleFonts.montserrat(
                        fontSize: 25,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600,
                        color: black,
                      )),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                      "Meditation or thought is the practice of thinking the mind of all the interesting, lazy, or worrying things in our daily life. Interpreting thoughts is the activity of chewing or turning in thoughts, thoughts, thoughts, thoughts.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w500,
                        color: black,
                      )),
                ],
              ),
            )),
      ),
    );
  }
}
