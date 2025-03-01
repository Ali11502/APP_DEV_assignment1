import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 170,
      left: MediaQuery.of(context).size.width / 2 - 55,
      child: Container(
        width: 110,
        height: 110,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black, width: 2.0),
        ),
        child: const CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage("assets/profile.jpg"),
        ),
      ),
    );
  }
}
