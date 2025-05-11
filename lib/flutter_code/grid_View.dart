import 'package:flutter/material.dart';

class GridV extends StatelessWidget {
  const GridV({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grid view"),
      ),

    body: GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: List.generate(10, (index) {
        return Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.phone, color: Colors.blue),
                    const Spacer(),
                    const Icon(Icons.delete, color: Colors.red),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  "Taufiq",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const Text("017929562"),
              ],
            ),
          ),
        );
      }),
    ),

    );
  }
}
