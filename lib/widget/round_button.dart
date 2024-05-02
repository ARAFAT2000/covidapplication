import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  String text;
  bool isloading;
  final VoidCallback onTap;
RoundButton({required this.text, this.isloading=false,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 45,
        child: Center(child: isloading ?CircularProgressIndicator(  strokeWidth: 2,color: Colors.white,): Text(text)),
        decoration: BoxDecoration(
          color: Colors.lightGreenAccent,
          borderRadius: BorderRadius.circular(10)
        ),
      ),
    );
  }
}
