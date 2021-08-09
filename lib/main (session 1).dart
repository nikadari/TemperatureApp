//Imports all material needed for development
import 'package:flutter/material.dart';

//Function shorthand = void main() { return runApp(MyApp()); }
void main() => runApp(MyApp());

//Superclass (StatelessWidget)
//Creates the App foundation
class MyApp extends StatelessWidget {
  //returns MaterialApp Object
  //API: https://api.flutter.dev/flutter/material/MaterialApp-class.html
  //theme: and home: are properties of the object (& they accept Wighets as their value)
  @override
  build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: TempApp(), //Passing in our created application
    );
  }
}

//Class for our app screen (StatefulWidget)
class TempApp extends StatefulWidget {
  //creates mutable state
  @override
  TempState createState() => TempState();
}

//Class for creating our state
class TempState extends State<TempApp> {
  //Using late keyword because Flutter doesn't know that we will initialize afterwards
  late double input;
  late double output;
  late bool isF;

//Constructor - ovverrides superclass, initializes object variables
  @override
  void initState() {
    super.initState();
    input = 0.0;
    output = 0.0;
    isF = true;
  }

  //Create our user interface and application, return Scaffold Widget
  //Build function will be called with every state change (refresh)
  @override
  Widget build(BuildContext context) {
    //Adding an AppBar at the top of the screen
    AppBar appBar = AppBar(
      title: Text("Temperature Converter"),
    );

//~~~~~~~~~~~~~~~~~~PART TWO~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    //TextField Widget - used to input data from user (enters temperature)
    TextField inputField = TextField(
      //widget for getting input
      keyboardType: TextInputType.number, //determines keyboard type
      //onChanged is a method that is triggered when TextField is filled out
      //str represents input from user
      onChanged: (str) {
        try {
          input = double.parse(str); //if valid input, convert to double
        } catch (e) {
          input = 0.0; //if invalid, keep input as 0.0
        }
      },
      //decoration is a property that display a label for the text field
      decoration: InputDecoration(
        //label text will either be Fahrenheit or Celsius (temperature that user wants to convert from)
        labelText:
            "${isF == true ? "Fahrenheit" : "Celsius"}", //shorthand: if isF is equal to true, the input is in F, else its in C
      ),
      textAlign: TextAlign.center, //aligns text field to the centre
    );

    //Buttons to choose temperature conversion (keeping them inside a container)
    Container tempSwitch = Container(
      padding: EdgeInsets.all(
          15.0), //padding applied around container for cleaner look
      child: Row(
        //children represents cells in a row, the property takes in a list of Widgets
        children: <Widget>[
          //Selection button for F (true)
          Text("F"),
          Radio<bool>(
              groupValue:
                  isF, //This radio button is considered selected if [groupValue] matches the [value].
              value: true,
              //if changed (i.e. deselected button), then isF is no longer true
              onChanged: (newVal) {
                //setState() notify's that state has changed
                setState(() {
                  isF = newVal!; //assigns newVal (value = true!) to isF
                });
              }),

          //Selection button for C (false)
          Text("C"),
          Radio<bool>(
              groupValue:
                  isF, //This radio button is considered selected if [groupValue] matches the [value].
              value: false,
              //if changed (i.e. deselected button), then isF is no longer false
              onChanged: (newVal) {
                //setState() notify's that state has changed
                setState(() {
                  isF = newVal!; //assigns newVal (value = false!) to isF
                });
              }),
        ],
      ),
    );

    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    //Scaffold class - holds all Widgets
    return Scaffold(
      appBar: appBar, //passes appBar Widget to property
      body: Container(
        //Container will provide formatted padding for widgets being held
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            //~~~~~~~~~~~~~~~~~PART TWO~~~~~~~~~~~~~~~~~~~~
            inputField,
            tempSwitch,
          ],
        ),
      ),
    );
  }
}
