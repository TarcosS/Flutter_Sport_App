import 'package:flutter/material.dart';
import 'package:flutter_learning/layers/presentation/bottomBar/index.dart' as prefix;
import 'package:flutter_learning/layers/presentation/explore/index.dart' as explore;
import 'package:flutter_learning/layers/presentation/home/index.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LearningApp',
      routes: {
        '/explore': (context) => const explore.ExplorePage(title: 'Explore')
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 61, 116, 193)),
        useMaterial3: true,
        fontFamily: GoogleFonts.lato().fontFamily
      ),
      home: const MyHomePage(title: 'Home Page'),
      themeAnimationCurve: Curves.easeInOut,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _routeIndex = 0;
  String _location = 'New York, USA';

  void changeRoute(int index) {
    if(!(_routeIndex == index)) {
      setState(() {
        _routeIndex = index;
      });
    }
  }

  void changeLocation(String str) {
    if(!(_location == str)) {
      setState(() {
        _location = str;
      });
    }
  }

  static final List<Widget> _pages = [
    const HomePage(),
    const Center(
      child: Text('Explore', style: TextStyle(fontSize: 30))
    ),
    const Center(
      child: Text('Favoites', style: TextStyle(fontSize: 30))
    ),
    const Center(
      child: Text('Profile', style: TextStyle(fontSize: 30))
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: prefix.BottomBarNavigation(changeRoute: changeRoute, routeIndex: _routeIndex),
      body: IndexedStack(
        index: _routeIndex,
        children: _pages,
      )
    );
  }
}
