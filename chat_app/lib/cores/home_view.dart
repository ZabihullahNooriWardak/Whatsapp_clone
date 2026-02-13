import 'package:chat_app/modules/camera/screens/camera_screen.dart';
import 'package:chat_app/modules/chats/models/chat_model.dart';
import 'package:chat_app/modules/chats/screens/chats_view.dart';
import 'package:chat_app/cores/floating_action_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.chats});
  final List<ChatModel> chats;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  late PageController pageController;

  int currentIndex = 0;

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
        children:   [
    CameraScreen(),
    ChatView(chats: widget.chats),
    Center(child: Text('Status')),
    Center(child: Text('Calls')),
  ],
      ),
      floatingActionButton: CustomFloatingActionButton(index: currentIndex),
    );
  }
}
