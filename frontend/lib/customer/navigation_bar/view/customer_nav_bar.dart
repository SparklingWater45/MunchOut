import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:itdma3_mobile_app/customer/available_events/available_events.dart';
import 'package:itdma3_mobile_app/customer/bookings/bookings.dart';
import 'package:itdma3_mobile_app/customer/edit_profile/view/customer_edit_profile_page.dart';

class NavBar extends StatelessWidget {
  NavBar({Key? key, required this.navIndex}) : super(key: key);

  final Color themeColor = const Color.fromRGBO(27, 92, 151, 1);
  final int navIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        child: GNav(
          rippleColor: Colors.lightBlue,
          color: Colors.black,
          activeColor: Colors.white,
          tabBackgroundColor: themeColor,
          padding: const EdgeInsets.all(12),
          gap: 20,
          tabs: const [
            GButton(
              icon: Icons.person_pin_circle_sharp,
              text: 'Profile',
            ),
            GButton(
              icon: Icons.cookie,
              text: 'Events',
            ),
            GButton(
              icon: Icons.book,
              text: 'Bookings',
            ),
          ],
          selectedIndex: navIndex,
          onTabChange: (index) {
            if (index == navIndex) {
              return;
            }
            if (index == 0) {
              Navigator.of(context).pushAndRemoveUntil<void>(
                CustomerEditProfilePage.route(),
                (route) => false,
              );
            }
            if (index == 1) {
              Navigator.of(context).pushAndRemoveUntil<void>(
                AvailableEventsPage.route(),
                (route) => false,
              );
            }
            if (index == 2) {
              Navigator.of(context).pushAndRemoveUntil<void>(
                CustomerBookingsPage.route(),
                (route) => false,
              );
            }
          },
        ),
      ),
    );
  }
}
