import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

import 'package:login/method/api.dart';
import 'package:login/screen/home.dart';
import 'package:login/screen/register.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void loginUser() async {
    final data = {
      'email': email.text.toString(),
      'password': password.text.toString(),
    };
    final result = await Api().postRequest(route: '/login', data: data);
    final response = jsonDecode(result.body);
    if (response['status'] == 200) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.setInt('user_id', response['user']['id']);
      await preferences.setString('name', response['user']['name']);
      await preferences.setString('email', response['user']['email']);
      await preferences.setString('token', response['token']);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response['message']),
        ),
      );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Home(),
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
                    top: 185 * fem,
                    child: Container(
                      width: 285 * fem,
                      height: 460 * fem,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // all text
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 44 * fem),
                            width: 175 * fem,
                            height: 66 * fem,
                            child: Stack(
                              children: [
                                // first text
                                Positioned(
                                  left: 0 * fem,
                                  top: 0 * fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 175 * fem,
                                      height: 45 * fem,
                                      child: Text(
                                        'Welcome!',
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
                                      width: 145 * fem,
                                      height: 23 * fem,
                                      child: Text(
                                        'Sign in to continue',
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
                                0 * fem, 0 * fem, 0 * fem, 42 * fem),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5 * fem),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 16 * fem),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(5 * fem),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // first input (email)
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0 * fem, 0 * fem, 25 * fem),
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5 * fem),
                                          color:
                                              Color.fromRGBO(243, 245, 255, 1),
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
                                            hintStyle: TextStyle(
                                                color: Color(0xff909fec)),
                                          ),
                                          style: GoogleFonts.poppins(
                                            fontSize: 12 * ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.5 * ffem / fem,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),

                                      // second input (password)
                                      Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5 * fem),
                                          color:
                                              Color.fromRGBO(243, 245, 255, 1),
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
                                            hintStyle: TextStyle(
                                                color: Color(0xff909fec)),
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

                                // forget password
                                Text(
                                  'forgot password?',
                                  style: GoogleFonts.poppins(
                                    fontSize: 10 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.5 * ffem / fem,
                                    letterSpacing: 0.2 * fem,
                                    color: Color(0xff4d68f4),
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
                                // first button (sign in button)
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
                                        loginUser();
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
                                            'Sign in',
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

                                // second button (sign in with foogle button)
                                TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(54 * fem,
                                        12 * fem, 54 * fem, 12.58 * fem),
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
                                            'Sign in with Google',
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

                          // page sigin up
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                7 * fem, 0 * fem, 0 * fem, 0 * fem),
                            child: Row(
                              children: [
                                Text(
                                  'Don\'t have an account?',
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
                                            builder: (context) => Register()));
                                  },
                                  child: Text(
                                    'Sign up',
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
