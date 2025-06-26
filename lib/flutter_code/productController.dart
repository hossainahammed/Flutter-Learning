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
      ProductModel model = ProductModel.fromJson(data);
      products = model.data ?? [];
    }
  }

  Future<void> createProduct({
    required String name,
    required String image,
    required int qty,
    required int unitPrice,
    required int totalPrice,
  }) async {
    final response = await http.post(
      Uri.parse(Urls.createProduct),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "ProductName": name,
        "ProductCode": DateTime.now().microsecondsSinceEpoch,
        "Img": image,
        "Qty": qty,
        "UnitPrice": unitPrice,
        "TotalPrice": totalPrice,
      }),
    );

    if (response.statusCode == 201) {
      await fetchProducts();
    } else {
      throw Exception("Failed to create product");
    }
  }


  Future<bool> updateProduct({
    required String id,
    required String name,
    required String image,
    required int qty,
    required int unitPrice,
    required int totalPrice,
  }) async {
    try {
      final url = Urls.updateProduct(id);
      final requestBody = {
        "ProductName": name,
        "ProductCode": DateTime.now().microsecondsSinceEpoch.toString(), // If backend expects this to update
        "Img": image,
        "Qty": qty,
        "UnitPrice": unitPrice,
        "TotalPrice": totalPrice,
      };

      print("🔗 Update URL: $url");
      print("🔢 Product ID for Update: $id");
      print("📤 Sending Update Request Body: ${jsonEncode(requestBody)}");


      final response = await http.put(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );

      print("📥 Status: ${response.statusCode}");
      print("📦 Response: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("✅ Product updated successfully!");
        await fetchProducts(); // Refresh products after update
        return true;
      } else {
        print("❌ Update failed! Status: ${response.statusCode}, Body: ${response.body}");
        return false;
      }
    } catch (e) {
      print("Error updating product: $e");
      return false;
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
