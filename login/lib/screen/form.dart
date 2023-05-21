import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/method/api.dart';
import 'package:login/screen/index.dart';
import 'package:login/screen/login.dart';
import 'package:login/widget/dropdown.dart';

class AddBook extends StatefulWidget {
  const AddBook({super.key});

  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  String selectedValue = "";
  bool _loading = false;
  TextEditingController judul = TextEditingController();
  TextEditingController penulis = TextEditingController();
  TextEditingController penerbit = TextEditingController();
  TextEditingController tahun_terbit = TextEditingController();
  TextEditingController img = TextEditingController();
  TextEditingController katagori = TextEditingController();

  void store() async {
    final data = {
      'judul': judul.text.toString(),
      'penulis': penulis.text.toString(),
      'penerbit': penerbit.text.toString(),
      'tahun_terbit': tahun_terbit.text.toString(),
      'img': img.text.toString(),
      'katagori': selectedValue.toString(),
    };
    final result = await Api().postRequest(route: '/buku/store', data: data);
    final response = jsonDecode(result.body);

    if (response['status'] == 200) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } else if (response['status'] == 300) {
      return print(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          Container(
            width: double.infinity,
            child: Container(
              // androidlarge7GjQ (82:4969)
              padding:
                  EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 107 * fem),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // readingabookflatline1NXY (82:4995)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 18.45 * fem),
                    width: 366.07 * fem,
                    height: 295.1 * fem,
                    child: Image.asset(
                      'assets/imageForm/reading-a-bookflatline-1.png',
                      width: 366.07 * fem,
                      height: 295.1 * fem,
                    ),
                  ),
                  Container(
                    // group121fWe (82:4970)
                    margin: EdgeInsets.fromLTRB(
                        37 * fem, 0 * fem, 38 * fem, 0 * fem),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5 * fem),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // group103adc (82:4992)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 23 * fem),
                          width: 162 * fem,
                          height: 66 * fem,
                          child: Stack(
                            children: [
                              Positioned(
                                // book7Ne (82:4993)
                                left: 0 * fem,
                                top: 0 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 111 * fem,
                                    height: 45 * fem,
                                    child: Text(
                                      'BOOK!',
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
                              Positioned(
                                // enteryourdatabookyve (82:4994)
                                left: 0 * fem,
                                top: 43 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 162 * fem,
                                    height: 23 * fem,
                                    child: Text(
                                      'Enter your data book',
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
                        Container(
                          // group1195Cz (82:4971)
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5 * fem),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // group11828E (82:4975)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 0 * fem, 27 * fem),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5 * fem),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // group1048h4 (82:4976)
                                      padding: EdgeInsets.only(left: 11 * fem),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xfff8f4ff)),
                                        color: Color(0xfff8f4ff),
                                        borderRadius:
                                            BorderRadius.circular(5 * fem),
                                      ),
                                      child: TextField(
                                        controller: judul,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          hintText: 'Judul',
                                          hintStyle: TextStyle(
                                              color: Color(0xff909fec)),
                                        ),
                                        style: GoogleFonts.poppins(
                                          fontSize: 9 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.5 * ffem / fem,
                                          color: Color(0xff919fec),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 21 * fem,
                                    ),
                                    Container(
                                      // group1048h4 (82:4976)
                                      padding: EdgeInsets.only(left: 11 * fem),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xfff8f4ff)),
                                        color: Color(0xfff8f4ff),
                                        borderRadius:
                                            BorderRadius.circular(5 * fem),
                                      ),
                                      child: TextField(
                                        controller: penulis,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          hintText: 'Penulis',
                                          hintStyle: TextStyle(
                                              color: Color(0xff909fec)),
                                        ),
                                        style: GoogleFonts.poppins(
                                          fontSize: 9 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.5 * ffem / fem,
                                          color: Color(0xff919fec),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 21 * fem,
                                    ),
                                    Container(
                                      // group1048h4 (82:4976)
                                      padding: EdgeInsets.only(left: 11 * fem),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xfff8f4ff)),
                                        color: Color(0xfff8f4ff),
                                        borderRadius:
                                            BorderRadius.circular(5 * fem),
                                      ),
                                      child: TextField(
                                        controller: penerbit,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          hintText: 'Penerbit',
                                          hintStyle: TextStyle(
                                              color: Color(0xff909fec)),
                                        ),
                                        style: GoogleFonts.poppins(
                                          fontSize: 9 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.5 * ffem / fem,
                                          color: Color(0xff919fec),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 21 * fem,
                                    ),
                                    Container(
                                      // group1048h4 (82:4976)
                                      padding: EdgeInsets.only(left: 11 * fem),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xfff8f4ff)),
                                        color: Color(0xfff8f4ff),
                                        borderRadius:
                                            BorderRadius.circular(5 * fem),
                                      ),
                                      child: TextField(
                                        controller: img,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          hintText: 'Image URL',
                                          hintStyle: TextStyle(
                                              color: Color(0xff909fec)),
                                        ),
                                        style: GoogleFonts.poppins(
                                          fontSize: 9 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.5 * ffem / fem,
                                          color: Color(0xff919fec),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 21 * fem,
                                    ),
                                    Container(
                                      // group117Wr2 (82:4985)
                                      width: double.infinity,
                                      height: 44 * fem,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5 * fem),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // group1074Mk (82:4986)
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 9 * fem, 0 * fem),
                                            padding: EdgeInsets.only(
                                              left: 9 * fem,
                                            ),
                                            width: 138 * fem,
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color(0xfff8f4ff)),
                                              color: Color(0xfff8f4ff),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      5 * fem),
                                            ),
                                            child: TextField(
                                              controller: tahun_terbit,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder:
                                                    InputBorder.none,
                                                hintText: 'Tahun Terbit',
                                                hintStyle: TextStyle(
                                                    color: Color(0xff909fec)),
                                              ),
                                              style: GoogleFonts.poppins(
                                                fontSize: 9 * ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.5 * ffem / fem,
                                                color: Color(0xff919fec),
                                              ),
                                            ),
                                          ),
                                          Container(
                                              // group111tra (82:4989)
                                              padding: EdgeInsets.only(
                                                  left: 9 * fem),
                                              width: 138 * fem,
                                              height: double.infinity,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Color(0xfff8f4ff)),
                                                color: Color(0xfff8f4ff),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        5 * fem),
                                              ),
                                              child: DropdownButtonFormField(
                                                  disabledHint: Text("Select"),
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    disabledBorder:
                                                        InputBorder.none,
                                                    hintText: 'Katagori',
                                                    hintStyle: TextStyle(
                                                        color:
                                                            Color(0xff909fec)),
                                                  ),
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 9 * ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.5 * ffem / fem,
                                                    color: Color(0xff919fec),
                                                  ),
                                                  value: selectedValue,
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(() {
                                                      selectedValue = newValue!;
                                                    });
                                                  },
                                                  items: dropdownItems)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  store();
                                  setState(() {
                                    _loading = true;
                                  });
                                },
                                child: Container(
                                  // group109Zhp (82:4972)
                                  width: double.infinity,
                                  height: 49 * fem,
                                  decoration: BoxDecoration(
                                    color: Color(0xff314ee6),
                                    borderRadius:
                                        BorderRadius.circular(5 * fem),
                                  ),
                                  child: Center(
                                    child: _loading
                                        ? CircularProgressIndicator()
                                        : Text(
                                            'Add book',
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
