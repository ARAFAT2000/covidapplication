import 'package:flutter/material.dart';

class Reuseable extends StatelessWidget {
  String title,value;
  Reuseable({required this.title,required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right:10,top: 15,bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(value),
              Text(title),

            ],
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}