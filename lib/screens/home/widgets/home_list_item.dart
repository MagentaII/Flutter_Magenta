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
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: icon,
        title: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        tileColor: Colors.white,
      ),
    );
  }
}