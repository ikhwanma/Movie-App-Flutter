import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/bloc/landing_page/landing_page_bloc.dart';
import 'package:movie_app/presentation/provider/popular_movies_provider.dart';
import 'package:movie_app/presentation/provider/trending_movies_provider.dart';
import 'package:movie_app/presentation/screen/popular_movies_screen.dart';

import '../../injection_container.dart';
import '../bloc/popular_movies/popular_movies_bloc.dart';
import '../bloc/popular_movies/popular_movies_event.dart';

List<BottomNavigationBarItem> bottomNavItems = const <BottomNavigationBarItem>[
  BottomNavigationBarItem(icon: Icon(Icons.thumb_up), label: "Popular Movie"),
  BottomNavigationBarItem(
      icon: Icon(Icons.trending_up), label: "Trending Movie"),
];

const List<Widget> bottomNavScreen = <Widget>[
  PopularMoviesProvider(),
  TrendingMoviesProvider()
];

class LandingPageScreen extends StatelessWidget {
  const LandingPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LandingPageBloc, LandingPageState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Center(child: bottomNavScreen.elementAt(state.tabIndex)),
          bottomNavigationBar: BottomNavigationBar(
            items: bottomNavItems,
            currentIndex: state.tabIndex,
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.white,
            backgroundColor: Colors.black,
            onTap: (index) {
              BlocProvider.of<LandingPageBloc>(context)
                  .add(TabChange(tabIndex: index));
            },
          ),
        );
      },
    );
  }
}
