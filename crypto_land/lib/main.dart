import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';
import 'package:google_fonts/google_fonts.dart';
import 'StoryLines.dart';
import 'CryptoProblems.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

var bg_image_id = 0;
var flag = false;
var p_id = 0;
var bubble_color = Color.fromRGBO(255, 255, 255, 75);
var visible_1 = 0.0, visible_2 = 1.0, visible_3 = 0.0;
var character1_visibility = 1.0,
    character2_visibility = 1.0,
    problem_opacity = 0.0,
    prison_opacity = 1.0;
int chatNum = 0;
var chatControl = new ChatControl();
final myController = TextEditingController();
var bgImages = [
  'images/prisonbg.jfif',
  "images/prisonBreak.png",
  "images/allyway.png"
];

void main() => runApp(CryptoLand());

class CryptoLand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CryptoHome(),
    );
  }
}

class CryptoHome extends StatefulWidget {
  @override
  _CryptoHomeState createState() => _CryptoHomeState();
}

class _CryptoHomeState extends State<CryptoHome> {
  @override
  Widget build(BuildContext context) {
    var max_height = MediaQuery.of(context).size.height;
    var max_width = MediaQuery.of(context).size.width;
    var bubble1 = Bubble(
      alignment: Alignment.topCenter,
      nipWidth: 30,
      nipHeight: 10,
      radius: Radius.circular(20.0),
      nip: BubbleNip.leftBottom,
      color: bubble_color,
      child: Text(
        chatControl.chatList(chatNum).item2,
        style: GoogleFonts.sofadiOne(),
      ),
    );

    var bubble2 = Bubble(
      alignment: Alignment.center,
      nipWidth: 30,
      nipHeight: 10,
      radius: Radius.circular(20.0),
      nip: BubbleNip.rightBottom,
      color: bubble_color,
      child: Text(
        chatControl.chatList(chatNum).item2,
        style: GoogleFonts.sofadiOne(),
      ),
    );

    var bubble3 = Bubble(
      alignment: Alignment.center,
      color: bubble_color,
      child: Text(
        chatControl.chatList(chatNum).item2,
        style: GoogleFonts.salsa(fontSize: 22),
      ),
    );

    var prisoner = Image.asset(
      "images/prisoner.png",
      height: max_height / 1.3,
      width: max_width,
      alignment: Alignment.centerLeft,
    );
    var visitor = Image.asset("images/visitor.png",
        height: max_height / 1.2, width: max_width / 1.5);

    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SafeArea(
            child: GestureDetector(
                onTap: () {
                  if (correctAnswer == true) {
                    setState(() {
                      flag = true;
                      bg_image_id++;
                      visible_3 = 0.0;
                      character1_visibility = 0.0;
                      character2_visibility = 0.0;
                      problem_opacity = 0.0;
                      correctAnswer = false;
                      visible_1 = 0.0;
                      visible_2 = 0.0;
                      prison_opacity = 0.0;
                    });
                  } else {
                    setState(() {
                      chatNum++;
                      if (chatNum != 23) {
                        visible_2 = (chatControl.chatList(chatNum).item1);
                        visible_1 = (visible_2 == 1.0 ? 0.0 : 1.0);
                        if (visible_2 == -1) {
                          if (!flag) {
                            setState(() {
                              chatNum--;
                              visible_3 = 0.0;
                              character1_visibility = 0.0;
                              character2_visibility = 0.0;
                              problem_opacity = 1.0;
                              visible_1 = 0.0;
                              visible_2 = 0.0;
                              prison_opacity = 0.0;
                            });
                          } else {
                            visible_3 = 0.0;
                            character1_visibility = 0.0;
                            character2_visibility = 0.0;
                            problem_opacity = 0.0;
                            visible_1 = 0.0;
                            visible_2 = 0.0;
                            prison_opacity = 0.0;
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => Chapter2()));
                          }
                        } else if (visible_2 == 999.0) {
                          visible_3 = 1.0;
                          visible_1 = 0.0;
                          visible_2 = 0.0;
                          character1_visibility = 0.0;
                          character2_visibility = 0.0;
                        } else if (visible_2 == 998.0) {
                          p_id++;
                          visible_3 = 0.0;
                          character1_visibility = 0.0;
                          character2_visibility = 0.0;
                          problem_opacity = 1.0;
                          visible_1 = 0.0;
                          visible_2 = 0.0;
                          prison_opacity = 0.0;
                        } else {
                          visible_3 = 0.0;
                          character1_visibility = 1.0;
                          character2_visibility = 1.0;
                        }
                      }
                    });
                  }
                },
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      bgImages[bg_image_id],
                      height: max_height,
                      width: max_width,
                      fit: BoxFit.fill,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: AnimatedOpacity(
                        child: prisoner,
                        opacity: character1_visibility,
                        duration: Duration(milliseconds: 500),
                      ),
                    ),
                    AnimatedOpacity(
                      child: Image.asset("images/prison.png",
                          height: max_height,
                          width: max_width,
                          fit: BoxFit.fill),
                      opacity: prison_opacity,
                      duration: Duration(milliseconds: 0),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 50,
                        ),
                        AnimatedOpacity(
                          child: bubble1,
                          opacity: visible_1,
                          duration: Duration(milliseconds: 0),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        AnimatedOpacity(
                          child: bubble2,
                          opacity: visible_2,
                          duration: Duration(milliseconds: 0),
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          child: AnimatedOpacity(
                            child: visitor,
                            opacity: character2_visibility,
                            duration: Duration(milliseconds: 500),
                          ),
                        )
                      ],
                    ),
                    AnimatedOpacity(
                      child: bubble3,
                      opacity: visible_3,
                      duration: Duration(milliseconds: 0),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: problem_opacity == 1.0
                              ? BuildCryptoProblems(currProblem: p_id)
                              : Container(),
                        ),
                      ],
                    ),
                  ],
                ))));
  }
}

class Chapter2 extends StatefulWidget {
  @override
  _Chapter2State createState() => _Chapter2State();
}

class _Chapter2State extends State<Chapter2> {
  @override
  Widget build(BuildContext context) {
    var max_height = MediaQuery.of(context).size.height;
    var max_width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SafeArea(
            child: GestureDetector(
              onTap: () {
//            if (correctAnswer == true) {
//              setState(() {
//                bg_image_id++;
//                visible_3 = 0.0;
//                character1_visibility = 0.0;
//                character2_visibility = 0.0;
//                problem_opacity = 0.0;
//                correctAnswer = false;
//                visible_1 = 0.0;
//                visible_2 = 0.0;
//                prison_opacity = 0.0;
//              });
//            } else {
//              bg_image_id++;
//            }
              },
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    bgImages[bg_image_id==2?bg_image_id:++bg_image_id],
                    height: max_height,
                    width: max_width,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            )));
    return Container();
  }
}
