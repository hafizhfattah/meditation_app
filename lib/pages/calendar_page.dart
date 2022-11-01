import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../utils.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Calendar",
                  style: GoogleFonts.montserrat(
                    fontSize: 25,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                    color: black,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              SfCalendar(
                view: CalendarView.day,
                allowedViews: const [
                  CalendarView.day,
                  CalendarView.week,
                  CalendarView.month,
                  CalendarView.schedule
                ],

                appointmentTextStyle: font,
                showCurrentTimeIndicator: true,
                showDatePickerButton: true,
                showNavigationArrow: true,
                showWeekNumber: true,
                // headerStyle: font,
                todayTextStyle: font,
                // viewHeaderStyle: font,
                // weekNumberStyle: font,

                allowDragAndDrop: true,
                allowViewNavigation: true,
                allowAppointmentResize: true,
                monthViewSettings: const MonthViewSettings(showAgenda: true),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100.0,
                      width: 50,
                      decoration: const BoxDecoration(
                        color: teal,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            16.0,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("May",
                                style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w500,
                                  color: black,
                                )),
                            Text("20",
                                style: GoogleFonts.montserrat(
                                  fontSize: 25,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  color: black,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    height: 100.0,
                    width: 200,
                    decoration: const BoxDecoration(
                      color: yellow,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          16.0,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Your Meditation: Love-kind",
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                color: black,
                              )),
                          Text("25 Minute",
                              style: GoogleFonts.montserrat(
                                fontSize: 14,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500,
                                color: black,
                              )),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 100,
                      width: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: black,
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        onPressed: () {
                          var snackBar = SnackBar(
                            elevation: 0,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              title: 'Success Sended!',
                              message:
                                  'ou have successfully read this message. Please continue working!',
                              contentType: ContentType.success,
                            ),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: const Icon(
                          CupertinoIcons.forward,
                          size: 24.0,
                          color: white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text("Free Hours",
                  style: GoogleFonts.montserrat(
                    fontSize: 25,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                    color: black,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: hour.length,
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
                          "${hour[index]}",
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
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: black,
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(64.0),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Submit",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            color: white,
                            fontSize: 16,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
