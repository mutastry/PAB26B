import 'package:flutter/material.dart';
import 'package:pilem/screens/favorite_screen.dart';
import 'package:pilem/screens/home_screen.dart';
import 'package:pilem/screens/search_screen.dart';
void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pilem',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainScreen(),
    );
  }
}
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _SelectedIndex = 0;

  final List<Widget> _screen = [
    HomeScreen(),
    SearchScreen(),
    FavoriteScreen(),
  ];

  void _onItemTapped(int index) {
    setState((){
      _SelectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_SelectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _SelectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
        ],
      ),
    );
  }
}