import 'package:flutter/material.dart';

class MoodEntry {
  final Mood mood;
  final DateTime timeStamp;

  MoodEntry({
    required this.mood,
    required this.timeStamp,
  });
}

enum Mood {
  happy,
  neutral,
  sad,
  tired,
  annoyed,
}
