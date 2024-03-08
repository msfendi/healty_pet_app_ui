import 'package:flutter/material.dart';
import 'package:healthy_pet_app/screen/home_screen.dart';

class DashboardScreen extends StatefulWidget {
  final int currentTab;
  const DashboardScreen({Key? key, required this.currentTab}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late int _selectedIndex;
  final List<Widget> _pages = [
    // const HomePage(),
    // const SearchPage(),
    const HomeScreen(),
    // const Center(
    //   child: Text('This Page 1'),
    // ),
    const Center(
      child: Text('This Page 2'),
    ),
    const Center(
      child: Text('This Page 3'),
    ),
    const Center(
      child: Text('This Page 4 '),
    ),
  ];

  void _onItemTapped(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  @override
  void initState() {
    _selectedIndex = widget.currentTab;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[200],
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.home_outlined,
              color: Colors.grey[300],
            ),
            activeIcon: Icon(
              Icons.home_rounded,
              color: Colors.deepPurple[400],
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.favorite_outline_rounded,
              color: Colors.grey[300],
            ),
            activeIcon: Icon(
              Icons.favorite_outline_rounded,
              color: Colors.deepPurple[400],
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.chat_bubble_outline_rounded,
              color: Colors.grey[300],
            ),
            activeIcon: Icon(
              Icons.chat_bubble_outline_rounded,
              color: Colors.deepPurple[400],
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.person_outline_rounded,
              color: Colors.grey[300],
            ),
            activeIcon: Icon(
              Icons.person_outline_rounded,
              color: Colors.deepPurple[400],
            ),
          ),
        ],
      ),
    );
  }
}
