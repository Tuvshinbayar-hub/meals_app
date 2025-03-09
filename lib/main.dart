import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/screens/favorites/bloc/favorite_star_bloc.dart';
import 'package:meals_app/screens/bottom_tab_bar.dart';
import 'package:meals_app/screens/filters/bloc/filter_item_bloc.dart';

final kColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark, seedColor: Color.fromARGB(156, 210, 152, 0));

final theme = ThemeData(
  colorScheme: kColorScheme,
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FavoriteStarBloc(),
        ),
        BlocProvider(
          create: (context) => FilterItemBloc(),
        )
      ],
      child: MaterialApp(
        theme: theme,
        home: BottomTabBar(),
      ),
    );
  }
}
