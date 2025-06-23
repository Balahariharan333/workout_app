import 'package:flutter/material.dart';
import 'package:trail_app/login.dart';
import '../theme_settings_page.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SizedBox(height: 20),

        // Profile Picture
        Center(
          child: CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              'https://media.gettyimages.com/id/1136413215/photo/young-man-at-street-market.jpg?s=612x612&w=gi&k=20&c=XsvT59r4ASMz3tttajBraC9esH7dzZXnBrRdM58ZsW0=',
            ),
          ),
        ),

        const SizedBox(height: 16),

        Center(
          child: Text(
            "Balahariharan",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 8),

        Center(
          child: Text(
            "hari@example.com",
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
        ),

        const SizedBox(height: 32),
        const Divider(),

        // New: Theme Settings
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text("Theme Settings"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ThemeSettingsPage()),
            );
          },
        ),

        
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text("Logout"),
          onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                   (route) => false,
                 );
                },

        ),
      ],
    );
  }
}
