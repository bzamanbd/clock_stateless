import 'package:flutter/material.dart';
import 'dart:async';

class RealTimeClock extends StatelessWidget {
  const RealTimeClock({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(seconds: 1)),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        TimeOfDay time = TimeOfDay.now();
        int hour = time.hourOfPeriod;
        int minute = time.minute;
        int second = DateTime.now().second;
        String period = time.period == DayPeriod.am ? "AM" : "PM";
        TextStyle newStyle =
            Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 40.0);
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("$hour", style: newStyle),
            const SizedBox(width: 5),
            Text(":", style: newStyle),
            const SizedBox(width: 5),
            Text("$minute", style: newStyle),
            const SizedBox(width: 5),
            Text(":", style: newStyle),
            const SizedBox(width: 5),
            Text("$second", style: newStyle),
            const SizedBox(width: 5),
            Text(period, style: newStyle),
          ],
        );
      },
    );
  }
}
