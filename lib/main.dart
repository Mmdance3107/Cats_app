import 'package:bloc_cats_app/api/services.dart';
import 'package:bloc_cats_app/screens/cat_breeds_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => CatBreedsBloc(catBreedsRepo: CatBreedsServices()),
        child: const CatBreedsScreen(),
      ),
    );
  }
}
