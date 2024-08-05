import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  const ReuseableCard(
      {super.key, required this.mycolour, required this.cardChild, required this.onPress});

  final Color mycolour;
  final Widget cardChild;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          color: mycolour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: const EdgeInsets.all(15.0),
        child: cardChild,
      ),
    );
  } //commit
}
