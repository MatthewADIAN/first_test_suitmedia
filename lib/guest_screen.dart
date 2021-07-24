import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:first_app/model/guest_data.dart';
import 'package:first_app/second_screen.dart';
import 'package:first_app/Album.dart';
import 'package:http/http.dart' as http;

class GuestScreen extends StatefulWidget {
  @override
  _GuestScreenState createState() => _GuestScreenState();
}

Future<List<Album>> fetchAlbum(http.Client client) async {
  final response = await http
      .get(Uri.parse('http://www.mocky.io/v2/596dec7f0f000023032b8017'));

  if (response.statusCode == 200) {
    return compute(parsePhotos, response.body);
  } else {
    throw Exception('Failed to load album');
  }
}

List<Album> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Album>((json) => Album.fromJson(json)).toList();
}

class _GuestScreenState extends State<GuestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GUEST'),
      ),
      body: FutureBuilder<List<Album>>(
        future: fetchAlbum(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return PhotosList(photos: snapshot.data!);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  const PhotosList({Key? key, required this.photos}) : super(key: key);

  final List<Album> photos;
  

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: photos.length,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
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
                    child: Image.asset('images/lomba.jpg'),
                    flex: 2,
                  ),
                  Expanded(
                    child: Text(photos[index].name),
                    flex: 1,
                  ),
                  Expanded(
                    child: Text(photos[index].birthdate),
                    flex: 1,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
//Text(photos[index].name);

class FixWidget extends StatelessWidget {
  final BuildContext context2;
  final int index2;
  final List<Album> photos2;

  FixWidget(
      {required this.context2, required this.index2, required this.photos2});

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
    );
  }
}
