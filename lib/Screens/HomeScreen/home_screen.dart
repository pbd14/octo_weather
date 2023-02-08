import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Widgets/loading_screen.dart';
import 'package:weather/Widgets/rounded_button.dart';
import 'package:weather/app_route.gr.dart' as app_route;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/bloc/Weather/weather_bloc.dart';
import 'package:weather/constants.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  String error;
  HomeScreen({Key? key, this.error = 'Something Went Wrong'}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String search = 'Search';
  int buttonCategoryNumber = 0;
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        shadowColor: backgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          margin: const EdgeInsets.fromLTRB(20, 40, 20, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello,",
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                textAlign: TextAlign.start,
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    color: lightDarkColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Alonzo Lee ",
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                textAlign: TextAlign.start,
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    color: darkDarkColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [],
        toolbarHeight: 90,
        backgroundColor: whiteColor,
        foregroundColor: darkColor,
        centerTitle: true,
      ),
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Center(
                    child: BlocBuilder<WeatherBloc, WeatherState>(
                      builder: (context, state) {
                        if (state is WeatherInitial) {
                          return Container(height: 100, child: LoadingScreen());
                        }
                        if (state is WeatherLoaded) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                "Weather",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                textAlign: TextAlign.start,
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                    color: darkDarkColor,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButtonFormField<String>(
                                    selectedItemBuilder: (context) {
                                      return [
                                        Text(
                                          state.cityName,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.montserrat(
                                            textStyle: const TextStyle(
                                              color: darkColor,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ];
                                    },

                                    style: TextStyle(color: darkColor),
                                    decoration: InputDecoration(
                                      errorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                        borderSide: const BorderSide(
                                            color: Colors.red, width: 1.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                        borderSide: const BorderSide(
                                            color: darkColor, width: 1.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                        borderSide: const BorderSide(
                                            color: darkColor, width: 1.0),
                                      ),
                                      hintStyle: TextStyle(
                                          color: darkColor.withOpacity(0.7)),
                                      hintText: 'Network',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                        borderSide: const BorderSide(
                                            color: darkColor, width: 1.0),
                                      ),
                                    ),
                                    isDense: true,
                                    menuMaxHeight: 200,
                                    borderRadius: BorderRadius.circular(40.0),
                                    dropdownColor: primaryColor,
                                    // focusColor: whiteColor,
                                    iconEnabledColor: darkColor,
                                    alignment: Alignment.centerLeft,
                                    onChanged: (cityName) async {
                                      context.read<WeatherBloc>().add(
                                          LoadCityWeather(
                                              latlon: cities[cityName]!,
                                              cityName: cityName!));
                                    },
                                    hint: Text(
                                      state.cityName,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.montserrat(
                                        textStyle: const TextStyle(
                                          color: darkColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    items: [
                                      for (String cityName in cities.keys)
                                        DropdownMenuItem<String>(
                                          value: cityName,
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Text(
                                              cityName,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.montserrat(
                                                textStyle: const TextStyle(
                                                  color: whiteColor,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                     
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                width: size.width * 0.8,
                                child: Card(
                                  color: primaryColor,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          state.cityName,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 100,
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.montserrat(
                                            textStyle: const TextStyle(
                                              color: whiteColor,
                                              fontSize: 40,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          '${(state.weatherData['main']['temp'] - 273.15).toStringAsFixed(0)} °C',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 100,
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.montserrat(
                                            textStyle: const TextStyle(
                                              color: whiteColor,
                                              fontSize: 40,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          state.weatherData['weather'][0]
                                              ['main'],
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 100,
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.montserrat(
                                            textStyle: const TextStyle(
                                              color: whiteColor,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          state.weatherData['weather'][0]
                                              ['description'],
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 100,
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.montserrat(
                                            textStyle: const TextStyle(
                                              color: whiteColor,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        } else {
                          return Container(height: 100, child: LoadingScreen());
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
