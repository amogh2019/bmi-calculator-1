import 'package:flutter/material.dart';

class IconForCard extends StatelessWidget {
  final IconData icon;
  final String text;

  const IconForCard({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon),
          Text(
            text,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 5,
                ),
          ),
        ],
      ),
    );
  }
}
