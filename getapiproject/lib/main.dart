import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(
    const MaterialApp(
      home: MyApp(),
    ),
  );
}

//convert api ke dalam class
class Album {
  //deklarasi
  int userId;
  int id;
  String title;

  //iniliasisasi
  Album({this.id, this.userId, this.title});

  //convert variabel from json
  //$var =array('key1'=>''value);
  //List list= ['isinya'];
  //Map var = ['key':'value']

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

//function get api nya
Future<Album> getAlbum() async {
  //isi function disini
  final response = await http.get(
    'https://jsonplaceholder.typicode.com/albums/1',
  );
  //condition

  if (response.statusCode == 200) {
    return Album.fromJson(
      //json decode untuk memanggil / menggunakan
      jsonDecode(
        response.body,
      ),
    );
  } else {
    throw('Tidak ada data');
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   Future<Album> futureAlbum;

 //fungsi ambil fungsi yang ingin gunakan 
 @override
 void initState() {
   futureAlbum = getAlbum();
   
   super.initState();
   
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar API'),
      ),
      body: Center(
        child: FutureBuilder<Album>(
          future: futureAlbum,
          // ignore: missing_return
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.title);
            } else if (snapshot.hasError) {
              return Text(
                '${snapshot.error}',
              );
            }
            //default loading spinner
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
 
}
