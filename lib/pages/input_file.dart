import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../cards/maleFemale.dart';
import '../cards/Reusable.dart';
import '../constant.dart';
import 'package:bmi/brain.dart';
import 'secondPage.dart';

int height = 100;
int weight = 20;
int age = 18;

enum Type {
  male,
  female,
}
Color femalecolor = kInactivecolor, malecolor = kInactivecolor;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  void change(Type store) {
    if (store == Type.male) {
      if (malecolor == kInactivecolor) {
        malecolor = kActivecolor;
        femalecolor = kInactivecolor;
      }
    } else {
      malecolor = kInactivecolor;
      femalecolor = kActivecolor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(children: [
              Expanded(
                child: Reusable(
                    col: malecolor,
                    cardchild:
                        MaleFemale(txt: 'MALE', icon: FontAwesomeIcons.mars),
                    onpress: () {
                      setState(() {
                        change(Type.male);
                      });
                    }),
              ),
              Expanded(
                child: Reusable(
                    col: femalecolor,
                    cardchild:
                        MaleFemale(txt: 'FEMALE', icon: FontAwesomeIcons.venus),
                    onpress: () {
                      setState(() {
                        change(Type.female);
                      });
                    }),
              )
            ])),
            Expanded(
                child: Reusable(
              col: kInactivecolor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: knormaltext,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text((height.toString()), style: kBoldNumber),
                      Text(('cm'), style: knormaltext),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Colors.grey,
                      activeTrackColor: Colors.pink,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                      thumbColor: Colors.pink,
                      overlayColor: Color(
                          0x1ff50057), //seen alpha property and changed value
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 100,
                        max: 220,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  )
                ],
              ),
              onpress: () {},
            )),
            Expanded(
              child: Row(children: [
                Expanded(
                  child: Reusable(
                    onpress: (){},
                    col: kInactivecolor,
                    cardchild: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'WEIGHT',
                            style: knormaltext,
                          ),
                          Text(
                            weight.toString(),
                            style: kBoldNumber,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Button(
                                icon: FontAwesomeIcons.minus,
                                pressed: () {
                                  setState(() {
                                    if (weight == 0)
                                      weight = 0;
                                    else
                                      weight--;
                                  });
                                },
                              ),
                              Button(
                                icon: FontAwesomeIcons.plus,
                                pressed: () {
                                  setState(() {
                                    if (weight == 150)
                                      weight = 150;
                                    else
                                      weight++;
                                  });
                                },
                              )
                            ],
                          ),
                        ]),
                  ),
                ),
                Expanded(
                  child: Reusable(
                    onpress: (){},
                    col: kInactivecolor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Age',
                          style: knormaltext,
                        ),
                        Text(age.toString(), style: kBoldNumber),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Button(
                              icon: FontAwesomeIcons.minus,
                              pressed: () {
                                setState(() {
                                  if (age == 1)
                                    age = 1;
                                  else
                                    age--;
                                });
                              },
                            ),
                            Button(
                              icon: FontAwesomeIcons.plus,
                              pressed: () {
                                setState(() {
                                  if (age == 100)
                                    age = 100;
                                  else
                                    age++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            GestureDetector(
              onTap: (){
                Brain br = Brain(weight: weight,height: height);
                Navigator.push(context,
                MaterialPageRoute(builder:(context){
                 return Sec(num: br.cal(),title: br.title(),discreption: br.description());
                })
                );

              },
              child: RedBottom(text: 'CALCULATE'),)
          ],
        ),
      ),
    );
  }
}
