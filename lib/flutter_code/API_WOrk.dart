import 'package:flutter/material.dart';

class ApiWork extends StatefulWidget {
  const ApiWork({super.key});

  @override
  State<ApiWork> createState() => _ApiWorkState();
}

class _ApiWorkState extends State<ApiWork> {
  @override
  Widget build(BuildContext context) {
    void productDilouge(){
      TextEditingController  productNameController = TextEditingController();
      TextEditingController  productQTyController = TextEditingController();
      TextEditingController  productImageController = TextEditingController();
      TextEditingController  productUnitPriceController = TextEditingController();
      TextEditingController  productTotalPriceController = TextEditingController();
      
      showDialog(context: context, builder: (context)=>
        AlertDialog(
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
                decoration: InputDecoration(labelText: 'Products Unit Price'),

              ),
              TextField(
                decoration: InputDecoration(labelText: 'Product Totall Price'),
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
      floatingActionButton: FloatingActionButton(onPressed: ()=>productDilouge(),
        child: Icon(Icons.add),),
    );
  }
}
