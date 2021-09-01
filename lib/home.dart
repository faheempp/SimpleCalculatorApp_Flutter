import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String expression = '';
  String displayExpression = '0';
  String result = '0';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Simple Calculator"),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(5,5,10,5),
              height: MediaQuery.of(context).size.height * .4,
              color: Colors.white,
              child: ListView(
                  children: [
                    Container(
                      //height: MediaQuery.of(context).size.height*.15,
                      width: MediaQuery.of(context).size.width * .9,
                      color: Colors.white,
                      child: Text(
                        displayExpression,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 50,
                        ),
                      ),
                    ),
                    Divider(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .95,
                      color: Colors.white,
                      child: Text(
                        result,
                        textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.black,
                        fontSize: 40,
                        ),
                      ),
                    ),
                  ],
                //),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                //height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.fromLTRB(1.5,20,1.5,0),
                color: Colors.white,
                child: keypad(),
              ),
            ),
          ],
        ));
  }

  keypad() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            button(Colors.red, 'C'),
            button(Colors.grey, '7'),
            button(Colors.grey, '4'),
            button(Colors.grey, '1'),
            button(Colors.grey, '.'),
          ],
        ), //column1
        Column(
          children: [
            button(Colors.blue, '⌫'),
            button(Colors.grey, '8'),
            button(Colors.grey, '5'),
            button(Colors.grey, '2'),
            button(Colors.grey, '0'),
          ],
        ),
        Column(
          children: [
            button(Colors.blue, '÷'),
            button(Colors.grey, '9'),
            button(Colors.grey, '6'),
            button(Colors.grey, '3'),
            button(Colors.grey, '00'),
          ],
        ),
        Column(
          children: [
            button(Colors.blue, '×'),
            button(Colors.blue, '-'),
            button(Colors.blue, '+'),
            button(Colors.red, '='),
            //button(Colors.grey, '='),
          ],
        ), //column4
      ],
    );
  }

  button(Color bgColor, String symbol) {
    return Container(
      width: MediaQuery.of(context).size.width * .242,
      height: symbol != '='
          ? MediaQuery.of(context).size.height * .09016
          : MediaQuery.of(context).size.height * .1827,
      margin: EdgeInsets.all(1),
      color: bgColor,
      child: TextButton(
        child: Text(
          symbol,
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
        onPressed: () {
          setState(() {
            buttonFunction(symbol);
          });
        },
      ),
    );
  }

  buttonFunction(String symbol){
    if(symbol=='C') {
      displayExpression = '0';
      result='0';
    }
    else if(symbol=='⌫'){
      displayExpression=displayExpression.substring(0,displayExpression.length-1);
      result="0";
      if(displayExpression.length==0){
        displayExpression='0';
      }
    }
    else if(symbol=='='){
      expression=displayExpression.replaceAll('×', '*');
      expression=expression.replaceAll('÷','/');
      result=expression.interpret().toString();
    }
    else{
      if(displayExpression=='0'){
        displayExpression='';
      }
      displayExpression=displayExpression+symbol;
    }
  }
}
