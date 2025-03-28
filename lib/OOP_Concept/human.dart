class Human {
  int legs = 2;
  int hands = 2;
  late String color;
  int eye = 2;
  String ? name;
  static String className = 'Human class'; //Object toiri na korei globally amra access korte pari.

  moving(){
    print('$name is moving');
  }
  eating(){
    print('$name is eating');
  }
  static sleep (){  //Object toiri na korei globally amra access korte pari.
    print('human is sleeping ');
  }
}
