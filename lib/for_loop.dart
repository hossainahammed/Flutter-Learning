main () {
  List<String>students =['Hossain','Diganta','Mostakem','Nafian','Rafiqe','Karim'];
  List<int>amount =[1000,500,700,800,900];

  print("student 2 index : ${students[2]}");

for(int index=0;index<=students.length; index++){
  print("student $index name : ${students[index]} . \n your ${amount[index]}  tk payment due");

}

  for(var student in students){
    int index = students.indexOf(student);
    print("Student $index name : ${students[index]} \nyour ${amount[index]} payment due");
  }

  students.asMap().forEach((index, student) {
    print("Student $index name : ${students[index]} \nyour ${amount[index]} payment due");
  });
}