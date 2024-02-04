import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:life_sync/models/diary_entry.dart';
import 'package:life_sync/screens/habits_screen.dart';
import 'package:life_sync/screens/mood_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 2;

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
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        slivers: [
          SliverAppBar(
            expandedHeight: 90,
            // collapsedHeight: 60,
            // pinned: true,
            // forceMaterialTransparency: true,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 8, bottom: 8),
              centerTitle: false,
              title: Text(
                'Life Sync',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
          SliverFillRemaining(
              child: Padding(
            padding: const EdgeInsets.all(12),
            child: [
              const HabitsScreen(),
              const HomeContent(),
              const MoodsScreen()
            ][selectedIndex],
          ))
        ],
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({
    super.key,
  });

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List<DiaryEntry> entries = [
    DiaryEntry(
      timeStamp: DateTime.now(),
      text:
          'This is a test of a long message that would be a part of this app and there would be \n\nsome more that we could see here and we would add some more regarding the issues that we had during the day and I am still rambling on and on about the day in order to get text in here',
    ),
    DiaryEntry(
      timeStamp: DateTime.now(),
      text:
          'This is a test of a long message that would be a part of this app and there would be some more that we could see here to get text in here',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Card(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        entries[index].text,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(
                      height: 1,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Text(
                            DateFormat(DateFormat.YEAR_ABBR_MONTH_WEEKDAY_DAY)
                                .format(entries[index].timeStamp)
                                .toString(),
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ),
                        IconButton(
                          padding: const EdgeInsets.all(0),
                          constraints: const BoxConstraints(
                            minHeight: 24,
                            minWidth: 24,
                          ),
                          icon: const Icon(
                            Icons.more_horiz_outlined,
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ],
                ),
              ));
            },
            itemCount: entries.length,
          ),
        ),
        FloatingActionButton(
          child: const Icon(
            Icons.add,
            grade: 240,
          ),
          onPressed: () {},
        )
      ],
    );
  }
}
