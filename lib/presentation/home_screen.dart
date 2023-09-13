import 'package:breaking_bad_bloc/business_logic/cubit/quote_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<QuoteCubit>(context).getAllQuotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("B-BAD Quotes"),
          centerTitle: true,
        ),
        body: BlocBuilder<QuoteCubit, QuoteState>(
          builder: (context, state) {
            if (state is QuoteLoadedState) {
              return SizedBox(
                  child: ListView.builder(
                itemCount: state.quotes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(state.quotes[index].quote),
                  );
                },
              ));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
