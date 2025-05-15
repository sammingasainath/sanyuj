import 'package:flutter/material.dart';

/// A widget that groups multiple sensor cards under a category title
class SensorGroupWidget extends StatelessWidget {
  final String title;
  final List<Widget> sensorCards;
  final EdgeInsetsGeometry padding;

  const SensorGroupWidget({
    super.key,
    required this.title,
    required this.sensorCards,
    this.padding = const EdgeInsets.symmetric(vertical: 10),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ...sensorCards,
        ],
      ),
    );
  }
}
