import 'package:flutter/material.dart';
import '../constant.dart';
// this one is for card curved one
class Reusable extends StatelessWidget {
  final Color col;
  final Widget cardchild;
  final Function onpress;
  Reusable({required this.col,required this.cardchild,required this.onpress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>onpress(),
      child: Container(
        child: cardchild,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: col,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class RedBottom extends StatelessWidget {
  RedBottom({required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
          child: Center(child: Text(text,style: TextStyle(fontSize: 40,letterSpacing: 5,),)),
          margin: EdgeInsets.only(top: 15),
          color: Colors.pinkAccent,
          height: kHeightValue,
        );
  }
}

//round wala button ka hai
class Button extends StatelessWidget {
  Button({required this.icon,required this.pressed});
  final IconData icon;
  final Function pressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints(minWidth: 60.0, minHeight: 60.0),
      shape: CircleBorder(),
      fillColor: Colors.grey[800],
      onPressed: ()=>pressed(),
      child: Icon(icon),
    );
  }
}

