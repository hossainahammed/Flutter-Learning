import 'package:flutter/material.dart';

class add_water_Button extends StatelessWidget {
  const add_water_Button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ElevatedButton.icon(onPressed:(){},
          label: Text('+200 ml ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,),),
          icon:Icon(Icons.water_drop),
        ),
      ),
    );
  }
}