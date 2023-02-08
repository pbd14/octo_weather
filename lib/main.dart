import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/app_route.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bloc/bloc.dart';
import 'package:weather/bloc/Weather/weather_bloc.dart';
import 'constants.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: whiteColor,
    systemNavigationBarDividerColor: whiteColor,
  ));

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => WeatherBloc()
              ..add(LoadCityWeather(
                  latlon: [41.311081, 69.240562], cityName: 'Tashkent')))
      ],
      child: MaterialApp.router(
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        debugShowCheckedModeBanner: false,
        title: 'Weather',
        theme: ThemeData(
            primaryColor: primaryColor,
            scaffoldBackgroundColor: backgroundColor),
        // home: MainScreen(),
      ),
    );
  }
}
