import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
import 'listView.dart';
import 'grid_View.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login page"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'asset/images.png',
                height: 250,
                width: 250,
                fit: BoxFit.cover,
              ),
              Image.network(
                '[https://www.freepnglogos.com/pics/logo-facebookpng#google\_vignette](https://www.freepnglogos.com/pics/logo-facebookpng#google_vignette)',
              ),

              Text('Login with your password'),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Phone Number'),
                    TextFormField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        hintText: 'Phone number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter your phone number';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter your password';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 character';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 20),

                    SizedBox(
                      width: 300,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Login Successful')),
                            );
                          }
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                      Home_page(name: phoneController.text),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.blue, // Button background color
                          foregroundColor: Colors.white, // Text/icon color
                        ),

                        child: Text('Login'),
                      ),


                    ),
                    ElevatedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Listview()),);
                    },style: ElevatedButton.styleFrom(
                      backgroundColor:
                      Colors.blue, // Button background color
                      foregroundColor: Colors.white, // Text/icon color
                    ),
                        child: Text('List')),


                    ElevatedButton(onPressed: (){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => GridV()),);
                    },
                        style: ElevatedButton.styleFrom(
                      backgroundColor:
                      Colors.blue, // Button background color
                      foregroundColor: Colors.white, // Text/icon color
                    ),
                        child: Text('List'))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
