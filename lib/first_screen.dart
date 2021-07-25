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
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/bg_validation.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                
                Padding(
                  padding: const EdgeInsets.only(
                    left: 70.0,
                    right: 70.0,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'masukan nama...',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2.0,
                        ),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _nama = value!;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 250, height: 62),
                  child: OutlineButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return SecondScreen(
                          namaSecond: _nama,
                          namaLomba: 'pilih event',
                          namaGuest: 'pilih guest',
                          tglLahir: -1,
                          bulanLahir: 0,
                        );
                      }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text('next'),
                    ),
                    borderSide: BorderSide(
                      width: 2.0,
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
