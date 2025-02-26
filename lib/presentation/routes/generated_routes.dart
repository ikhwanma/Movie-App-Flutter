import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/bloc/landing_page/landing_page_bloc.dart';
import 'package:movie_app/presentation/screen/landing_page_screen.dart';

class RouteGenerator{
  final LandingPageBloc landingPageBloc = LandingPageBloc();
  Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch(settings.name){
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<LandingPageBloc>.value(
            value: landingPageBloc,
            child: const LandingPageScreen(),
          )
        );
      default:
        return _errorRoute();
    }
  }
  
  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Error"),
        ),
        body: const Center(
          child: Text("Error"),
        ),
      );
    });
  }
}