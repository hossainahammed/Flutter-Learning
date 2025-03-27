import 'human.dart';

void main() {

  //String studentName = 'Rahim';
  // String studentClass = 'class-10';
  // String studentAddress = 'Dhaka';


  // Creating an object
  Student student1 = Student();
  student1.studentName = 'Rahim';
  student1.studentClass = '10';
  student1.studentAddress = 'Dhaka';

  print(student1.studentName);
  print(student1.studentClass);
  print(student1.studentAddress);

  // Creating Human objects inside main
  Human maruf = Human();
  print(maruf.hands);
  print(maruf.eye);

  // Creating Human objects inside main
  Human rahim = Human();
  rahim.name ='Rahim';
  rahim.hands = 1;
  rahim.legs = 1;

  print(rahim.hands);
  print(rahim.legs);
  rahim.moving();
  rahim.eating();
}

// Renamed class to follow convention
class Student {
  String? studentName;
  String? studentClass;
  String? studentAddress;
}


