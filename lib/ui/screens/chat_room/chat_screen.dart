import 'package:firebasechat/core/models/message_modal.dart';
import 'package:firebasechat/core/models/user_models.dart';
import 'package:firebasechat/core/services/chat_service.dart';
import 'package:firebasechat/ui/screens/chat_room/chat_view.model.dart';
import 'package:firebasechat/ui/screens/other/user_provider.dart';
import 'package:firebasechat/ui/widgets/cutsomTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  final UserModel receiver;
  const ChatScreen({super.key, required this.receiver});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<UserProvider>(context).user;
    return ChangeNotifierProvider(
      create: (context) => ChatViewModel(
        ChatService(),
        currentUser!,
        widget.receiver,
      ),
      child: Consumer<ChatViewModel>(
        builder: (context, model, _) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.only(
                  left: 1.sw * 0.05, right: 1.sw * 0.05, top: 39.h),
              child: Column(
                children: [
                  buildHeader(context, name: widget.receiver.name ?? 'Unknown'),
                  SizedBox(height: 10.h),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        final message = model.messages[index];
                        final isCurrentUser =
                            message.senderId == model.currentUser.uid;
                        return ChatBubble(
                            isCurrentUser: isCurrentUser, message: message);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 10.h);
                      },
                      itemCount: model.messages.length,
                    ),
                  ),
                  bottomField(
                    controller: model.controller,
                    onTap: () {
                      model.saveMessage();
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    this.isCurrentUser = true,
    required this.message,
  });
  final bool isCurrentUser;
  final Message message;

  @override
  Widget build(BuildContext context) {
    final alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;
    final borderRadius = isCurrentUser
        ? BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
            bottomLeft: Radius.circular(16.r),
          )
        : BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
            bottomRight: Radius.circular(16.r),
          );
    return Align(
      alignment: alignment,
      child: Container(
        constraints: BoxConstraints(maxWidth: 0.85.sw * 0.8, minWidth: 50.w),
        decoration: BoxDecoration(
          color: isCurrentUser
              ? const Color.fromARGB(255, 0, 0, 0)
              : const Color.fromARGB(82, 50, 50, 50),
          borderRadius: borderRadius,
        ),
        padding: EdgeInsets.all(13), // Adjusted width for better visibility
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message.content ?? '',
              style: TextStyle(
                color: isCurrentUser
                    ? const Color.fromARGB(255, 183, 182, 182)
                    : Colors.white,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(message.timestamp.toString().substring(0, 11),
                style: TextStyle(
                  color: isCurrentUser
                      ? const Color.fromARGB(255, 196, 195, 195)
                      : Colors.white,
                  fontSize: 12.sp,
                )),
          ],
        ),
      ),
    );
  }
}

class bottomField extends StatelessWidget {
  const bottomField({
    super.key,
    this.onTap,
    this.onChanged,
    this.controller,
  });
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 9),
      child: Row(
        children: [
          InkWell(
            onTap: onTap,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.add),
              radius: 20,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: CustomTextField(
              hintText: "Type a message",
              icon: Icons.send,
              onChanged: onChanged,
              isChatText: true,
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}

Row buildHeader(BuildContext context, {String name = ""}) {
  return Row(
    children: [
      InkWell(
        onTap: () => Navigator.pop(context),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: Colors.white.withOpacity(0.2),
          ),
          child: const Icon(Icons.arrow_back_ios),
        ),
      ),
      SizedBox(width: 20),
      Text(
        name,
        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
      ),
      Spacer(),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.white.withOpacity(0.2),
        ),
        child: const Icon(Icons.more_vert),
      ),
    ],
  );
}
