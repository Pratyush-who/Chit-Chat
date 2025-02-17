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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, ),
        child: Column(
          children: [
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Chats',
                  style: GoogleFonts.poppins(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add_comment_outlined,
                      color: Colors.blueAccent),
                  onPressed: () {},
                )
              ],
            ),
            18.verticalSpace,
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search messages...',
                hintStyle: TextStyle(color: Colors.white70),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            18.verticalSpace,
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: 10,
                separatorBuilder: (context, index) => Divider(
                  color: Colors.grey[800],
                  height: 1,
                  indent: 70,
                ),
                itemBuilder: (context, index) => ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 8),
                  leading: CircleAvatar(
                    radius: 26,
                    backgroundColor: Colors.blueAccent.withOpacity(0.2),
                    child: const Icon(Icons.person, color: Colors.blueAccent),
                  ),
                  title: Text(
                    'John Doe',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(
                    'Hey, how are you?',
                    style: GoogleFonts.poppins(
                      color: Colors.grey[400],
                      fontSize: 13,
                    ),
                  ),
                  onTap: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
