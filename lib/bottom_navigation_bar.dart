import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quantsapp_task/home_page.dart';
import 'package:quantsapp_task/search_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState
    extends State<BottomNavigationBarScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePageScreen(),
    SearchScreen(),
    Text(
      "Music",
    ),
    Text(
      'Profile',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(172, 34, 34, 64),
      body: Stack(
        children: [
          Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white10),
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: IconButton(
                  icon:  Icon(Icons.home_outlined,
                      color:_selectedIndex==0?Colors.white: Colors.white24),
                  onPressed: () {
                    _onItemTapped(0);
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon:  Icon(Icons.search, color:_selectedIndex==1?Colors.white: Colors.white24),
                  onPressed: () {
                    _onItemTapped(1);
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(CupertinoIcons.music_note_2,
                    color:_selectedIndex==2?Colors.white: Colors.white24),
                  onPressed: () {
                    _onItemTapped(2);
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon:  Icon(CupertinoIcons.person,
                        color:_selectedIndex==3?Colors.white: Colors.white24),
                  onPressed: () {
                    _onItemTapped(3);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
