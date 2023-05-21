import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:login/method/api.dart';
import 'package:login/screen/login.dart';


class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  void registerUser() async {

    final data = {
      'email': email.text.toString(),
      'name': name.text.toString(),
      'password': password.text.toString(),
    };

    
    final result = await Api().postRequest(route: '/register', data: data);
    final response = jsonDecode(result.body);
    if (response['status'] == 200) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: ListView(
        children: [
          // all content
          Container(
            width: double.infinity,
            child: Container(
              width: double.infinity,
              height: 800 * fem,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Stack(
                children: [
                  // lamp image
                  Positioned(
                    left: 209 * fem,
                    top: -138 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 143 * fem,
                        height: 357 * fem,
                        child: Image.asset(
                          'assets/images/lampu.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  // content
                  Positioned(
                    left: 37 * fem,
                    top: 159 * fem,
                    child: Container(
                      width: 285 * fem,
                      height: 487 * fem,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // all text
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 35 * fem),
                            width: 174 * fem,
                            height: 66 * fem,
                            child: Stack(
                              children: [
                                // first text
                                Positioned(
                                  left: 0 * fem,
                                  top: 0 * fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 49 * fem,
                                      height: 45 * fem,
                                      child: Text(
                                        'Hi!',
                                        style: GoogleFonts.poppins(
                                          fontSize: 30 * ffem,
                                          fontWeight: FontWeight.w700,
                                          height: 1.5 * ffem / fem,
                                          letterSpacing: 2.1 * fem,
                                          color: Color(0xff314ee6),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                // second text
                                Positioned(
                                  left: 0 * fem,
                                  top: 43 * fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 174 * fem,
                                      height: 23 * fem,
                                      child: Text(
                                        'Create a new account',
                                        style: GoogleFonts.poppins(
                                          fontSize: 15 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.5 * ffem / fem,
                                          letterSpacing: 0.3 * fem,
                                          color: Color(0xff4d68f4),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // all input
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 35 * fem),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5 * fem),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // first input (username)
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(5 * fem),
                                    color: Color.fromRGBO(243, 245, 255, 1),
                                  ),
                                  child: TextFormField(
                                    controller: name,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          16 * fem,
                                          18 * fem,
                                          16 * fem,
                                          13 * fem),
                                      hintText: 'Username',
                                      hintStyle:
                                          TextStyle(color: Color(0xff909fec)),
                                    ),
                                    style: GoogleFonts.poppins(
                                      fontSize: 12 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.5 * ffem / fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: 25 * fem,
                                ),

                                // second input (email)
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(5 * fem),
                                    color: Color.fromRGBO(243, 245, 255, 1),
                                  ),
                                  child: TextFormField(
                                    controller: email,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          16 * fem,
                                          18 * fem,
                                          16 * fem,
                                          13 * fem),
                                      hintText: 'Email',
                                      hintStyle:
                                          TextStyle(color: Color(0xff909fec)),
                                    ),
                                    style: GoogleFonts.poppins(
                                      fontSize: 12 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.5 * ffem / fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: 25 * fem,
                                ),

                                // third input (password)
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(5 * fem),
                                    color: Color.fromRGBO(243, 245, 255, 1),
                                  ),
                                  child: TextFormField(
                                    controller: password,
                                    // make the field secret
                                    obscureText: true,

                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          17 * fem,
                                          18 * fem,
                                          17 * fem,
                                          13 * fem),
                                      hintText: 'Password',
                                      hintStyle:
                                          TextStyle(color: Color(0xff909fec)),
                                    ),
                                    style: GoogleFonts.poppins(
                                      fontSize: 12 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.5 * ffem / fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // all button
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 25 * fem),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // first button (sign up button)
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 17 * fem),
                                  child: TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        registerUser();
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 49 * fem,
                                        decoration: BoxDecoration(
                                          color: Color(0xff314ee6),
                                          borderRadius:
                                              BorderRadius.circular(5 * fem),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Create account',
                                            style: GoogleFonts.poppins(
                                              fontSize: 15 * ffem,
                                              fontWeight: FontWeight.w500,
                                              height: 1.5 * ffem / fem,
                                              color: Color(0xffffffff),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                // second button (sign up with google button)
                                TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(54 * fem,
                                        12 * fem, 48 * fem, 12.58 * fem),
                                    width: double.infinity,
                                    height: 49 * fem,
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xff314ee6)),
                                      borderRadius:
                                          BorderRadius.circular(5 * fem),
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 8.26 * fem, 0 * fem),
                                            width: 22 * fem,
                                            height: 22 * fem,
                                            child: Image.asset(
                                              'assets/images/google.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Text(
                                            'Sign up with Google',
                                            style: GoogleFonts.poppins(
                                              fontSize: 15 * ffem,
                                              fontWeight: FontWeight.w500,
                                              height: 1.5 * ffem / fem,
                                              color: Color(0xff314ee6),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // page sign in
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                7 * fem, 0 * fem, 0 * fem, 0 * fem),
                            child: Row(
                              children: [
                                Text(
                                  'Already have an account?',
                                  style: GoogleFonts.poppins(
                                    fontSize: 10 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.5 * ffem / fem,
                                    color: Color.fromRGBO(145, 159, 236, 1),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(right: 2 * fem)),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Login()));
                                  },
                                  child: Text(
                                    'Sign in',
                                    style: GoogleFonts.poppins(
                                      fontSize: 10 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.5 * ffem / fem,
                                      color: Color(0xff314ee6),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
