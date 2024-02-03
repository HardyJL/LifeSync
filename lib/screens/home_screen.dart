import 'package:flutter/material.dart';
import 'package:life_sync/screens/habits_screen.dart';
import 'package:life_sync/screens/mood_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: _onItemTapped,
        selectedIndex: selectedIndex,
        destinations: const <Widget>[
          NavigationDestination(
            label: 'Habits',
            icon: Icon(Icons.self_improvement_outlined),
            selectedIcon: Icon(Icons.self_improvement),
          ),
          NavigationDestination(
            label: 'Home',
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
          ),
          NavigationDestination(
            label: 'Mood',
            icon: Icon(Icons.add_reaction_outlined),
            selectedIcon: Icon(Icons.add_reaction),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text(
          'Life Sync',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: [
        const HabitsScreen(),
        const HomeContent(),
        const MoodsScreen()
      ][selectedIndex],
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
