import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:myspace_final/pages/Freelancing/fhome.dart';
import 'package:myspace_final/pages/home.dart';
import 'package:myspace_final/pages/order.dart';
import 'package:myspace_final/pages/profile.dart';
import 'package:myspace_final/pages/wallet.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {

  int currentTabIndex = 0;

  late List<Widget> pages;
  late Widget currentPage;
  late Home homepage;
  late Order order;
  late Wallet wallet;
  late FHomePage freelancepage;
  late Profile profile;


  @override
  void initState(){
    homepage = Home();
    order = Order();
    wallet = Wallet();
    freelancepage = FHomePage();
    profile = Profile();
    pages = [homepage, order, wallet, freelancepage, profile];
    // pages = [homepage, order, profile];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          height: 60,
          backgroundColor: Colors.white,
          color: Colors.black,
          animationDuration: Duration(
            milliseconds: 500
          ),
          onTap: (int index) {
            setState(() {
              currentTabIndex = index;
            });
          },
          items: [
            Icon(Icons.home_outlined, color: Colors.white,),
            Icon(Icons.shopping_cart_rounded, color: Colors.white,),
            Icon(Icons.wallet, color: Colors.white,),
            Icon(Icons.laptop_mac, color: Colors.white,),
            Icon(Icons.person, color: Colors.white,),
          ],
      ),
      body: pages[currentTabIndex],
    );
  }
}
