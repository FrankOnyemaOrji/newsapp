import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/core/constants/palette.dart';
import 'package:newsapp/core/service_locator.dart';

import 'feature/shownews/presentation/cubit/news_cubit.dart';
import 'feature/shownews/presentation/pages/homepage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return NewsCubit();
        }),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NewsApp',
        theme: ThemeData(
          colorScheme: const ColorScheme.light().copyWith(
            secondary: Palette.deepBlue,
          ),
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
