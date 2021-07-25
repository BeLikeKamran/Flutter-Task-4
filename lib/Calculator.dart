//import 'package:assignment/Image.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'ToDoApp.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var res = "";

  Widget btn(var abc) {
    return Expanded(
        child: OutlinedButton(
      onPressed: () {
        setState(() {
          res = res + abc;
        });
      },
      child: Text(
        abc,
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    ));
  }

  C() {
    setState(() {
      res = "";
    });
  }

  output() {
    Parser p = Parser();
    Expression exp = p.parse(res);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      res = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: AppBar(
              backgroundColor: Color(0xff1d0dff),
              title: Center(
                  child: Text(
                "Calculator",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ))),
        ),
        drawer: (Drawer(
          child: ListView(
            children: [
              Center(
                  child: Container(
                height: 70,
                child: DrawerHeader(
                  child: Container(
                    width: 400,
                    color: Color(0xff1d0dff),
                    child: Center(
                      child: Text(
                        "              Welcome \nHere is the List Of All Apps",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  padding: EdgeInsets.all(0.0),
                ),
              )),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Calculator()));
                },
                child: Column(children: [
                  ListTile(
                    title: Text(
                      "Calculator",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/c/cf/Casio_calculator_JS-20WK_in_201901_002.jpg",
                    width: 100,
                  )
                ]),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ToDoApp()));
                  },
                  child: Column(children: [
                    ListTile(
                      title: Text(
                        "ToDoApp",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                    Image.network(
                      "https://i.imgur.com/OvMZBs9.jpg",
                      width: 100,
                    )
                  ])),
              /* GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ImageScreen()));
                  },
                  child: Column(children: [
                    ListTile(
                      title: Text(
                        "ImageScreen",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                    Image.network(
                      "https://i.imgur.com/OvMZBs9.jpg",
                      width: 100,
                    )
                  ])
                  )*/
            ],
          ),
        )),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 280, bottom: 10),
                child: Text(
                  res,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Row(
                children: [
                  btn("7"),
                  btn("8"),
                  btn("9"),
                  btn("+"),
                ],
              ),
              Row(
                children: [
                  btn("4"),
                  btn("5"),
                  btn("6"),
                  btn("-"),
                ],
              ),
              Row(
                children: [btn("1"), btn("2"), btn("3"), btn("*")],
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: C,
                      child: Text(
                        "C",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  btn("0"),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: output,
                      child: Text(
                        "=",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  btn("/"),
                ],
              ),
            ],
          ),
        ));
  }
}
