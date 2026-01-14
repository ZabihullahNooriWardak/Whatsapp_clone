import 'package:chat_app/modules/chats/screens/chat_view.dart';
import 'package:chat_app/utils/helpers/floating_action_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  late PageController pageController;

  int currentIndex = 0;

  List<Widget> pages = [
    Center(child: Text('Camera')),
    ChatView(),
    Center(child: Text('Status')),
    Center(child: Text('Calls')),
  ];

  @override
  initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Whatsapp Clone"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          PopupMenuButton(
            onSelected: (value) {},
            itemBuilder: (context) => [
              PopupMenuItem(child: Text("New group")),
              PopupMenuItem(child: Text("Settings")),
              PopupMenuItem(child: Text("Logout")),
            ],
          ),
        ],
        bottom: TabBar(
          onTap: (value) {
            pageController.jumpToPage(value);

            setState(() {
              currentIndex = value;
            });
          },
          controller: _tabController,
          // indicatorColor: Colors.white,
          tabs: [
            Tab(icon: Icon(Icons.camera_alt)),
            Tab(text: "CHATS"),
            Tab(text: "STATUS"),
            Tab(text: "CALLS"),
          ],
        ),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (value) {
          _tabController!.index = value;

          setState(() {
            currentIndex = value;
          });
        },
        children: pages,
      ),
      floatingActionButton: CustomFloatingActionButton(index: currentIndex),
    );
  }
}
