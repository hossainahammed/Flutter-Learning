main(){
  ///mapping
  var person ={
    //'name' : ['Taufique','sabbir'],
    'name' : 'Taufiq',
    'age' : '26',
    'experience' : '5 years'

  };
  //OR
  Map<String,String>Person2 = {
    'name' : 'Taufiq',
    'age' : '26',
    'experience' : '5 years'
  };
  print(person);
  print (person['name']);
  print(person['age']);
  person['address']='Dhaka';
  print(person);
  person['age'] = '30';
  print(person);
  person.remove('experience');
  print(person);
  print(person.containsKey('name'));
  print(person.containsValue('dhaka'));
  print(person.keys);
  print(person.values);
  print(person.length);


  var additionInfo= {
    'subject':'cse',
    'cgpa':'3.50'

  };
  person.addAll(additionInfo);
  print(person);

  ///map to list

  var KeyList = person.keys.toList();
  var ValueList = person.values.toList();

  print(KeyList);
  print(ValueList);

}