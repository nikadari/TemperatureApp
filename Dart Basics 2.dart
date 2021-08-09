/*
Classes & Inheritance
- Extends vs. Implements
  - can extend only one superclass, inherits all properties, variables, functions from superclass
  - can implement an interface, and you can implement as many as you like according to your needs
Explanation: https://medium.com/@manoelsrs/dart-extends-vs-implements-vs-with-b070f9637b36
*/

// Abstract class (can't be used on its own)
abstract class Item {
  void use();
}

// Class Chest implements Item
class Chest<T> implements Item {
  final List<T> contents; //final is used to ensure contents down't change after initialization

  // Constructors can assign arguments to instance variables using `this`.
  // i.e. takes the contents inside parameteres directly to assign to variable
  Chest(this.contents);

  @override //from Item abstract class
  void use() => print('$this has ${contents.length} items.'); //this keyword represents the class Name
}

// Class Chest implements Item
class Sword implements Item {
  int damage = 5;

  @override
  void use() => print('$this dealt $damage damage.');
}

// DiamondSword extends Sword class
class DiamondSword extends Sword {
  @override
  final int damage = 50;
}

void main() {
  //Create variable to store Chest object. Pass in list of items in parameters as Chest's contents
  // The 'new' keyword is optional.
  var chest = Chest<Item>([
    DiamondSword(),
    Sword(),
  ]);

  chest.use(); //calls use method in Chest class

  //Goes through Chest and calls use method of each object 
  for (var item in chest.contents) {
    item.use();
  }
}

