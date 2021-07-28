import 'package:bmi/cards/Reusable.dart';
import 'package:bmi/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sec extends StatelessWidget {
  Sec({required this.num,required this.discreption,required this.title});
  final String title;
  final String num;
  final String discreption;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('BMI CALCULATOR '),
      ),
      body : Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child:
            Container(
                  padding: EdgeInsets.only(right: 140),
                  margin: EdgeInsets.only(top: 10),
                  child: Text('Your Result',style: kBigtext,))),
          Expanded(
            flex: 5,
            child: Reusable(col: kInactivecolor,
              cardchild: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded( flex:1,child: Center(child: Text(title.toUpperCase(), textAlign: TextAlign.center,style: kmain,))),
                  Expanded(flex:3,child: Center(child: Text(num,textAlign: TextAlign.center,style: kresultnum))),
                  Expanded(child: Center(child: Text(discreption,textAlign: TextAlign.center,style:kreport,)))
                ],
              ),
            onpress: (){},
            ),
          ),

            GestureDetector(
            onTap: (){

            Navigator.pop(context,'/');
            },
            child: RedBottom(text: 'RE-CALCULATE'),)
                ],
      )
    );
  }
}
