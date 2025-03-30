import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Assuming these paths are correct for your project structure
import 'package:firebasechat/core/services/auth_service.dart';
import 'package:firebasechat/core/services/db_services.dart'; // If needed by HomeViewModel
import 'package:firebasechat/ui/screens/home/home_view_model.dart';
import 'package:firebasechat/ui/screens/other/user_provider.dart';
// You might need an actual user model, but using toString() for now as in original code
// import 'package:firebasechat/core/models/user_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // --- Theme Definition ---
  static const Color darkBg = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E); // Slightly lighter for cards/drawers
  static const Color darkAppBarBg = Color(0xFF1F1F1F);
  static const Color darkPrimaryText = Colors.white;
  static const Color darkSecondaryText = Colors.white70;
  static const Color darkAccent = Colors.tealAccent; // Or your app's accent color
  static const Color darkIconColor = Colors.white70;

  @override
  Widget build(BuildContext context) {
    // --- Dummy Chat Data (Replace with actual data from ViewModel) ---
    final List<Map<String, String>> dummyChats = List.generate(
      15,
      (index) => {
        'name': 'Contact ${index + 1}',
        'message': 'This is the last message snippet... ${index * 5}m ago',
        'avatarLetter': String.fromCharCode(65 + index % 26), // A, B, C...
        'time': '${10 + index}: ${30 + index % 30} ${index % 2 == 0 ? "AM" : "PM"}'
      },
    );

    return ChangeNotifierProvider(
      // Assuming HomeViewModel might fetch chats later
      create: (context) => HomeViewModel(dbServices()),
      child: Scaffold(
        backgroundColor: darkBg,
        appBar: AppBar(
          backgroundColor: darkAppBarBg,
          foregroundColor: darkPrimaryText,
          title: const Text('Chats'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: darkIconColor),
              tooltip: 'Search',
              onPressed: () {
                // TODO: Implement Search Action
                print('Search tapped');
              },
            ),
            // Builder context needed to access Scaffold.of() for endDrawer
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu, color: darkIconColor),
                tooltip: 'Menu',
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              ),
            ),
          ],
        ),
        // --- Right Drawer ---
        endDrawer: Drawer(
          backgroundColor: darkSurface,
          child: Consumer<UserProvider>( // Consume UserProvider for header info
            builder: (context, userProvider, _) {
              // Basic loading/error state for user data in drawer header
              Widget headerContent;
              if (userProvider.user == null) {
                headerContent = const Center(child: CircularProgressIndicator(color: darkAccent));
              } else {
                 // Example: Extract display name and email if your user object has them
                 // Replace userProvider.user.toString() with actual properties
                 String userName = "User Name"; // Placeholder
                 String userEmail = "user@example.com"; // Placeholder
                 // Try to get real data if possible, otherwise use placeholders
                 // This part depends heavily on your User object structure
                 // if (userProvider.user is YourUserModel) {
                 //   userName = userProvider.user.displayName ?? "User Name";
                 //   userEmail = userProvider.user.email ?? "user@example.com";
                 // } else {
                    // Fallback if it's not the expected type or properties are null
                    userName = userProvider.user.toString().split(' ').take(2).join(' '); // Basic guess
                 // }


                headerContent = Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 35,
                      backgroundColor: darkAccent,
                      child: Icon(Icons.person, size: 40, color: darkBg),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      userName,
                      style: const TextStyle(
                        color: darkPrimaryText,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      userEmail,
                      style: const TextStyle(
                        color: darkSecondaryText,
                        fontSize: 14,
                      ),
                       maxLines: 1,
                       overflow: TextOverflow.ellipsis,
                    ),
                  ],
                );
              }

              return ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  // Custom Drawer Header
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 50, 16, 16), // Adjust padding (top for status bar)
                    color: darkAppBarBg, // Or a different header color
                    child: headerContent,
                  ),
                  // --- Drawer Items ---
                  _buildDrawerItem(
                    icon: Icons.account_circle,
                    text: 'Profile',
                    onTap: () {
                      Navigator.pop(context); // Close drawer
                      // TODO: Navigate to Profile Screen
                      print('Profile tapped');
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.settings,
                    text: 'Settings',
                    onTap: () {
                      Navigator.pop(context); // Close drawer
                      // TODO: Navigate to Settings Screen
                      print('Settings tapped');
                    },
                  ),
                   _buildDrawerItem(
                    icon: Icons.bookmark_border,
                    text: 'Saved Messages',
                    onTap: () {
                      Navigator.pop(context); // Close drawer
                      // TODO: Navigate to Saved Messages
                      print('Saved Messages tapped');
                    },
                  ),
                   _buildDrawerItem(
                    icon: Icons.people_outline,
                    text: 'Contacts',
                    onTap: () {
                      Navigator.pop(context); // Close drawer
                      // TODO: Navigate to Contacts Screen
                      print('Contacts tapped');
                    },
                  ),
                  const Divider(color: Colors.white24),
                  _buildDrawerItem(
                    icon: Icons.logout,
                    text: 'Logout',
                    onTap: () {
                      Navigator.pop(context); // Close drawer
                      AuthService().logout(); // Perform logout
                      print('Logout tapped');
                    },
                  ),
                ],
              );
            }
          ),
        ),
        // --- Main Body: Chat List ---
        body: Consumer<HomeViewModel>( // Consume ViewModel if it provides chats
          builder: (context, model, _) {
            // In a real app, you'd get chats from 'model', e.g., model.chats
            // For now, we use the dummyChats list defined above.
            // You might also have loading/error states from the model here.

            return ListView.builder(
              itemCount: dummyChats.length,
              itemBuilder: (context, index) {
                final chat = dummyChats[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.primaries[index % Colors.primaries.length].withOpacity(0.8), // Cycle through primary colors
                    foregroundColor: darkPrimaryText,
                    child: Text(chat['avatarLetter']!),
                  ),
                  title: Text(
                    chat['name']!,
                    style: const TextStyle(color: darkPrimaryText, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    chat['message']!,
                    style: const TextStyle(color: darkSecondaryText),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Text(
                    chat['time']!,
                    style: const TextStyle(color: darkSecondaryText, fontSize: 12),
                  ),
                  onTap: () {
                    // TODO: Navigate to the specific chat screen with chat ID/details
                    print('Tapped on chat with ${chat['name']}');
                  },
                );
              },
            );
          },
        ),
        // --- Floating Action Button ---
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // TODO: Implement action to start a new chat or show contacts
            print('FAB tapped - New Chat');
          },
          backgroundColor: darkAccent,
          foregroundColor: darkBg, // Color for the icon
          tooltip: 'New Chat',
          child: const Icon(Icons.chat), // Or Icons.edit, Icons.add
        ),
      ),
    );
  }

  // Helper method to build drawer items consistently
  Widget _buildDrawerItem({required IconData icon, required String text, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: darkIconColor),
      title: Text(text, style: const TextStyle(color: darkPrimaryText, fontSize: 16)),
      onTap: onTap,
    );
  }
}