import 'resturent.dart';

main(){
 Resturant kfc = Resturant();


  kfc.order('Chicken Fry');
  // kfc.prepareItem('Chiken Fry'); -->> prepareItem() methodtike private korar karone amra eita r acces korte partecina. Resturant claass er vitor thaka prepareItem() method er samne theke "_" underscore uthanor maddome amra private mukto korle abr use korte parbo .

 print('Resturant id is ${kfc.resturantId}');//By using getter method we access private variable.

 kfc.setId=2025;
 print('Resturant id is ${kfc.resturantId}');//By using setter method we access private variable & can set value.
}
