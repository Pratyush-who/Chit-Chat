import 'package:firebasechat/ui/screens/bottomnav/bottom_nav_viewmodel.dart';
import 'package:firebasechat/ui/screens/bottomnav/chats_list/chats_list_screen.dart';
import 'package:firebasechat/ui/screens/bottomnav/profile/ProfileScreen.dart';
import 'package:firebasechat/ui/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatelessWidget {
  BottomNav({super.key});

  static final List<Widget> screens = [
    const HomeScreen(),
    const ChatListScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BottomNavViewmodel(),
      child: Consumer<BottomNavViewmodel>(builder: (context, model, _) {
        return Scaffold(
          body: BottomNav.screens[model.currInd],
          backgroundColor: const Color(0xFF121212),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 15,
                )
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                elevation: 25,
                backgroundColor: const Color(0xFF1E1E1E),
                selectedItemColor: Colors.blueAccent,
                unselectedItemColor: Colors.grey[600],
                currentIndex: model.currInd,
                onTap: model.setIndex,
                items: [
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: FaIcon(
                        FontAwesomeIcons.home,
                        color: model.currInd == 0 
                            ? Colors.blueAccent 
                            : Colors.grey[600],
                        size: 22,
                      ),
                    ),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: FaIcon(
                        FontAwesomeIcons.comments,
                        color: model.currInd == 1 
                            ? Colors.blueAccent 
                            : Colors.grey[600],
                        size: 22,
                      ),
                    ),
                    label: "Chats",
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: FaIcon(
                        FontAwesomeIcons.userAstronaut,
                        color: model.currInd == 2 
                            ? Colors.blueAccent 
                            : Colors.grey[600],
                        size: 22,
                      ),
                    ),
                    label: "Profile",
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
