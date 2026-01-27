import 'package:flutter/material.dart';

class HeaderTile extends StatelessWidget {
  const HeaderTile({super.key, required this.name, required this.icon});
  final String name;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.green,
        radius: 25,
        child: Icon(icon,color: Colors.white,),
      ),
      title: Text(name),
    );
  }
}
