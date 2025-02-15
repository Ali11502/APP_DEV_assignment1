import 'package:flutter/material.dart';
void main() {
  runApp(const UserProfileApp());
}

class UserProfileApp extends StatelessWidget {
  const UserProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const UserProfileScreen(),
    );
  }
}

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              _buildCurvedAppBar(),
              Positioned(
                top: 120,
                left: MediaQuery.of(context).size.width / 2 - 50,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/profile.jpg"), 
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),

          const Text(
            "Ali Iqbal",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.red),
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Ali Iqbal .",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ),
          const SizedBox(height: 10),

 
          _buildTabBar(),


          Expanded(child: _buildTabContent()),
        ],
      ),
    );
  }


  Widget _buildCurvedAppBar() {
    return ClipPath(
      clipper: WavyAppBarClipper(),
      child: Container(
        height: 220,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange, Colors.redAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _tabItem("Posts", 0),
        _tabItem("Comments", 1),
        _tabItem("Stats", 2),
      ],
    );
  }

  Widget _tabItem(String label, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTabIndex = index;
        });
      },
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: selectedTabIndex == index ? Colors.red : Colors.black54,
            ),
          ),
          if (selectedTabIndex == index)
            Container(
              height: 2,
              width: 50,
              color: Colors.red,
              margin: const EdgeInsets.only(top: 5),
            ),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    if (selectedTabIndex == 0) {
      return _buildScrollablePosts();
    } else if (selectedTabIndex == 1) {
      return _buildScrollableComments();
    } else {
      return _buildStats();
    }
  }

  Widget _buildScrollablePosts() {
    final List<String> events = [
      "app dev assignment\n16 Feb 2025, 11:55 PM\nIba karachi\nAli Iqbal",
      "app dev assignment\n16 Feb 2025, 11:55 PM\nIba karachi\nAli Iqbal",
      "app dev assignment\n16 Feb 2025, 11:55 PM\nIba karachi\nAli Iqbal",
      "app dev assignment\n16 Feb 2025, 11:55 PM\nIba karachi\nAli Iqbal",
      "app dev assignment\n16 Feb 2025, 11:55 PM\nIba karachi\nAli Iqbal",
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: events.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 2,
          margin: const EdgeInsets.only(bottom: 12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(events[index]),
          ),
        );
      },
    );
  }

 
Widget _buildScrollableComments() {
  final List<Map<String, String>> comments = [
    {"title": "app dev", "text": "very interesting cours", "date": "5 Dec 2024, 4:30 PM"},
    {"title": "app dev", "text": "very interesting cours", "date": "5 Dec 2024, 4:30 PM"},
    {"title": "app dev", "text": "very interesting cours", "date": "5 Dec 2024, 4:30 PM"},
    {"title": "app dev", "text": "very interesting cours", "date": "5 Dec 2024, 4:30 PM"},
    {"title": "app dev", "text": "very interesting cours", "date": "5 Dec 2024, 4:30 PM"},
    {"title": "app dev", "text": "very interesting cours", "date": "5 Dec 2024, 4:30 PM"},
    {"title": "app dev", "text": "very interesting cours", "date": "5 Dec 2024, 4:30 PM"},
    {"title": "app dev", "text": "very interesting cours", "date": "5 Dec 2024, 4:30 PM"},
    {"title": "app dev", "text": "very interesting cours", "date": "5 Dec 2024, 4:30 PM"},
    {"title": "app dev", "text": "very interesting cours", "date": "5 Dec 2024, 4:30 PM"},
  ];

  return ListView.builder(
    padding: const EdgeInsets.all(16),
    itemCount: comments.length,
    itemBuilder: (context, index) {
      return Card(
        elevation: 2,
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
                  Transform.rotate(
                    angle: 3.14/ 2, 
                    child: const Icon(Icons.subdirectory_arrow_left, size: 22, color: Colors.grey),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      "\"${comments[index]["text"]!}\"",
                      style: const TextStyle(color: Colors.black54, fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 5),

              Text(
                comments[index]["date"]!,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ),
      );
    },
  );
}

  Widget _buildStats() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("19", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Text("Posts"),
            ],
          ),
          SizedBox(width: 40),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("32", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Text("Comments"),
            ],
          ),
        ],
      ),
    );
  }
}

class WavyAppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50);

    path.quadraticBezierTo(size.width * 0.20, size.height, size.width * 0.40, size.height - 30);
    path.quadraticBezierTo(size.width * 0.60, size.height - 60, size.width * 0.80, size.height - 30);
    path.quadraticBezierTo(size.width * 0.95, size.height, size.width, size.height - 50);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}