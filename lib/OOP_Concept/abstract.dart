class student{


  attendClass(){
    print('Joined class');

  }
   examSubmit(){

  }
}

class person extends student{
  String name;
  person(this.name) ;


}

main(){
  student rafi =student();
  rafi.attendClass();
}