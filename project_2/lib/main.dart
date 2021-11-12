import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //deklarasikan variabel
  double? fontSize = 20.0;
  int angka = 0;

  //function
  changeNumber() {
    angka++;
  }

  //buat function baru
  klikSaya(){
    setState(() {
      changeNumber();
    });
  } 
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hitung Angka :' + angka.toString(),
              style: TextStyle(
                fontSize: fontSize,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              onPressed: () {
                //panggil function
                // setState(() {
                //   changeNumber();
                // });

              },
              child: const Text('Klik Saya'),
            ),
          ],
        ),
      ),
    );
  }
}
