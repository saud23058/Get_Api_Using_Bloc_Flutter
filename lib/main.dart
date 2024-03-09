import 'package:api_using_bloc/bloc/bloc.dart';
import 'package:api_using_bloc/ui/poster_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 void main(){
   runApp(const MyApp());
 }
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (_)=>PostBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PosterScreen(),
      ),
    );
  }
}
