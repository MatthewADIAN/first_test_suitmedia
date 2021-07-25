import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:first_app/second_screen.dart';
import 'package:first_app/Album.dart';
import 'package:http/http.dart' as http;

class GuestScreen extends StatefulWidget {
  final String namaPenggunaAwal;

  GuestScreen({required this.namaPenggunaAwal});

  @override
  _GuestScreenState createState() => _GuestScreenState(namaPengguna: namaPenggunaAwal);
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

Future<List<Album>> _refreshProducts(BuildContext context) async {
  return fetchAlbum(http.Client());
}

class _GuestScreenState extends State<GuestScreen> {

  final String namaPengguna;

  _GuestScreenState({required this.namaPengguna});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GUEST'),
      ),
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: FutureBuilder<List<Album>>(
          future: fetchAlbum(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return PhotosList(photos: snapshot.data!, namaPenggunaAkhir: namaPengguna,);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  const PhotosList({Key? key, required this.photos, required this.namaPenggunaAkhir}) : super(key: key);

  final List<Album> photos;
  final String namaPenggunaAkhir;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: GridView.builder(
          itemCount: photos.length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SecondScreen(
                    namaLomba: 'pilih event',
                    namaSecond: namaPenggunaAkhir,
                    namaGuest: photos[index].name,
                    tglLahir: int.parse(photos[index].birthdate.substring(8)),
                    bulanLahir: int.parse(photos[index].birthdate.substring(5,7))
                  );
                }));
              },
              child: Card(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Image.asset('images/avatar.png'),
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
          }),
    );
  }
}

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
