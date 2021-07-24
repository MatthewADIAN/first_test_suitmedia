import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_app/event_screen.dart';
import 'package:first_app/guest_screen.dart';

class SecondScreen extends StatelessWidget {
  final String namaSecond;
  final String namaLomba;
  final String namaGuest;
  final String tglLahir;

  SecondScreen({
    required this.namaSecond,
    required this.namaLomba,
    required this.namaGuest,
    required this.tglLahir,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Nama : $namaSecond'),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return EventScreen(
                    namaEvent: namaSecond,
                  );
                }));
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('$namaLomba'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return GuestScreen(namaPenggunaAwal: namaSecond,);
                }));
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(namaGuest),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
