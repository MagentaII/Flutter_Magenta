import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_magenta/helper/image_helper.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import '../../../injection/service_locator.dart';
import '../widgets/bottom_sheet.dart';
import '../widgets/expandable_text.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff353C5F),
      appBar: AppBar(
        backgroundColor: const Color(0xff353C5F),
        title: const Text(
          'Profile',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22.0, color: Colors.white),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person_rounded,
                size: 32,
                color: Colors.white,
              )),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              icon: const Icon(
                Icons.edit,
                size: 28,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: 70,
            bottom: -50,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: SizedBox(
                width: 200,
                child: Card(
                  color: const Color(0xfff5fafb),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0), // 调整圆角的大小
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: MediaQuery.of(context).size.width / 2 - 64,
            child: const MyAvatar(initials: 'MA'),
          ),
          const Positioned(
            top: 136,
            left: 16,
            right: 16,
            child: ProfileContent(),
          )
        ],
      ),
    );
  }
}

/// ============================================================================

class MyAvatar extends StatefulWidget {
  final String initials;

  const MyAvatar({super.key, required this.initials});

  @override
  State<MyAvatar> createState() => _MyAvatarState();
}

class _MyAvatarState extends State<MyAvatar> {
  File? _image;
  late Box<String> _myAvatarBox;
  final imageHelper = getIt<ImageHelper>();

  @override
  void initState() {
    super.initState();
    _myAvatarBox = Hive.box<String>('myAvatarBox');
    _loadAvatar();
  }

  void _loadAvatar() {
    final storedImagePath = _myAvatarBox.get(1);
    if (storedImagePath != null) {
      setState(() {
        _image = File(storedImagePath);
      });
    }
  }

  void _writeData(File image) {
    _myAvatarBox.put(1, image.path);
  }

  Future<void> _selectPhoto() async {
    createBottomSheet(
      context: context,
      items: [
        BottomSheetItem(
          icon: Icons.camera_alt,
          title: 'Take Photo',
          onTap: () async {
            final file =
                await imageHelper.pickImage(source: ImageSource.camera);
            if (file != null) {
              final croppedFile = await imageHelper.cropImage(file: file);
              if (croppedFile != null) {
                setState(() {
                  _image = File(croppedFile.path);
                  _writeData(_image!);
                });
              }
            }
          },
        ),
        BottomSheetItem(
          icon: Icons.photo_library,
          title: 'Choose from Gallery',
          onTap: () async {
            final file =
                await imageHelper.pickImage(source: ImageSource.gallery);
            if (file != null) {
              final croppedFile = await imageHelper.cropImage(file: file);
              if (croppedFile != null) {
                setState(() {
                  _image = File(croppedFile.path);
                  _writeData(_image!);
                });
              }
            }
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: GestureDetector(
            onTap: _selectPhoto,
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
        ),
        const SizedBox(height: 8),
        const Text(
          'Evan Lin',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

/// ============================================================================

class ProfileContent extends StatefulWidget {
  const ProfileContent({super.key});

  @override
  State<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 56.0),
        // Add space at the top to avoid overlapping with the avatar
        Card(
          color: Colors.white,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'About',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                ExpandableText(
                  text: _biography,
                  isExpanded: _isExpanded,
                  onToggle: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String get _biography => '''
你好！我是Evan，一位喜歡探索未知世界的數位遊牧民族。我對科技、藝術和冒險充滿熱情，平時喜歡閱讀科幻小說和探索城市秘密。我的座右銘是「生活是一場精彩的冒險」，希望能和志同道合的朋友一起分享生活中的每一個小驚喜。歡迎來到我的世界！
(from ChatGPT)''';
}

/// ============================================================================
