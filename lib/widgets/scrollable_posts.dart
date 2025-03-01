import 'package:flutter/material.dart';

class ScrollablePosts extends StatelessWidget {
  const ScrollablePosts({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.white,
          elevation: 4,
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            contentPadding: const EdgeInsets.all(12),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset("assets/profile.jpg", width: 80, height: 80, fit: BoxFit.cover),
            ),
            title: const Text("App Dev Assignment", style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text("16 Feb 2025, 11:55 PM\nIBA Karachi", style: TextStyle(color: Colors.black54)),
          ),
        );
      },
    );
  }
}
