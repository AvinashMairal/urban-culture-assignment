import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skincare_demo/screens/routine_screen.dart';
import 'package:skincare_demo/screens/streaks_screen.dart';
import 'package:skincare_demo/utils/app_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;
  String appTitle = "Daily Skincare";

  static const List<Widget> _widgetOptions = <Widget>[
    RoutineScreen(),
    StreaksScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      currentPageIndex = index;
      appTitle = currentPageIndex == 0 ? "Daily Skincare" : "Streaks";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          appTitle,
          style: GoogleFonts.epilogue(
            fontWeight: FontWeight.w700,
            color: const Color.fromRGBO(28, 13, 18, 1),
            fontSize: 18,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: _widgetOptions.elementAt(currentPageIndex),
            ),
            const Divider(
              height: 0,
              color: AppColors.greyColor,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          unselectedLabelStyle: GoogleFonts.epilogue(
            fontWeight: FontWeight.w500,
            color: AppColors.secondaryColor,
            fontSize: 12,
          ),
          selectedLabelStyle: GoogleFonts.epilogue(
            fontWeight: FontWeight.w500,
            color: AppColors.secondaryColor,
            fontSize: 12,
          ),
          //unselectedItemColor: AppColors.secondaryColor,
          selectedItemColor: AppColors.secondaryColor,
          currentIndex: currentPageIndex,
          onTap: _onItemTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              //  selectedIcon: Image.asset('assets/images/search_icon.png',height: 32,width: 24,),
              icon: Image.asset(
                'assets/images/search_icon.png',
                height: 32,
                width: 24,
              ),
              label: 'Routine',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/person_group.png',
                height: 32,
                width: 24,
              ),
              label: 'Streaks',
            ),
          ]),
    );
  }
}
