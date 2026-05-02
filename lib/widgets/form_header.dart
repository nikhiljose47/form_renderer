import 'package:flutter/material.dart';

class FormHeader extends StatelessWidget {
  final String title;
  final int currentIndex;
  final int total;

  const FormHeader({
    super.key,
    required this.title,
    required this.currentIndex,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(
            "Page ${currentIndex + 1} of $total",
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
