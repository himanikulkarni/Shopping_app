import 'package:flutter/material.dart';
import 'package:shopping__app/screens/shopping_screen.dart';

class ProfileScreen extends StatefulWidget {
  static const id = '/Profile_Screen';
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _name,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Enter name'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Shopping_screen(data: _name.text),
                ),
              );
            },
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }

  void passtoShoppingScreen(BuildContext context) {}
}
