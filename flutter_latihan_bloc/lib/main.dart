import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ui/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Bloc',
      home: BlocProvider(
        builder:(context)=>ArticleBloc(repository: ArticleRepoImpl());
        child: HomePage(),
      ),
    );
  }
}
