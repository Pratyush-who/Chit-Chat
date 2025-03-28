import 'package:firebasechat/ui/widgets/cutsomTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.only(left: 1.sw * 0.05, right: 1.sw * 0.05, top: 39.h),
        child: Column(
          children: [
            buildHeader(name: "john"),
            SizedBox(height: 10.h),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return ChatBubble(isCurrentUser: true);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10.h);
                },
                itemCount: 10,
              ),
            ),
            bottomField(
              onChanged: (p0) {},
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    this.isCurrentUser = true,
  });
  final bool isCurrentUser;

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
              'jcbabfojbo oohfioqioq h ijfij wkj kjf khrowhif  wi iuiu w h eh',
              style: TextStyle(
                color: isCurrentUser ? const Color.fromARGB(255, 183, 182, 182) : Colors.white,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text('21:21 PM',
                style: TextStyle(
                  color: isCurrentUser ? const Color.fromARGB(255, 196, 195, 195) : Colors.white,
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
  });
  final void Function()? onTap;
  final void Function(String)? onChanged;

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
            ),
          ),
        ],
      ),
    );
  }
}

Row buildHeader({String name = ""}) {
  return Row(
    children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.white.withOpacity(0.2),
        ),
        child: const Icon(Icons.arrow_back_ios),
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
