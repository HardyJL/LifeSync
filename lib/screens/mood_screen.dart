import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:life_sync/models/mood_entry.dart';

class MoodsScreen extends StatefulWidget {
  const MoodsScreen({
    super.key,
  });

  @override
  State<MoodsScreen> createState() => _MoodsScreenState();
}

class _MoodsScreenState extends State<MoodsScreen> {
  final List<MoodEntry> _list = [
    MoodEntry(
      mood: Mood.happy,
      timeStamp: DateTime.now(),
    ),
    MoodEntry(
      mood: Mood.sad,
      timeStamp: DateTime.now(),
    ),
  ];

  Set<Mood> selected = {};
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'How are you feeling today ?',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(
          height: 16,
        ),

        SegmentedButton<Mood>(
          emptySelectionAllowed: true,
          multiSelectionEnabled: false,
          showSelectedIcon: false,
          segments: const [
            ButtonSegment<Mood>(
              value: Mood.happy,
              label: Text('Happy'),
            ),
            ButtonSegment<Mood>(
              value: Mood.neutral,
              label: Text('Neutral'),
            ),
            ButtonSegment<Mood>(
              value: Mood.sad,
              label: Text('Sad'),
            ),
            ButtonSegment<Mood>(
              value: Mood.tired,
              label: Text('Tired'),
            ),
            ButtonSegment<Mood>(
              value: Mood.annoyed,
              label: Text('Annoyed'),
            ),
          ],
          selected: selected,
          onSelectionChanged: (p0) {
            setState(() {
              selected = p0;
            });
          },
        ),
        const SizedBox(
          height: 16,
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(child: Text(_list[index].mood.toString())),
                      Text(
                        DateFormat(DateFormat.YEAR_ABBR_MONTH_WEEKDAY_DAY)
                            .format(_list[index].timeStamp)
                            .toString(),
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: _list.length,
          ),
        )
        // Spacer(),
      ],
    );
  }
}
