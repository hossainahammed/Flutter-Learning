abstract class Animal{ //by using abstract we cannot call or create a class method,variable or object.
  String name;         //Tokhn extend use kore korte hbe .
  static var test = 'This is animal class';
  Animal(this.name);

  eat(){
    print("$name is eating");
  }

  speak();
}


class Dog extends Animal{
  @override
  speak(){
    print('Ghew Ghew');
  }
  String color;
  Dog(this.color,String name) : super(name);
}


class Cat extends Animal{
  @override
  speak(){
    print('Mew Mew');
  }

  String color;
  Cat(this.color,String name) : super(name);


}


main(){

  // static use

  print(Animal.test);

  Dog tom = Dog('Black', 'Tom');

  tom.speak();


  Cat ABC = Cat('white', 'ABC');
  ABC.eat();
  ABC.speak();





}