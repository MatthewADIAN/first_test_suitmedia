import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_app/model/event_data.dart';
import 'package:first_app/second_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EventScreenFragment extends StatelessWidget {
  final String namaEvent;

  EventScreenFragment({required this.namaEvent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          'images/btn_backArticle_normal.png',
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text('MESSAGE FROM $namaEvent'),
                      SizedBox(
                        width: 70.0,
                      ),
                      Icon(Icons.search),
                      Image.asset('images/btn_newMediaArticle_normal.png'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.brown,
                    ),
                    child: Divider(
                      height: 3,
                    ),
                  ),
                ),
                Container(
                  height: 150.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final EventData event = eventList[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return SecondScreen(
                                  namaSecond: namaEvent,
                                  namaLomba: event.nama,
                                  namaGuest: 'pilih guest',
                                  tglLahir: -1,
                                  bulanLahir: 0,
                                );
                              }));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Image.asset(event.imageAsset),
                        ),
                      );
                    },
                    itemCount: eventList.length,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
