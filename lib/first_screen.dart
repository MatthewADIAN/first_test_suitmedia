import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_app/second_screen.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String _nama = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 50.0, right: 50.0,),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'masukan nama...',
                  border: OutlineInputBorder(),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _nama = value!;
                  });
                },
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 150, height: 62),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SecondScreen(
                      namaSecond: _nama,
                      namaLomba: 'pilih event',
                      namaGuest: 'pilih guest',
                      tglLahir: '',
                    );
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text('next'),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
