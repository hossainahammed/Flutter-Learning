import 'dart:convert';

import 'package:if_else_statement/flutter_code/utils/urls.dart';

import 'models/productModel.dart';
import 'package:http/http.dart' as http;

class Productcontroller{
  List<Data> products = [];

  get productModel => null;

  Future<void> fetchProducts() async{
    final response = await http.get(Uri.parse(Urls.readProduct));
    print(response.statusCode);
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      ProductModel model = productModel.fromJson(data);
      products = model.data ?? [];
    }
  }
}