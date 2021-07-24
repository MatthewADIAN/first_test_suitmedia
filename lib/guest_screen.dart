import 'package:flutter/material.dart';
import 'package:first_app/model/guest_data.dart';
import 'package:first_app/second_screen.dart';

class GuestScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GUEST'),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          children: guestList.map((data) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SecondScreen(namaLomba: '', namaSecond: '',);
                }));
              },
              child: Card(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Image.asset(
                        data.imageAsset,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
