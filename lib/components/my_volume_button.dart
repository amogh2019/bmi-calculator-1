
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class MyVolumeButton extends StatelessWidget {
  final Icon buttonIcon;
  final Function? onPressed;

  const MyVolumeButton(
      {this.buttonIcon = const Icon(Icons.add), this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Ink(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        child: IconButton(
            icon: buttonIcon,
            iconSize: kIconButtonCardSize,
            onPressed: () {
              onPressed?.call();
            }),
      ),
    );
  }
}