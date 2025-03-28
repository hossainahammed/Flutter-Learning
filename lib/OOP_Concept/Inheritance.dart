
class Father {
  String name;
  String land = ' 100 bigha';
  String hou = "Tin basa";
  String bike = "Hero Honda";



  Father(this.name){
    print("$name object created");
  }

  incomeSource(){
    print('Farming');
  }

}

class Son extends Father{
  String sonName;
  Son(this.sonName):super('Rahim');

}

main(){
  Son Rifat = Son('Rifat');

  print(Rifat.land);
  print(Rifat.hou);
  Rifat.land= '150 bigha';
  Rifat.hou='chader basha';
  print(Rifat.land);
  print(Rifat.hou);

}
