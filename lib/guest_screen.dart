import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:first_app/model/guest_data.dart';
import 'package:first_app/second_screen.dart';
import 'package:first_app/Album.dart';
import 'package:http/http.dart' as http;

class GuestScreen extends StatefulWidget {
  @override
  _GuestScreenState createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
  Future<Album> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('http://www.mocky.io/v2/596dec7f0f000023032b8017'));
    final jsonresponse = json.decode(response.body);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(jsonresponse[3]);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

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
                    return SecondScreen(
                      namaLomba: '',
                      namaSecond: '',
                    );
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
                      FutureBuilder<Album>(
                        future: futureAlbum,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(snapshot.data!.name);
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          }

                          // By default, show a loading spinner.
                          return const CircularProgressIndicator();
                        },
                      ),
                    ],
                  ),
                ));
          }).toList(),
        ),
      ),
    );
  }
}
