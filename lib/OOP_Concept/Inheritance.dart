
class Father {
  String name; //instanse
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

void main() {
  Son Rifat = Son('Rifat');

  print(Rifat.land); // Prints: 100 bigha
  print(Rifat.hou);  // Prints: Tin basa

  // Modifying the properties
  Rifat.land = '150 bigha';
  Rifat.hou = 'chader basha';

  print(Rifat.land); // Prints: 150 bigha
  print(Rifat.hou);  // Prints: chader basha


  print("Father name: ${Rifat.name}");

  // Print the son's name directly
  print("Son name: ${Rifat.sonName}"); // Accessing the sonName property directly
}