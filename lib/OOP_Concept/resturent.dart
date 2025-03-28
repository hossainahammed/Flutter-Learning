class Resturant{

  int _id=2023;

  order(String item){
    print("$item is ordered");
    _shopping(item);
    _prepareItem(item);
    print("$item is served");
  }
  _prepareItem(String item){  // Using '_' we make private.Resturant Class er baire keo access korte parbena.
    print('$item cooking');
  }
  _shopping(String item){  // Using '_' we make private.Resturant Class er baire keo access korte parbena.
    print('Buy material');

  }

  // getter method for access private value of a class instance
  int get resturantId =>_id;

  //setter method
set setId(int value){
  _id=value;
}
}