import 'package:flutter/material.dart';
import 'package:if_else_statement/flutter_code/models/productModel.dart';
import 'package:if_else_statement/flutter_code/productController.dart';

import 'widget/ProductCard.dart';

class ApiWork extends StatefulWidget {
  const ApiWork({super.key});

  @override
  State<ApiWork> createState() => _ApiWorkState();
}

class _ApiWorkState extends State<ApiWork> {
  final Productcontroller productcontroller = Productcontroller();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   setState(() {
  //     productcontroller.fetchProducts();
  //
  //   });
  //
  // }


  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  Future<void> loadProducts() async {
    print('Loading products...');
    await productcontroller.fetchProducts();
    print('Products loaded: ${productcontroller.products.length}');
    setState(() {});
  }

  // Future<void> loadProducts() async {
  //   await productcontroller.fetchProducts();
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {



    // void productDilouge() {
    //   TextEditingController productNameController = TextEditingController();
    //   TextEditingController productQTyController = TextEditingController();
    //   TextEditingController productImageController = TextEditingController();
    //   TextEditingController productUnitPriceController = TextEditingController();
    //   TextEditingController productTotalPriceController = TextEditingController();
    //
    //   showDialog(
    //     context: context,
    //     builder:
    //         (context) => AlertDialog(
    //           title: Text('Add Product'),
    //           content: Column(
    //             mainAxisSize: MainAxisSize.min,
    //             children: [
    //               TextField(
    //                 decoration: InputDecoration(labelText: 'Product name'),
    //               ),
    //               TextField(
    //                 decoration: InputDecoration(labelText: 'productQuantity'),
    //               ),
    //               TextField(
    //                 decoration: InputDecoration(labelText: 'Product Image'),
    //               ),
    //               TextField(
    //                 decoration: InputDecoration(
    //                   labelText: 'Product Unit Price',
    //                 ),
    //               ),
    //               TextField(
    //                 decoration: InputDecoration(
    //                   labelText: 'Product Totall Price',
    //                 ),
    //               ),
    //               SizedBox(height: 10),
    //               Row(
    //                 children: [
    //                   TextButton(
    //                     onPressed: () {
    //                       Navigator.pop(context);
    //                     },
    //                     child: Text('Close'),
    //                   ),
    //                   SizedBox(width: 5),
    //                   ElevatedButton(
    //                     onPressed: () {},
    //                     child: Text('AddProduct'),
    //                   ),
    //                 ],
    //               ),
    //             ],
    //           ),
    //         ),
    //   );
    // }
    void productDialog({Data? product}) {
      TextEditingController productNameController =
      TextEditingController(text: product?.productName ?? '');
      TextEditingController productQtyController =
      TextEditingController(text: product?.qty?.toString() ?? '');
      TextEditingController productImageController =
      TextEditingController(text: product?.img ?? '');
      TextEditingController productUnitPriceController =
      TextEditingController(text: product?.unitPrice?.toString() ?? '');
      TextEditingController productTotalPriceController =
      TextEditingController(text: product?.totalPrice?.toString() ?? '');

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(product == null ? 'Add Product' : 'Edit Product'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: productNameController,
                  decoration: InputDecoration(labelText: 'Product name'),
                ),
                TextField(
                  controller: productQtyController,
                  decoration: InputDecoration(labelText: 'Quantity'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: productImageController,
                  decoration: InputDecoration(labelText: 'Product Image URL'),
                ),
                TextField(
                  controller: productUnitPriceController,
                  decoration: InputDecoration(labelText: 'Unit Price'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: productTotalPriceController,
                  decoration: InputDecoration(labelText: 'Total Price'),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Close'),
                    ),
                    SizedBox(width: 5),
                    ElevatedButton(
                      onPressed: () async {
                        if (product == null) {
                          // ADD
                          await productcontroller.createProduct(
                            name: productNameController.text,
                            image: productImageController.text,
                            qty: int.parse(productQtyController.text.trim()) ?? 0,
                            unitPrice:
                            int.parse(productUnitPriceController.text.trim()) ?? 0,
                            totalPrice:
                            int.parse(productTotalPriceController.text.trim()) ?? 0,
                          );

                        }
                        else {
                          // EDIT (Update)
                          await productcontroller.updateProduct(
                            id: product.sId!,
                            name: productNameController.text,
                            image: productImageController.text,
                            qty: int.parse(productQtyController.text.trim()) ?? 0,
                            unitPrice:
                            int.parse(productUnitPriceController.text.trim()) ?? 0,
                            totalPrice:
                            int.parse(productTotalPriceController.text.trim()) ?? 0,
                          );
                          Navigator.pop(context);
                        }

                       // Navigator.pop(context);
                        await loadProducts();  // Refresh grid
                      },
                      child: Text(product == null ? 'Add Product' : 'Update Product'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Productt Crud'),
        backgroundColor: Colors.orange,
        // backgroundColor: Colors.pinkAccent,
        centerTitle: true,
      ),
      body: productcontroller.products.isEmpty
          ? Center(child: Text('No products available'))
          : GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          childAspectRatio: 0.6,
        ),
        itemCount: productcontroller.products.length,
        itemBuilder: (context, index) {
          var product = productcontroller.products[index];
          return ProductCard(
            product: product,
            onEdit: () => productDialog(product: product),
            onDelete: () async {
              await productcontroller.DeleteProducts(product.sId.toString());
              await loadProducts();
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => productDialog(),
        child: Icon(Icons.add),
      ),


    );
  }
}


