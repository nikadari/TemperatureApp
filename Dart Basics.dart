
/*
FUNCTIONS
- return type: int, double, String, bool, void
- placed above main function
- camel case naming convention
syntax: returntype name (param) { code; return statement; }
*/
int timesTwo(int x){
  return x * 2;
}

// Arrow syntax is shorthand for `{ return expr; }`.
//Same as int timesThree(int x) { return x * 3; }
int timesThree(int x) => x * 3;

// Passing function inside your parameters (treats function as an object)
// Method Purpose: Runs the given function twice
int runTwice(int x, int Function(int) f) {
  for (var i = 0; i < 2; i++) {
    x = f(x);
  }
  return x;
}


//MAIN function 
void main() {
  //Print Statement
  print('Hello, World!');

  /*
  VARIABLES
    - Types: int, double, String, bool (NO char)
    - Can declare variables using type or 'var' keyword
    - Cannot change variable type after declaration
    - final variables represents constants. Once assigned, a final variable can't be reassigned to any other value.
    - late variables let the compiler know that this will be initialized later (prevents initialization errors)
  */
  int y = 10;
  var x = 35.6;
  final a = 'Hello';
  late int c ;

  //Calling functions
  c = timesTwo(y);
 
  //Printing variables
  print(c); 
  print('calling timesThree = ${timesThree(y)}'); //use ${var} to print var within string
  print('2 x 2 x 2 is ${runTwice(2, timesTwo)}');
   

  /*
    CONDITIONAL STATEMENTS
    - if, else if, else
    - Arithmetic operators: +, -, *, /, %
    - Relational Operators: >, >=, <, <=, ==, !=
    - Bitwise Operators: &, |, ~ (and, or, not)
  */
  //Checks if n is +, - or 0
  var n = 25;
  if (n > 0)
  {
    print('${n} is positive');
  }
  else if (n < 0)
  {
    print('${n} is negative');
  }
  else
  {
    print('${n} is zero');
  }

  //If else condition shorthand
  //syntax: condition ? doThisIfTrue : doThisIfFalse
  int age = 21;
  age >= 18 ? print('Adult') : print('Minor') ;

  age = 15;
  String status = age >= 18 ? 'Adult' : 'Minor' ;
  print(status);
  
  }