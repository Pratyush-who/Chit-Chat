import 'package:firebasechat/ui/screens/bottomnav/bottom_nav_viewmodel.dart';
import 'package:firebasechat/ui/screens/bottomnav/chats_list/chats_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatelessWidget {
  BottomNav({super.key});

  static final List<Widget> screens = [
    const Text('data'),
    const ChatListScreen(),
    const Text('Ganduabcbsaicb'),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BottomNavViewmodel(),
      child: Consumer<BottomNavViewmodel>(builder: (context, model, _) {
        return Scaffold(
          body: BottomNav.screens[model.currInd],
          backgroundColor: Colors.blueGrey,
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 2, blurRadius: 10)
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                elevation: 25,
                backgroundColor: Colors.black87,
                selectedItemColor: Colors.white, // Selected icon color
                unselectedItemColor: Colors.grey, // Unselected icon color
                currentIndex: model.currInd,
                onTap: model.setIndex,
                items: [
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: FaIcon(
                        FontAwesomeIcons.home,
                        color: model.currInd == 0 ? Colors.white : Colors.grey,
                      ),
                    ),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: FaIcon(
                        FontAwesomeIcons.comments,
                        color: model.currInd == 1 ? Colors.white : Colors.grey,
                      ),
                    ),
                    label: "Chats",
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: FaIcon(
                        FontAwesomeIcons.user,
                        color: model.currInd == 2 ? Colors.white : Colors.grey,
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
