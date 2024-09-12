import 'dart:typed_data';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final Uint8List? imageBytes;
  final VoidCallback onEdit;

  const ProfileImage({
    super.key,
    this.imageBytes,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 55,
          backgroundImage: imageBytes != null ? MemoryImage(imageBytes!) : null,
          child: imageBytes == null
              ? const Icon(Icons.person, size: 50, color: Colors.white)
              : null,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(
                  2.5),
              child: IconButton(
                padding:
                EdgeInsets.zero,
                icon: const Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.black,
                  size: 23,
                ),
                onPressed: onEdit,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
