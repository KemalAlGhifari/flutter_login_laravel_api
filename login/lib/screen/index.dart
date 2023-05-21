import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:http/http.dart' as http;
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/screen/form.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url = 'http://127.0.0.1:8000/api/buku';
  Future getBuku() async {
    var respone = await http.get(Uri.parse(url));
    return jsonDecode(respone.body);
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Container(
            // androidlarge10eza (88:6619)
            width: double.infinity,
            height: 839 * fem,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Stack(
              children: [
                Positioned(
                  // rectangle82y1G (88:6620)
                  left: 0 * fem,
                  top: 0 * fem,
                  child: Align(
                    child: SizedBox(
                      width: 360 * fem,
                      height: 210 * fem,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(-1, -1),
                            end: Alignment(1, 1.154),
                            colors: <Color>[
                              Color(0x4cdde3ff),
                              Color(0xfffcfcff),
                              Color(0xfffafbff),
                              Color(0x4cdde3ff)
                            ],
                            stops: <double>[0.034, 0.403, 0.701, 0.906],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // group140oFC (90:9)
                  left: 36 * fem,
                  top: 242 * fem,
                  child: Container(
                    width: 287 * fem,
                    height: 574 * fem,
                    child: FutureBuilder(
                      future: getBuku(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            physics: const ClampingScrollPhysics(),
                              itemCount: snapshot.data['data'].length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    // autogroupycgxVti (JNtxb7dzYhQshysKsRyCgX)
                                    margin: EdgeInsets.fromLTRB(
                                        1 * fem, 0 * fem, 0 * fem, 20 * fem),
                                    padding: EdgeInsets.fromLTRB(
                                        13 * fem, 18 * fem, 12 * fem, 18 * fem),
                                    width: double.infinity,
                                    height: 179 * fem,
                                    decoration: BoxDecoration(
                                      color: Color(0xfff8f4ff),
                                      borderRadius:
                                          BorderRadius.circular(5 * fem),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          // image41Nhc (88:6622)
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 11 * fem, 0 * fem),
                                          width: 89 * fem,
                                          height: 143 * fem,
                                          child: Image.network(
                                            snapshot.data['data'][index]['img'],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Container(
                                          // group127hjt (88:6623)
                                          width: 161 * fem,
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5 * fem),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                // group126qbC (88:6624)
                                                margin: EdgeInsets.fromLTRB(
                                                    0 * fem,
                                                    0 * fem,
                                                    5 * fem,
                                                    29 * fem),
                                                width: 156 * fem,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      // autogroupb5vrmDx (JNtxnmyEGwYSmnD17cB5VR)
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              1 * fem,
                                                              0 * fem,
                                                              0 * fem,
                                                              0 * fem),
                                                      width: 155 * fem,
                                                      height: 50 * fem,
                                                      child: Stack(
                                                        children: [
                                                          Positioned(
                                                            // group123fq8 (88:6625)
                                                            left: 0 * fem,
                                                            top: 13 * fem,
                                                            child: Container(
                                                              width: 155 * fem,
                                                              height: 23 * fem,
                                                              child: Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Container(
                                                                    // perahukertasCaA (88:6626)
                                                                    margin: EdgeInsets.fromLTRB(
                                                                        0 * fem,
                                                                        0 * fem,
                                                                        3 * fem,
                                                                        0 * fem),
                                                                    child: Text(
                                                                      snapshot.data['data']
                                                                              [
                                                                              index]
                                                                          [
                                                                          'judul'],
                                                                      style: GoogleFonts
                                                                          .poppins(
                                                                        fontSize:
                                                                            15 *
                                                                                ffem,
                                                                        fontWeight:
                                                                            FontWeight.w700,
                                                                        height: 1.5 *
                                                                            ffem /
                                                                            fem,
                                                                        color: Color(
                                                                            0xff314ee6),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    // uzN (88:6627)
                                                                    '#1127',
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      fontSize:
                                                                          15 *
                                                                              ffem,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      height: 1.5 *
                                                                          ffem /
                                                                          fem,
                                                                      color: Color(
                                                                          0xff314ee6),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            // cahayadewifCr (88:6628)
                                                            left: 0 * fem,
                                                            top: 35 * fem,
                                                            child: Align(
                                                              child: SizedBox(
                                                                width: 67 * fem,
                                                                height:
                                                                    15 * fem,
                                                                child: Text(
                                                                  'Cahaya Dewi',
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    fontSize:
                                                                        10 *
                                                                            ffem,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    height: 1.5 *
                                                                        ffem /
                                                                        fem,
                                                                    color: Color(
                                                                        0xff314ee6),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            // fiksiZ3L (88:6629)
                                                            left: 0 * fem,
                                                            top: 0 * fem,
                                                            child: Align(
                                                              child: SizedBox(
                                                                width: 40 * fem,
                                                                height:
                                                                    15 * fem,
                                                                child: Text(
                                                                  snapshot.data[
                                                                              'data']
                                                                          [
                                                                          index]
                                                                      [
                                                                      'katagori'],
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    fontSize:
                                                                        10 *
                                                                            ffem,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    height: 1.5 *
                                                                        ffem /
                                                                        fem,
                                                                    color: Color(
                                                                        0xff919fec),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 3 * fem,
                                                    ),
                                                    Container(
                                                      // group124Scv (88:6631)
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              1 * fem,
                                                              0 * fem,
                                                              66 * fem,
                                                              0 * fem),
                                                      width: double.infinity,
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            // gramedianRt (88:6632)
                                                            margin: EdgeInsets
                                                                .fromLTRB(
                                                                    0 * fem,
                                                                    0 * fem,
                                                                    14 * fem,
                                                                    0 * fem),
                                                            child: Text(
                                                              snapshot.data[
                                                                          'data']
                                                                      [index]
                                                                  ['penerbit'],
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                fontSize:
                                                                    10 * ffem,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                height: 1.5 *
                                                                    ffem /
                                                                    fem,
                                                                color: Color(
                                                                    0xff919fec),
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            // uFc (88:6633)
                                                            snapshot
                                                                .data['data']
                                                                    [index][
                                                                    'tahun_terbit']
                                                                .toString(),
                                                            style: GoogleFonts
                                                                .poppins(
                                                              fontSize:
                                                                  10 * ffem,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              height: 1.5 *
                                                                  ffem /
                                                                  fem,
                                                              color: Color(
                                                                  0xff919fec),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 3 * fem,
                                                    ),
                                                    Text(
                                                      // q9G (88:6630)
                                                      '2022-05-03',
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 10 * ffem,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height:
                                                            1.5 * ffem / fem,
                                                        color:
                                                            Color(0xff919fec),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                // group125n4W (88:6634)
                                                margin: EdgeInsets.fromLTRB(
                                                    29 * fem,
                                                    0 * fem,
                                                    0 * fem,
                                                    0 * fem),
                                                width: double.infinity,
                                                height: 28 * fem,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5 * fem),
                                                ),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      // group110hhG (88:6638)
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              0 * fem,
                                                              0 * fem,
                                                              4 * fem,
                                                              0 * fem),
                                                      width: 64 * fem,
                                                      height: double.infinity,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Color(
                                                                0xff314ee6)),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    5 * fem),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          'Edit',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontSize: 13 * ffem,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            height: 1.5 *
                                                                ffem /
                                                                fem,
                                                            color: Color(
                                                                0xff314ee6),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      // group109mx2 (88:6635)
                                                      width: 64 * fem,
                                                      height: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xff314ee6),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    5 * fem),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          'Delete',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontSize: 13 * ffem,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            height: 1.5 *
                                                                ffem /
                                                                fem,
                                                            color: Color(
                                                                0xffffffff),
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
                                );
                              });
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                ),
                Positioned(
                  // group13514J (88:6687)
                  left: 26 * fem,
                  top: 62 * fem,
                  child: Container(
                    width: 346 * fem,
                    height: 182 * fem,
                    child: Stack(
                      children: [
                        Positioned(
                          // group134L6a (88:6688)
                          left: 0 * fem,
                          top: 19 * fem,
                          child: Container(
                            width: 166 * fem,
                            height: 106 * fem,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // group1034HU (88:6689)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 9 * fem),
                                  width: double.infinity,
                                  height: 66 * fem,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        // bookPqY (88:6690)
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
                                        // thisisyourcollectionhrE (88:6691)
                                        left: 0 * fem,
                                        top: 43 * fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 166 * fem,
                                            height: 23 * fem,
                                            child: Text(
                                              'This is your collection',
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
                                InkWell(
                                     onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        AddBook()));
                                          },
                                  child: Container(
                                    // group111QEr (88:6693)
                                    padding: EdgeInsets.fromLTRB(
                                        6 * fem, 6 * fem, 9 * fem, 5 * fem),
                                    width: 130 * fem,
                                    height: 31 * fem,
                                    decoration: BoxDecoration(
                                      color: Color(0xff314ee6),
                                      borderRadius:
                                          BorderRadius.circular(5 * fem),
                                    ),
                                    child: Container(
                                      // group133Kci (88:6695)
                                      padding: EdgeInsets.fromLTRB(
                                          3.75 * fem, 0 * fem, 0 * fem, 0 * fem),
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // icroundaddGH4 (88:6697)
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 6.75 * fem, 0 * fem),
                                            width: 10.5 * fem,
                                            height: 10.5 * fem,
                                            child: Image.asset(
                                              'assets/imageHome/ic-round-add-UTQ.png',
                                              width: 10.5 * fem,
                                              height: 10.5 * fem,
                                            ),
                                          ),
                                          Text(
                                            // addnewbookmUi (88:6696)
                                            'Add New Book',
                                            style: GoogleFonts.poppins(
                                              fontSize: 13 * ffem,
                                              fontWeight: FontWeight.w500,
                                              height: 1.5 * ffem / fem,
                                              color: Color(0xffffffff),
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
                        ),
                        Positioned(
                          // bookloverflatline21JUe (88:6699)
                          left: 159.1993408203 * fem,
                          top: 19.2297363281 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 148.6 * fem,
                              height: 143.55 * fem,
                              child: Image.asset(
                                'assets/imageHome/book-loverflatline-2-1.png',
                                width: 148.6 * fem,
                                height: 143.55 * fem,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  // group133bie (90:2)
                  left: 272 * fem,
                  top: 22 * fem,
                  child: Container(
                    width: 63 * fem,
                    height: 31 * fem,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5 * fem),
                    ),
                    child: Container(
                      // group111jK4 (90:3)
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xff4d68f5),
                        borderRadius: BorderRadius.circular(5 * fem),
                      ),
                      child: Center(
                        child: Text(
                          'Logout',
                          style: GoogleFonts.poppins(
                            fontSize: 13 * ffem,
                            fontWeight: FontWeight.w500,
                            height: 1.5 * ffem / fem,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
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
