import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_magenta/helper/image_helper.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          SizedBox(height: 120.0),
          MyAvatar(initials: 'MA'),
        ],
      ),
    );
  }
}

final imageHelper = ImageHelper();

class MyAvatar extends StatefulWidget {
  final String initials;

  const MyAvatar({super.key, required this.initials});

  @override
  State<MyAvatar> createState() => _MyAvatarState();
}

class _MyAvatarState extends State<MyAvatar> {
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: FittedBox(
            fit: BoxFit.contain,
            child: CircleAvatar(
              backgroundColor: Colors.grey[300],
              radius: 64,
              foregroundImage: _image != null ? FileImage(_image!) : null,
              child: Text(
                widget.initials,
                style: const TextStyle(fontSize: 48),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        TextButton(
          onPressed: () async {
            final file = await imageHelper.pickImage();
            if (file != null) {
              final croppedFile = await imageHelper.cropImage(file: file);
              if (croppedFile != null) {
                setState(() {
                  _image = File(croppedFile.path);
                });
              }
            }
          },
          child: const Text('Select Photo', style: TextStyle(fontSize: 24)),
        ),
      ],
    );
  }
}