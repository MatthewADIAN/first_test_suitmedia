import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_app/model/event_data.dart';
import 'package:first_app/second_screen.dart';
import 'package:first_app/event_screen_fragment.dart';

class EventScreen extends StatelessWidget {
  final String namaEvent;

  EventScreen({required this.namaEvent});

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
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return EventScreenFragment(
                                  namaEvent: this.namaEvent,
                                );
                              }));
                        },
                        child: Image.asset('images/btn_newMediaArticle_normal.png'),
                      ),
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
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
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
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        event.nama,
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 5,),
                                      Text(
                                        event.tanggal,
                                        style: TextStyle(
                                          color: Colors.amber,
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              event.tags,
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          )),
                                      SizedBox(
                                        height: 30.0,
                                      ),
                                      Text(event.caption),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Image.asset(event.imageAsset),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: eventList.length,
                ),
              ],
            ),
          ),
        ));
  }
}
