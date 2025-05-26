import 'package:flutter/material.dart';
import 'package:if_else_statement/flutter_code/aspect_ratio%20main.dart';
import 'My_App.dart';
import 'package:device_preview/device_preview.dart';

import 'waterTracker.dart';

void main() {

  runApp(
      DevicePreview(
        enabled: false ,
        //builder: (context)=>MyApp1() ,
        //builder: (context)=>MyApp() ,
        builder: (context)=>waterTracker() ,
      )
  );

}




