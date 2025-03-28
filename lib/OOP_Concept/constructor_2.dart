class Human {
  int legs = 2;
  int hands = 2;
  late String color;
  int eye = 2;
  String ? name;
  static String className = 'Human class'; //Object toiri na korei globally amra access korte pari.

  Human(){ // constructor of human class.Jokhn amra object creat kori tokhn atuomatic constructor call hoye jat.er jonno eke aladavabe call korte hoyna. jemon main er vitor jkhn amra constructor create korci tkhn auto human constructorti call hoye giyeche & er vitorer methodgulu print kore diyeche.
    print("Human object is creted");
    method1();
    method2();
  }
  moving(){
    print('$name is moving');
  }
  eating(){
    print('$name is eating');
  }
  method1(){
    print("method_1");
  }

  method2(){
    print("method_2");
  }
  static sleep (){  //Object toiri na korei globally amra access korte pari.
    print('human is sleeping ');
  }
}


main(){
  Human hossain = Human();// here i create Object of human class
}