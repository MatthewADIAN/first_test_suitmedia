import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_app/event_screen.dart';
import 'package:first_app/guest_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';


class SecondScreen extends StatefulWidget {
  final String namaSecond;
  final String namaLomba;
  final String namaGuest;
  final int tglLahir;


  SecondScreen({
    required this.namaSecond,
    required this.namaLomba,
    required this.namaGuest,
    required this.tglLahir,
  });

  @override
  _SecondScreenState createState() => _SecondScreenState(tglLahirStatus: tglLahir);
}

class _SecondScreenState extends State<SecondScreen> {

  //FToast? fToast;
  final int tglLahirStatus;

  _SecondScreenState({required this.tglLahirStatus});

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    //fToast = FToast();
    //fToast!.init(context);
    if((tglLahirStatus % 2 == 0) && (tglLahirStatus % 3 == 0)){
      WidgetsBinding.instance!
          .addPostFrameCallback((_) => _scaffoldKey.currentState!.showSnackBar(SnackBar(content: Image.asset('images/ios.png'))));
    } else if (tglLahirStatus % 3 == 0){
      WidgetsBinding.instance!
          .addPostFrameCallback((_) => _scaffoldKey.currentState!.showSnackBar(SnackBar(content: Icon(Icons.android))));
    } else if (tglLahirStatus % 2 == 0){
      WidgetsBinding.instance!
          .addPostFrameCallback((_) => _scaffoldKey.currentState!.showSnackBar(SnackBar(content: Image.asset('images/blackberry.jpg'))));
    } else if (tglLahirStatus != -1) {
      WidgetsBinding.instance!
          .addPostFrameCallback((_) => _scaffoldKey.currentState!.showSnackBar(SnackBar(content: Image.asset('images/feature_phone.jpg'))));
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

  _showToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text("This is a Custom Toast"),
        ],
      ),
    );

    /*fToast!.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );*/
  }

}
