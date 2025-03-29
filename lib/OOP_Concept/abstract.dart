class student{
  String name;
  student(this.name);

  attendClass(){
    print('$name Joined class');

  }
   examSubmit(){

  }
}

class person extends student{
  String name;
  person(this.name) : super('Rana');


}

main(){
  person rafi =person('Rafi');
  rafi.attendClass();
}