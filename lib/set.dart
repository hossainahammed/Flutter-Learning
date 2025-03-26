main(){
  Set<String> names ={'Hossain','Nafian','Diganta','Mostakem'};

print(names);
names.add('Mamun');
print(names);
print("First element: ${names.first}");
print("Last element: ${names.last}");

  Set<String> names2 ={'Hossain','Kabir','Diganta','Faruq'};
  print("Set-1:$names");
  print("Set-2:$names2");
  print("Intersection value : ${names.intersection(names2)}");
  print("Intersection value : ${names.union(names2)}");


}