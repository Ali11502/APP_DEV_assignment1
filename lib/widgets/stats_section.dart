import 'package:flutter/material.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, 30),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(children: [Text("19", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFF77F00))), Text("Posts")]),
          SizedBox(width: 70),
          Column(children: [Text("32", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFF77F00))), Text("Comments")]),
        ],
      ),
    );
  }
}
