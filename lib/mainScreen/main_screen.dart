import 'package:drivers_app/tabPage/earning_tab.dart';
import 'package:drivers_app/tabPage/home_tabBar.dart';
import 'package:drivers_app/tabPage/profile_tab.dart';
import 'package:drivers_app/tabPage/rating_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int selectedIndex = 0;
  onItemClicked(int index) {
    setState(() {
      selectedIndex = index;
      tabController!.index = selectedIndex;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: const [
          HomeTabpage(),
          EarningTabpage(),
          ProfileTabpage(),
          RatingTabpage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.credit_card),
      label: "Earnings"),
      BottomNavigationBarItem(icon: Icon(Icons.star_rate),label: "Ratings"),
      BottomNavigationBarItem(icon: Icon(Icons.person),
      label: "Account"),],unselectedItemColor: Colors.amber,
      selectedItemColor: Colors.blue,selectedLabelStyle: const TextStyle(fontSize: 14),
      showUnselectedLabels: true,
      currentIndex: selectedIndex,
      onTap: onItemClicked),
    );
  }
}
