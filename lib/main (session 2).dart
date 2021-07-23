import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: TempApp(),
    );
  }
}

class TempApp extends StatefulWidget {
  @override
  TempState createState() => TempState();
}

class TempState extends State<TempApp> {
  late double input;
  late double output;
  late bool isF;

//Constructor - initializes object variables
  @override
  void initState() {
    super.initState();
    input = 0.0;
    output = 0.0;
    isF = true;
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text("Temperature Converter"),
    );

    TextField inputField = TextField(
      //widget for getting input
      keyboardType: TextInputType.number, //determines keyboard type
      onChanged: (str) {
        //str represents input from user
        try {
          input = double.parse(str);
        } catch (e) {
          input = 0.0;
        }
      },
      decoration: InputDecoration(
        //text placeholder
        labelText:
            "${isF == true ? "Fahrenheit" : "Celsius"}", //shorthand: if isF is equal to true, the input is in F, else its in C
      ),
      textAlign: TextAlign.center,
    );

    //Buttons to choose temperature conversion
    Container tempSwitch = Container(
      padding: EdgeInsets.all(15.0),
      child: Row(
        children: <Widget>[
          //Selection button for F (true)
          Text("F"),
          Radio<bool>(
              groupValue:
                  isF, //This radio button is considered selected if its [value] matches the [groupValue].
              value: true,
              onChanged: (newVal) {
                //using anonymous function v
                setState(() {
                  isF = newVal!; //assigns newVal (value = true) to isF
                });
              }),

          //Selection button for C (false)
          Text("C"),
          Radio<bool>(
              groupValue: isF,
              value: false,
              onChanged: (newVal) {
                setState(() {
                  isF = newVal!; //assigns newVal (value = false) to isF
                });
              }),
        ],
      ),
    );

    //~~~~~~~~~~~~~~~~~~ADDED~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    //Using a Sized box to align our text to the left
    SizedBox outputTitle = SizedBox(
      width: double.infinity,
      child: Container(
        child: Text(
          "${isF == true ? "Celsius" : "Fahrenheit"}", //shorthand: if isF is equal to true, the output is in C, else its in F",
          style: TextStyle(fontSize: 16.0, color: Colors.grey[600], height: 4),
          textAlign: TextAlign.left,
        ),
      ),
    );

    Text outputField = Text(
      "$output",
      style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, height: 2),
    );

    //Calculate conversion
    Container calcBtn = Container(
      child: ElevatedButton(
        child: Text("Calculate"),
        onPressed: () {
          //action that follows pressing "Calculate"
          setState(() {
            isF == true
                ? output = (input - 32) *
                    (5 / 9) //if F is selected, convert to C (isF == true)
                : output = (input * 9 / 5) +
                    32; //if C is selected, convert to F (isF == false)
          });
        },
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            inputField,
            tempSwitch,
            //~~~~~~~~~~~~~~~~~ADDED~~~~~~~~~~~~~~~~~~~~
            calcBtn,
            outputTitle,
            outputField,
          ],
        ),
      ),
    );
  }
}
