import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_app/event_screen.dart';
import 'package:first_app/guest_screen.dart';

class SecondScreen extends StatefulWidget {
  String namaSecond;
  final String namaLomba;
  final String namaGuest;
  final int tglLahir;
  final int bulanLahir;


  SecondScreen({
    required this.namaSecond,
    required this.namaLomba,
    required this.namaGuest,
    required this.tglLahir,
    required this.bulanLahir,
  });

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  String? cekPalindrome;
  bool batascek = true;
  int i = 2;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    if((widget.tglLahir % 2 == 0) && (widget.tglLahir % 3 == 0)){
      WidgetsBinding.instance!
          .addPostFrameCallback((_) => _scaffoldKey.currentState!.showSnackBar(SnackBar(content: Image.asset('images/ios.png'))));
    } else if (widget.tglLahir % 3 == 0){
      WidgetsBinding.instance!
          .addPostFrameCallback((_) => _scaffoldKey.currentState!.showSnackBar(SnackBar(content: Icon(Icons.android))));
    } else if (widget.tglLahir % 2 == 0){
      WidgetsBinding.instance!
          .addPostFrameCallback((_) => _scaffoldKey.currentState!.showSnackBar(SnackBar(content: Image.asset('images/blackberry.jpg'))));
    } else if (widget.tglLahir != -1) {
      WidgetsBinding.instance!
          .addPostFrameCallback((_) => _scaffoldKey.currentState!.showSnackBar(SnackBar(content: Image.asset('images/feature_phone.jpg'))));
    }

    cekPalindrome = widget.namaSecond.replaceAll(new RegExp(r"\s+"), "");
    if(cekPalindrome == cekPalindrome!.split('').reversed.join()){
      WidgetsBinding.instance!
          .addPostFrameCallback((_) => _scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text('isPalindrome'))));
    } else {
      WidgetsBinding.instance!
          .addPostFrameCallback((_) => _scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text('not palindrome'))));
    }

    while(batascek && (i < widget.bulanLahir)){
      if (widget.bulanLahir % i == 0){
        batascek = false;
      } else {
        batascek = true;
      }
      i++;
    }

    if (batascek == false || widget.bulanLahir == 1){
      WidgetsBinding.instance!
          .addPostFrameCallback((_) => _scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text('Bukan Prima'))));
    } else if (widget.bulanLahir != 0){
      WidgetsBinding.instance!
          .addPostFrameCallback((_) => _scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text('Prima'))));
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Nama : ${widget.namaSecond}'),
            SizedBox(
              height: 20.0,
            ),
            OutlineButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return EventScreen(
                    namaEvent: widget.namaSecond,
                  );
                }));
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('${widget.namaLomba}'),
              ),
              borderSide: BorderSide(
                width: 2.0,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            OutlineButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return GuestScreen(namaPenggunaAwal: widget.namaSecond,);
                }));
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(widget.namaGuest),
              ),
              borderSide: BorderSide(
                width: 2.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
