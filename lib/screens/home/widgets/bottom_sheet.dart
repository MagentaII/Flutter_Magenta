import 'package:flutter/material.dart';

void createBottomSheet({
  required BuildContext context,
  required List<BottomSheetItem> items,
  ShapeBorder? shape,
  EdgeInsetsGeometry? padding,
}) {
  showModalBottomSheet(
    context: context,
    shape: shape ??
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
        ),
    isScrollControlled: true,
    builder: (context) {
      return Padding(
        padding: padding ?? const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: items
              .map((item) => Column(
                    children: [
                      ListTile(
                        leading: Icon(item.icon, size: 32.0),
                        title: Text(item.title,
                            style: const TextStyle(fontSize: 18.0)),
                        onTap: () async {
                          Navigator.pop(context);
                          item.onTap();
                        },
                      ),
                      if (item != items.last) const Divider(height: 24.0),
                    ],
                  ))
              .toList(),
        ),
      );
    },
  );
}

class BottomSheetItem {
  final IconData icon;
  final String title;
  final void Function() onTap;

  BottomSheetItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });
}
