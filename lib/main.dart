import 'package:flutter/material.dart';
import 'pages/halaman_profil.dart';
import 'pages/halaman_api.dart';
import 'pages/halaman_counter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contoh Navigasi 3 Halaman',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  static const List<String> _titles = [
    'Halaman Counter',
    'Halaman Universitas',
    'Halaman Profile',
  ];

  static const List<Widget> _pages = [
    HalamanCounter(),
    HalamanUniversitas(),
    const HalamanProfile(),
  ];

  // Widget AppBar dinamis
  AppBar _buildAppBar() => AppBar(title: Text(_titles[_currentIndex]));

  // Widget BottomNavigationBar dinamis
  BottomNavigationBar _buildBottomNavigationBar() => BottomNavigationBar(
    currentIndex: _currentIndex,
    selectedItemColor: Colors.blue,
    onTap: (int index) => setState(() => _currentIndex = index),
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.control_point_duplicate_rounded),
        label: 'Counter',
      ),
      BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Universitas'),
      BottomNavigationBarItem(
        icon: Icon(Icons.supervised_user_circle_outlined),
        label: 'Profile',
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _pages[_currentIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
