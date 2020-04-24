import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'main.dart';

bool correctAnswer = false;

Widget createTap() {
  return Container(
    child: SizedBox(
      width: 250.0,
      child: FadeAnimatedTextKit(
          totalRepeatCount: 1000,
          onTap: () {
            print("Tap Event");
          },
          text: ["tap anywhere to continue"],
          textStyle: GoogleFonts.sofadiOne(fontSize: 30),
          textAlign: TextAlign.center,
          alignment: AlignmentDirectional.topStart // or Alignment.topLeft
      ),
    ),
  );
}

class BuildCryptoProblems extends StatefulWidget {
  var currProblem;

  @override
  _BuildCryptoProblemsState createState() => _BuildCryptoProblemsState();

  BuildCryptoProblems({Key key, this.currProblem}) : super(key: key);
}

class _BuildCryptoProblemsState extends State<BuildCryptoProblems> {
  TextEditingController deciphered;

  //bool correctAnswer=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    deciphered = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var max_height = MediaQuery.of(context).size.height;
    switch (widget.currProblem) {
      case 1:
        print("HOOOO");
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                child: Column(children: <Widget>[
                  Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.grey, Colors.black])),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "DeCipher the given text",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.sofadiOne(
                              color: Colors.white, fontSize: 30),
                        ),
                      )),
                  Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.red, Colors.orange])),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("llwatchawthclockgirnisksundialcirbetimersool",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.sofadiOne(
                                fontSize: 30, color: Color.fromRGBO(0, 0, 0, 15))),
                      )),
                  SizedBox(
                    height: max_height / 10,
                  ),
                  TextField(
                    minLines: 1,
                    maxLines: 1,
                    controller: deciphered,
                    autocorrect: false,
                    decoration: InputDecoration(
                      hintText: 'Write your answer here',
                      filled: true,
                      fillColor: Color(0xFFDBEDFF),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: max_height / 15,
                  ),
                  GestureDetector(
                    onTap: (() {
                      print("Tapped!!");
                      print(deciphered.text);
                      print(deciphered.text == 'loose bricks on the right wall');
                      if (deciphered.text == 'loose bricks on the right wall') {
                        setState(() {
                          correctAnswer=true;
                        });

                      }
                    }),
                    child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.grey, Colors.black])),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Submit",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.sofadiOne(
                                color: Colors.white, fontSize: 30),
                          ),
                        )),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,

                    children: <Widget>[
                      SizedBox(width:200),
                      correctAnswer ? createTap() : Container()],
                  )
                ])));
        break;
      default:
        return Container();
    }
  }
}
