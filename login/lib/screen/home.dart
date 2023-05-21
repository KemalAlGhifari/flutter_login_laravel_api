import 'package:flutter/material.dart';
import 'package:login/screen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  late SharedPreferences preferences;
  bool isLoad = false;
  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    setState(() {
      isLoad = true;
    });
    preferences = await SharedPreferences.getInstance();
    setState(() {
      isLoad = false;
    });
  }

  void logout() {
    preferences.clear();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => Login(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
        double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SafeArea(
          child: isLoad
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    Text("Welcome to"),
                    Text(preferences.getInt('user_id').toString()),
                    Text(preferences.getString('name').toString()),
                    Text(preferences.getString('email').toString()),
                    Text(preferences.getString('token').toString()),
                    InkWell(
                      onTap: logout,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.height / 5,
                        color: Colors.red,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('logout'),
                        ),
                      ),
                    )
                  ],
                )),
    );
  }
}
