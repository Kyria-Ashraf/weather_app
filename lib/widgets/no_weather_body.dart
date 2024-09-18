import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "There's no weather 😕😕",
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            Text(
              "Start searching now 🔎🔎",
              style: TextStyle(
                fontSize: 32,
              ),
            )
          ],
        ),
      ),
    );
  }
}
