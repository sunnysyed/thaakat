import 'package:flutter/material.dart';
import 'package:thaakat_foundation/screens/news/news.dart';
import 'package:thaakat_foundation/screens/thaakat/thaakat.dart';
import 'package:thaakat_foundation/util/hexcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Home extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    new ThaakatScreen(),
    new NewsScreen(),
    Text(
      'Events',
      style: optionStyle,
    ),
    Text(
      'Projects',
      style: optionStyle,
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
      appBar: AppBar(
        title: Image.asset(
          'assets/images/icons/thaakat-logo.png',
          width: 250,
        ),
        backgroundColor: HexColor("#33668a"),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.fistRaised),
            title: Text('Thaakat'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.newspaper),
            title: Text('News'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.calendarCheck),
            title: Text('Events'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            title: Text('More'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: new HexColor("#33668a"),
        onTap: _onItemTapped,
      ),
    );
  }
}
