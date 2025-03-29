abstract class Student{


  attendClass(); //jdi kuno abstract class er method er body na dei tahole ta abstract method hoy.
   examSubmit(){

  }
}

class person extends Student{
  String name;
  person(this.name) ;

  @override
  attendClass() {
    print("$name joined class");
  }


}

class Businessman implements Student {
  // implements use korle parrent class er sob methodke forceforly method override korte hbe
  String name;

  Businessman(this.name);

  @override
  attendClass() {
    print("$name Businessman joined class");
  }

  @override
  examSubmit() {
    print(" Businessman $name joined exam");
  }
}
main(){
  person rafi =person('Rafi');
  rafi.attendClass();

  Businessman Rahim = Businessman('Rahim');
  Rahim.examSubmit();

  //polymorphism
  //student But person(Uni stu,clg,Job holder,job trying), Business

  Student hossain = person('Hossain');
  Student sabbir = Businessman('Hossain');

  hossain.attendClass();
  hossain.examSubmit();
  sabbir.attendClass();

  print(hossain.runtimeType);
  print(sabbir.runtimeType);


  print(hossain is person);
  print(hossain is Businessman);
  print(sabbir is person);
  print(sabbir is Businessman);


  print(sabbir is Student);
  print(hossain is Student);

}