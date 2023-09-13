// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:breaking_bad_bloc/data/web_services/quote_web_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:breaking_bad_bloc/business_logic/cubit/quote_cubit.dart';
import 'package:breaking_bad_bloc/data/repository/quote_repository.dart';
import 'package:breaking_bad_bloc/presentation/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final QuoteRepository quoteRepository =
      QuoteRepository(quoteWebServices: QuoteWebServices());

  MyApp({
    Key? key,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    QuoteCubit quoteCubit = QuoteCubit(quoteRepository);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => BlocProvider(
              create: (context) => quoteCubit,
              child: const HomeScreen(),
            )
      },
    );
  }
}
