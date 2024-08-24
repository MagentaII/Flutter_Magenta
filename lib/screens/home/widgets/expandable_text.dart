import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final bool isExpanded;
  final VoidCallback onToggle;

  const ExpandableText({
    super.key,
    required this.text,
    this.isExpanded = false,
    required this.onToggle,
  });

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  @override
  Widget build(BuildContext context) {
    final text = widget.text;
    final isExpanded = widget.isExpanded;
    final textWidget = Text(
      text,
      maxLines: isExpanded ? null : 3,
      overflow: isExpanded ? null : TextOverflow.ellipsis,
      style: const TextStyle(fontSize: 18),
    );

    return GestureDetector(
      onTap: widget.onToggle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textWidget,
          const SizedBox(height: 4),
          Text(
            isExpanded ? 'Show Less' : 'Show More',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}