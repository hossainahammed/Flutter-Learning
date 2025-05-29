import 'package:flutter/material.dart';

class add_water_Button extends StatelessWidget {
  final int amount;
  IconData ? icon;
  final VoidCallback onClick;
   add_water_Button({
    super.key, required this.amount, required this.onClick,this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ElevatedButton.icon(onPressed:onClick,
          label: Text('+${amount} Liter ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white,),),
          icon:Icon(icon ?? Icons.water_drop,color: Colors.blueAccent,),style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,),
        ),
      ),
    );
  }
}