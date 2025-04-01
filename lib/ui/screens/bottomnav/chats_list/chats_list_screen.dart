import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasechat/core/constants/strings.dart';
import 'package:firebasechat/core/models/user_models.dart';
import 'package:firebasechat/core/services/db_services.dart';
import 'package:firebasechat/ui/screens/bottomnav/chats_list/chat_list_viewmodel.dart';
import 'package:firebasechat/ui/screens/other/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatsListScreenState();
}

class _ChatsListScreenState extends State<ChatListScreen> {
  late final ChatListViewmodel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = ChatListViewmodel(
      dbServices(),
      FirebaseAuth.instance.currentUser,
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<UserProvider>(context).user;
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
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
                  style: TextStyle(color: Colors.white),
                  onChanged: _viewModel.search,
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
                child: StreamBuilder<List<UserModel>>(
                  stream: _viewModel.usersStream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(
                        child: Text("No users found",
                            style: GoogleFonts.poppins(color: Colors.white)),
                      );
                    }

                    final users = snapshot.data!;

                    return ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: users.length,
                      separatorBuilder: (context, index) => Divider(
                        color: const Color(0xFF2C2C2E),
                        height: 1,
                        indent: 75,
                        endIndent: 5,
                      ),
                      itemBuilder: (context, index) {
                        final user = users[index];
                        return ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 4),
                          leading: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF4B9AFE).withOpacity(0.15),
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              user.name?.isNotEmpty == true
                                  ? user.name![0].toUpperCase()
                                  : '?',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                user.name ?? 'Unknown',
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
                                const SizedBox(width: 135),
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
                            ),
                          ),
                          onTap: () => Navigator.of(context)
                              .pushNamed(chatRoom, arguments: user),
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
