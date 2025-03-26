import 'dart:io';
main () {
  //  var amount = 500;
  //ternary condition .
  // amount >=500 ? print("Eka jabo") : print("share e jabo");
  // if (amount < 50){
  //   print("share e jabo");
  // }
  // else{
  //   print("Eka jabo");
  // }

  print("Enter your name :");
  String ?username = stdin.readLineSync();

  print("Enter your password :");
  String ?password = stdin.readLineSync();

  if (username == 'Hossain' && password == '12345678') {
    print("Login successful");
  }
  else if (username == 'Hossain' && password != '12345678') {
    print("Login unsuccessful \n Wrong password");
  }
  else if (username != 'Hossain' && password == '12345678') {
    print("Login unsuccessful  \n Wrong username");
  }
  else {
    print("Wrong Info");
  }
}