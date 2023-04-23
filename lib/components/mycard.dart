

import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final Color _color;
  final Widget childWidget;
  final Function? onPress;

  const MyCard(this._color, this.childWidget, [this.onPress]);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPress != null) {
          onPress!();
        }
      },
      child: Card(
        elevation: 10,
        color: _color,
        shadowColor: Colors.orange[900],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(10),
        child: childWidget,
      ),
    );
  }
}