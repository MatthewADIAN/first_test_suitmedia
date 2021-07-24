import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_app/model/event_data.dart';
import 'package:first_app/second_screen.dart';

class EventScreen extends StatelessWidget {
  final String namaEvent;

  EventScreen({required this.namaEvent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('EVENT'),
        ),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: SafeArea(
            child: ListView.builder(
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
                        tglLahir: '',
                      );
                    }));
                  },
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Image.asset(event.imageAsset),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(event.nama),
                                Text(event.tanggal)
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                    ],
                  ),
                );
              },
              itemCount: eventList.length,
            ),
          ),
        ));
  }
}
