import 'package:flutter/material.dart';

class ScrollableComments extends StatelessWidget {
  const ScrollableComments({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> comments = List.generate(
      10,
          (index) => {
        "title": "App Dev",
        "text": "Very interesting course",
        "date": "5 December 2024, 4:30 PM"
      },
    );

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: comments.length,
      itemBuilder: (context, index) {
        return Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, // ✅ Ensures sharp, rectangular edges
          ),
          elevation: 0.5,
          color: Colors.white,
          margin: const EdgeInsets.only(bottom: 10),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comments[index]["title"]!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/arrow.png', scale: 6), // Arrow icon
                    const SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "\"${comments[index]["text"]!}\"",
                          style: const TextStyle(
                              color: Colors.black54,
                              fontStyle: FontStyle.italic),
                        ),
                        Text(
                          comments[index]["date"]!,
                          style: const TextStyle(
                              color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        );
      },
    );
  }
}
