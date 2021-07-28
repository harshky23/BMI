import 'package:bmi/constant.dart';
import 'package:flutter/material.dart';


class MaleFemale extends StatelessWidget {
  MaleFemale({required this.txt,required this.icon});
  final String txt;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [

        Icon(icon,
          size: 60,
        ),
        SizedBox(
          height: 5,
        ),
        Text(txt,
          style: knormaltext,
        )
      ],
    );
  }
}
