import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/method/api.dart';
import 'package:login/screen/login.dart';
import 'package:login/screen/register.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {


  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,

          // all content
          child: Container(
            padding: EdgeInsets.fromLTRB(
                24 * fem, 181.28 * fem, 24 * fem, 179 * fem),
            width: double.infinity,

            // background linear
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(1, -1),
                end: Alignment(-1, 1),
                colors: <Color>[
                  Color(0xffeef0ff),
                  Color(0xfffbfcff),
                  Color(0xfff9faff),
                  Color(0x00ecefff)
                ],
                stops: <double>[0, 0.255, 0.568, 1],
              ),
            ),

            // content
            child: Column(
              // center everything
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // image first
                Container(
                  margin: EdgeInsets.fromLTRB(
                      0 * fem, 0 * fem, 0 * fem, 33.28 * fem),
                  width: 312 * fem,
                  height: 230.44 * fem,
                  child: Image.asset(
                    'assets/images/first-hero.png',
                    width: 312 * fem,
                    height: 230.44 * fem,
                  ),
                ),

                // all text
                Container(
                  margin: EdgeInsets.fromLTRB(
                      18 * fem, 0 * fem, 18 * fem, 35 * fem),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // first text
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 7 * fem, 8 * fem),
                        child: Text(
                          'Book Book!',
                          style: GoogleFonts.poppins(
                            fontSize: 30 * ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.5 * ffem / fem,
                            letterSpacing: 2.1 * fem,
                            color: Color(0xff1b36c4),
                          ),
                        ),
                      ),

                      // second text
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: 276 * fem,
                        ),
                        child: Text(
                          'Books and doors are the same thing. You open it and you go to another world.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                            fontSize: 13 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.5 * ffem / fem,
                            letterSpacing: 0.26 * fem,
                            color: Color(0xff495bbc),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),

                // all button
                Container(
                  margin:
                      EdgeInsets.fromLTRB(15 * fem, 0 * fem, 15 * fem, 0 * fem),
                  width: double.infinity,
                  height: 49 * fem,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5 * fem),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // first button
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 18 * fem, 0 * fem),
                          width: 132 * fem,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xff314ee6),
                            borderRadius: BorderRadius.circular(5 * fem),
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

                      // second button
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()));
                        },
                        child: Container(
                          // group114TUz (23:150)
                          width: 132 * fem,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5 * fem),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                // signupo34 (23:151)
                                left: 38 * fem,
                                top: 13 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 57 * fem,
                                    height: 23 * fem,
                                    child: Text(
                                      'Sign up',
                                      style: GoogleFonts.poppins(
                                        fontSize: 15 * ffem,
                                        fontWeight: FontWeight.w500,
                                        height: 1.5 * ffem / fem,
                                        color: Color(0xff314ee6),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // rectangle80UQ6 (23:152)
                                left: 0 * fem,
                                top: 0 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 132 * fem,
                                    height: 49 * fem,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5 * fem),
                                        border: Border.all(
                                            color: Color(0xff314ee6)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
