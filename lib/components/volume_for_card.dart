import 'package:bmi_calculator/components/my_volume_button.dart';
import 'package:flutter/material.dart';

class VolumeForCard extends StatelessWidget {
  final int value;
  final String text;
  final Function? onIncrement;
  final Function? onDecrement;

  const VolumeForCard({
    required this.value,
    required this.text,
    this.onIncrement,
    this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 18,
                  ),
            ),
            Text(
              value.toString(),
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontSize: 40,
                  ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyVolumeButton(
                  buttonIcon: const Icon(Icons.remove),
                  onPressed: onDecrement,
                ),
                MyVolumeButton(
                  onPressed: onIncrement,
                ),
//               MaterialButton(
//                 color: Theme.of(context).colorScheme.onPrimaryContainer,
//                 shape: const CircleBorder(),
//                 child: const Icon(Icons.remove),
//                 onPressed: () {},
//               ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
