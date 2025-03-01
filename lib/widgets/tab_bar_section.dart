import 'package:flutter/material.dart';

class TabBarSection extends StatelessWidget {
  final TabController tabController;

  const TabBarSection({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      labelColor: const Color(0xFFD62828),
      labelStyle: const TextStyle(fontWeight: FontWeight.w700),
      unselectedLabelColor: Colors.black54,
      indicator: BoxDecoration(),
      dividerColor: const Color(0xFF575757),
      tabs: const [
        Tab(text: "Posts"),
        Tab(text: "Comments"),
        Tab(text: "Stats"),
      ],
    );
  }
}
