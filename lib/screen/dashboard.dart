
import 'package:flutter/material.dart';
import 'package:roomdemo/screen/homeScreen.dart';
import 'package:roomdemo/screen/leadsScreen.dart';
import 'package:roomdemo/screen/moreScreen.dart';
import 'package:roomdemo/screen/reportScreen.dart';
import 'package:roomdemo/screen/tasksScrren.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  // List of Screens corresponding to the bottom navigation tabs
  final List<Widget> _screens = [
    const HomeScreen(),
    const LeadsScreen(),
    const TaskScreen(),
    const ReportScreen(),
    const MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: IndexedStack(
        index: _currentIndex,
        children: _screens, // Display the corresponding screen
      ),
      bottomNavigationBar: BottomNavigationBar(
         type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the index to switch between screens
          });
        },
        iconSize: 20,
        items: const [
          BottomNavigationBarItem(
            
            label: 'Home',
            icon: Icon(Icons.home_outlined,color: Colors.grey,),
            activeIcon: Icon(Icons.home,color: Colors.red,),
          ),
          BottomNavigationBarItem(
            label: 'Leads',
            icon: Icon(Icons.leaderboard_outlined,color: Colors.grey,),
            activeIcon: Icon(Icons.leaderboard, color: Colors.red,),
          ),
          BottomNavigationBarItem(
            label: 'Tasks',
            icon: Icon(Icons.task_outlined,color: Colors.grey,),
            activeIcon: Icon(Icons.task, color: Colors.red,),
          ),
          BottomNavigationBarItem(
            label: 'Reports',
            icon: Icon(Icons.bar_chart_outlined,color:Colors.grey,),
            activeIcon: Icon(Icons.bar_chart,color:  Colors.red,),
          ),
          BottomNavigationBarItem(
            label: 'More',
            icon: Icon(Icons.more_horiz,color: Colors.grey,),
            activeIcon: Icon(Icons.more,color: Colors.red,),
          ),
        ],
      ),
    );
  }
}