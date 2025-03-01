import 'package:assignment_1/widgets/scrollable_comments.dart';
import 'package:flutter/material.dart';
import '../widgets/curved_appbar.dart';
import '../widgets/profile_avatar.dart';
import '../widgets/profile_details.dart';
import '../widgets/tab_bar_section.dart';
import '../widgets/scrollable_posts.dart';
import '../widgets/stats_section.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              const CurvedAppBar(),
              const ProfileAvatar(),
            ],
          ),
          const ProfileDetails(),
          SizedBox(
            width: MediaQuery.of(context).size.width * .90,
            child: TabBarSection(tabController: _tabController),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                ScrollablePosts(),
                ScrollableComments(),
                StatsSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
