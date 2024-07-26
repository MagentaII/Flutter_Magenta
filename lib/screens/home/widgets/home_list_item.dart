import 'package:flutter/material.dart';

class HomeListItem extends StatelessWidget {
  final String text;
  final Icon icon;
  final GestureTapCallback onTap;

  const HomeListItem({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128.0,
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Card.outlined(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: const BorderSide(
            color: Colors.black,
            width: 2.0,
          ),
        ),
        child: ListTile(
          leading: icon,
          title: Text(text),
          onTap: onTap,
        ),
      ),
    );
  }
}