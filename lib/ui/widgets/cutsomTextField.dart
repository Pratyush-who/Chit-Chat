import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.onChanged,
    this.hintText,
    this.focusNode,
    this.isChatText = false,
    this.isPassword = false,
    required this.icon,
  });

  final void Function(String)? onChanged;
  final String? hintText;
  final FocusNode? focusNode;
  final bool isPassword;
  final IconData icon;
  final bool isChatText;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      focusNode: widget.focusNode,
      obscureText: widget.isPassword ? _obscureText : false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 12),
        filled: true,
        fillColor: widget.isChatText
            ? Colors.white
            : Color.fromARGB(39, 144, 145, 152),
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.black38),
        border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(widget.isChatText ? 20.r : 10.r)),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : Icon(widget.icon, color: Colors.black54), // Move the icon here
      ),
    );
  }
}