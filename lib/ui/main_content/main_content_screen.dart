import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_recommendation/ui/main_content/main_content_bloc.dart';
import 'package:movies_recommendation/ui/main_content/main_content_state.dart';
import 'package:movies_recommendation/utils/constants.dart';

class MainContentScreen extends StatefulWidget {
  const MainContentScreen({super.key});

  @override
  State<MainContentScreen> createState() => _MainContentScreenState();
}

class _MainContentScreenState extends State<MainContentScreen> {
  final MainContentBloc _mainContentBloc = GetIt.I<MainContentBloc>();
  final int numMilliSeconds = 3000;

  @override
  void initState() {
    _mainContentBloc.startPeriodicFunction(numMilliSeconds);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: _body(),
    ));
  }

  Widget _body() {
    return BlocBuilder<MainContentBloc, MainContentState>(
      bloc: _mainContentBloc,
      builder: (context, state) => AnimatedContainer(
          duration: Duration(milliseconds: numMilliSeconds),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: _mainContentBloc.state.colorGradient,
            ),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: InkWell(
                      onTap: () {
                        context.go(AppConstants.astronomyPicturesScreen);
                      },
                      child: const Text(
                        "Pictures of Nasa",
                        style: TextStyle(
                          letterSpacing: 2,
                          fontFamily: 'Roboto',
                          fontSize: 30,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    )),
                InkWell(
                    onTap: () {
                      context.go(AppConstants.moviesEscreen);
                    },
                    child: const Text(
                      "Movies information",
                      style: TextStyle(
                        letterSpacing: 2,
                        fontFamily: 'Roboto',
                        fontSize: 30,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ))
              ])),
    );
  }
}
