import 'package:flutter/material.dart';
import 'package:hta/pages/ad_index_page.dart';
import 'package:hta/pages/bookings_user.dart';
//import 'package:hta/pages/home_index_page.dart';
import 'package:hta/pages/hospital_index_page.dart';
import 'package:hta/pages/offers_index_page.dart';
import 'package:hta/pages/profile_index_page.dart';

class IndexController extends StatefulWidget {
  @override
  _IndexControllerState createState() => _IndexControllerState();
}

class _IndexControllerState extends State<IndexController> {
  PageController _pageController = PageController();
  List<Widget> _screens = [
    HospitalIndexPage(),
    BookingsUser(),
    AdsIndexPage(),
    OffersIndexPage(),
    ProfileIndexPage(),
    //HomeMainPage(),
    //WorkoutMainPage()
  ];
  int _selectedIndex = 0;
  void _onPageChanged(int selectedIndex) {
    setState(() {
      _selectedIndex = selectedIndex;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.blueGrey,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_hospital_outlined,
            ),
            label: 'Hospital',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.assignment_outlined,
            ),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.art_track_outlined,
            ),
            label: 'Ads',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_offer_outlined,
            ),
            label: 'Offers',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outlined,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
