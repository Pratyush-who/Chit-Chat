import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, this.onPressed, required this.content, this.loading = false});

  final void Function()? onPressed;
  final String content;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 50.h,
      child: ElevatedButton(
        child: loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Text(
                content,
                style: TextStyle(fontSize: 18),
              ),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: Colors.black87),
      ),
    );
  }
}
