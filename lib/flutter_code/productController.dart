import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/productModel.dart';
import 'utils/urls.dart';

class Productcontroller {
  List<Data> products = [];

  Future<void> fetchProducts() async {
    final response = await http.get(Uri.parse(Urls.readProduct));
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      ProductModel model = ProductModel.fromJson(data); // ✅ Fix here
      products = model.data ?? [];
    }
  }


  Future<bool> DeleteProducts(String productId) async {
    final response = await http.get(Uri.parse(Urls.deleteProduct(productId)));
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;

    }
    else{
      return false;
    }
  }

}
