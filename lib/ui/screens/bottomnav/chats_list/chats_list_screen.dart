import 'package:firebasechat/ui/screens/chat_room/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatsListScreenState();
}

class _ChatsListScreenState extends State<ChatListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Chats',
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              20.verticalSpace,
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: const Color(0xFF303030), width: 1),
                ),
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Search messages...',
                    hintStyle: GoogleFonts.poppins(
                      color: const Color(0xFF8E8E93),
                      fontSize: 14,
                    ),
                    prefixIcon:
                        const Icon(Icons.search, color: Color(0xFF8E8E93)),
                    filled: false,
                    contentPadding: const EdgeInsets.symmetric(vertical: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              20.verticalSpace,
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: 10,
                  separatorBuilder: (context, index) => Divider(
                    color: const Color(0xFF2C2C2E),
                    height: 1,
                    indent: 75,
                    endIndent: 5,
                  ),
                  itemBuilder: (context, index) => ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                    leading: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF4B9AFE).withOpacity(0.15),
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(12),
                      child: const Icon(
                        Icons.person,
                        color: Color(0xFF4B9AFE),
                        size: 26,
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'John Doe',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          '2m ago',
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF8E8E93),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Row(
                          children: [
                            Text(
                              'Hey, how are you?',
                              style: GoogleFonts.poppins(
                                color: const Color(0xFFAFAFAF),
                                fontSize: 13,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              width: 135,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.blue,
                              radius: 10,
                              child: Text(
                                '2',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            )
                          ],
                        )),
                    onTap: () => Navigator.pushNamed(context, 'chat_room'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
