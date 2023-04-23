import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class SliderForCard extends StatelessWidget {
  final double value;
  final String text;
  final Function? onChanged;

  const SliderForCard(
      {required this.value, required this.text, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  value.toString(),
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontSize: 35,
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 7),
                  child: Text(
                    'cm',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ],
            ),
            SizedBox(
//               width: 200,
              child: Slider(
                min: kMinHumanHeight,
                max: kMaxHumanHeight,
                value: value,
                onChanged: (double value) {
                  onChanged?.call(value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
