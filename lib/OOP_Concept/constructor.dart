main (){
  Car Honda = Car('Honda', 'Civic', 2020);

  print(Honda.model);
}
class Car{
  String brand ;
  String model ;
  int year;

  //Constructor create
  Car(this.brand,this.model,this.year);

  moving(){
    print('$model is moving');
  }
}