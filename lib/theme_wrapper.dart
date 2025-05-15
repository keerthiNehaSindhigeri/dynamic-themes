
import 'package:dynamic_themes/home_page.dart';
import 'package:dynamic_themes/theme.dart';
import 'package:flutter/material.dart';

class ThemeWrapper extends StatefulWidget {
  const ThemeWrapper({super.key});

  @override
  State<ThemeWrapper> createState() => _ThemeWrapperState();
}

class _ThemeWrapperState extends State<ThemeWrapper> {
  int _selectedIndex = 0;


  late final List<ThemeData> _themes;

  final List<Widget> _pages = const [
    ThemedSection(title: "Red Page"),
    ThemedSection(title: "Green Page"),
    ThemedSection(title: "Blue Page"),
    ThemedSection(title: "Orange Page"),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  void initState() {
    super.initState();
    _themes = [
      ThemeClass.buildTheme(const ColorScheme.light(primary: Colors.red)),
      ThemeClass.buildTheme(const ColorScheme.dark(primary: Colors.green,onSurface: Colors.black12 ),).copyWith(bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.black.withOpacity(0.2),
        
      ),),
      ThemeClass.buildTheme(const ColorScheme.light(primary: Colors.blue)),
      ThemeClass.buildTheme(const ColorScheme.light(primary: Colors.orange)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _themes[_selectedIndex],
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      home: Scaffold(
        body: Theme(
          data: _themes[_selectedIndex],
          child: _pages[_selectedIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onTabTapped,
          selectedItemColor: _themes[_selectedIndex].colorScheme.primary,
          elevation: 3,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Red"),
            BottomNavigationBarItem(
              icon: Icon(Icons.eco),
              label: "Green",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.water),
              label: "Blue",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sunny),
              label: "Orange",
            ),
          ],
        ),
      ),
    );
  }
}

class ThemedSection extends StatelessWidget {
  final String title;

  const ThemedSection({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Title"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyHomePage(title: 'Second Page',),
              ),
            );
          },
          child: const Text('Button with themed color'),
        ),
      ),
    );
  }
}
