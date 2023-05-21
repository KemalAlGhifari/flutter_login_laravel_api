import 'package:flutter/material.dart';
import 'package:login/screen/first.dart';
import 'package:login/screen/form.dart';
import 'package:login/screen/home.dart';
import 'package:login/screen/index.dart';
import 'package:login/screen/login.dart';
import 'package:login/screen/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: FutureBuilder(
          future: SharedPreferences.getInstance(), //memanggil fungsi nya
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(), //tampilan saat masih proses
              ); 
            } else if (snapshot.hasError) { 
              return Text('Some error has Occurred'); //tampilan saat terjadi error
            } else if (snapshot.hasData) {
              final token = snapshot.data!.getString('token');
              if (token != null) {
                return Home(); //jika ada token ke home
              } else {
                return HomePage(); //jika tidak akan ke login
              }
            } else {
              return HomePage();
            }
          }),
    );
  }
}


  
