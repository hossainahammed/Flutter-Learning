import 'package:flutter/material.dart';

import 'widget/ProductCard.dart';

class ApiWork extends StatefulWidget {
  const ApiWork({super.key});

  @override
  State<ApiWork> createState() => _ApiWorkState();
}

class _ApiWorkState extends State<ApiWork> {
  @override
  Widget build(BuildContext context) {
    void productDilouge() {
      TextEditingController productNameController = TextEditingController();
      TextEditingController productQTyController = TextEditingController();
      TextEditingController productImageController = TextEditingController();
      TextEditingController productUnitPriceController =
          TextEditingController();
      TextEditingController productTotalPriceController =
          TextEditingController();

      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: Text('Add Product'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Product name'),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'productQuantity'),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Product Image'),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Product Unit Price',
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Product Totall Price',
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Close'),
                      ),
                      SizedBox(width: 5),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('AddProduct'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Crud'),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          // mainAxisExtent: 10,
          childAspectRatio: 0.6,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return ProductCard(onEdit: () {
            productDilouge();
          }, onDelete: () {  },);

        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => productDilouge(),
        child: Icon(Icons.add),
      ),
    );
  }
}


