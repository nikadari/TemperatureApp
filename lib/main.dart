import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/* above statement is the same as:
void main() {
  runApp(MyApp());
}
*/

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
  late String file;

//Constructor - initializes object variables
  @override
  void initState() {
    super.initState();
    input = 0.0;
    output = 0.0;
    isF = true;
  }

  String outputImageFile() {
    //Check: if input is Fahrenheit then output is Celsius
    if (isF == true) {
      if (output <= 0) {
        return 'assets/cold.png';
      } else {
        return 'assets/hot.png';
      }
    }
    //Check: if input is Celsius then output is Fahrenheit
    else {
      if (output <= 32) {
        return 'assets/cold.png';
      } else {
        return 'assets/hot.png';
      }
    }
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
              groupValue: isF,
              value: true,
              onChanged: (newVal) {
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

    Container outputImage = Container(
      padding: EdgeInsets.all(20.0),
      child: Image.asset(
        "${outputImageFile()}",
        width: 100,
        height: 100,
      ),
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
      //ctrl+shift+R -> Wrap with Widget -> SingleChildScrollView (fix overflow)
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            //when you pass the <Widget>[] you tell to compiler the input list type is Widget and all list child must be Widget not anything else
            children: <Widget>[
              inputField,
              tempSwitch,
              calcBtn,
              outputTitle,
              outputField,
              outputImage,
            ],
          ),
        ),
      ),
    );
  }
}
