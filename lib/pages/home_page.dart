import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: cream,
        toolbarHeight: 85,
        title: Row(
          children: [
            const CircleAvatar(
              backgroundColor: white,
              radius: 26,
              backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=400&q=60",
              ),
            ),
            const SizedBox(
              width: 12.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Welcome Back",
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[700],
                        )),
                    const SizedBox(
                      width: 150.0,
                    ),
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
                Text("Fizfat",
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      color: black,
                    )),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6.0,
                    horizontal: 12.0,
                  ),
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 6,
                        offset: Offset(0, 6),
                      ),
                    ],
                    color: white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          CupertinoIcons.search,
                          color: black,
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          style: font,
                          autofocus: false,
                          cursorWidth: 2,
                          cursorColor: black,
                          initialValue: null,
                          decoration: InputDecoration.collapsed(
                              filled: true,
                              fillColor: Colors.transparent,
                              hintText: "Search",
                              hintStyle: font),
                          onChanged: (value) {},
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          CupertinoIcons.line_horizontal_3_decrease,
                          color: black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: jumlah.length,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x19000000),
                                blurRadius: 6,
                                offset: Offset(0, 6),
                              ),
                            ],
                            color: selectedIndex == index ? black : white,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                12.0,
                              ),
                            ),
                          ),
                          child: Center(
                              child: Text(
                            "${jumlah[index]}",
                            style: GoogleFonts.montserrat(
                              letterSpacing: 1,
                              fontWeight: FontWeight.w500,
                              color: selectedIndex == index ? white : black,
                            ),
                          )),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                ListView.builder(
                  itemCount: lorem.length,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return FittedBox(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x19000000),
                              blurRadius: 6,
                              offset: Offset(0, 6),
                            ),
                          ],
                          color: index.isEven ? yellow : black,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              16.0,
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                FittedBox(
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    height: 30.0,
                                    width: 100,
                                    decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x19000000),
                                          blurRadius: 6,
                                          offset: Offset(0, 6),
                                        ),
                                      ],
                                      color: teal,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          10.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text("${time[index]}",
                                          style: GoogleFonts.montserrat(
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.w600,
                                            color: black,
                                          )),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16.0,
                                ),
                                FittedBox(
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    height: 30.0,
                                    width: 160,
                                    decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x19000000),
                                          blurRadius: 6,
                                          offset: Offset(0, 6),
                                        ),
                                      ],
                                      color: white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          10.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text("${name[index]}",
                                          style: GoogleFonts.montserrat(
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.w600,
                                            color: black,
                                          )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            SizedBox(
                              width: 300,
                              child: Text("${lorem[index]}",
                                  style: GoogleFonts.montserrat(
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w500,
                                    color: index.isEven ? black : white,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
