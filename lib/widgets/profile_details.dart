import 'package:flutter/material.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Ali Iqbal",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFFD62828)),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 300,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Ali Iqbal exists. Ali Iqbal rebuilds. Ali Iqbal innovates. "
                  "What's next? Only time will tell....",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
