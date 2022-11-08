import 'dart:math';

import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchContriller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    Map info = ModalRoute.of(context)?.settings.arguments as Map;
    String air = ((info['air_speed_value']).toString());

    String temp = ((info['temp_value']).toString());
    if (temp != "NA") {
      temp = ((info['temp_value']).toString()).substring(0, 4);
      air = ((info['air_speed_value']).toString()).substring(0, 3);
    }
    String icon = (info['icon_value']);
    String getCity = (info['city_value']);
    String hum = (info['hum_value']);

    String des = (info['des_value']);

    var cityName = [
      "Mumbai",
      "Delhi",
      "channai",
      "Ahmedabad",
      "indore",
      "London"
    ];
    final random = Random();
    var city = cityName[random.nextInt(cityName.length)];

    final PreferredSizeWidget appBar = PreferredSize(
      preferredSize: const Size.fromHeight(0),
      child: NewGradientAppBar(
        gradient: const LinearGradient(
          colors: [
            Colors.blue,
            Colors.lightBlueAccent,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blue,
                Colors.lightBlueAccent,
              ]),
        ),
        child: Column(
          children: [
            Container(
              //Search Container
              padding: const EdgeInsets.symmetric(
                  horizontal: 8),
              margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if ((searchContriller.text).replaceAll(" ", "") == "") {
                      } else {
                        Navigator.pushReplacementNamed(
                          context,
                          "/loading",
                          arguments: {
                            "searchText": searchContriller.text,
                          },
                        );
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                        mediaQuery.size.height * 0.03,
                        mediaQuery.size.height * 0.00,
                        mediaQuery.size.height * 0.07,
                        0,
                      ),
                      child: const Icon(
                        Icons.search,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: searchContriller,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Search $city"),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              //First Container
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(14)),
                    margin: EdgeInsets.symmetric(
                        horizontal: mediaQuery.size.height * 0.025),
                    padding: EdgeInsets.all(mediaQuery.size.height * 0.03),
                    child: Row(
                      children: [
                        Image.network(
                            "http://openweathermap.org/img/wn/$icon@2x.png"),
                        SizedBox(
                          width: mediaQuery.size.height * 0.02,
                        ),
                        Column(
                          children: [
                            Text(
                              des,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              getCity,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    // Second Container
                    height: mediaQuery.size.height * 0.30,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(14)),
                    margin: EdgeInsets.symmetric(
                        horizontal: mediaQuery.size.height * 0.025,
                        vertical: mediaQuery.size.height * 0.010),
                    padding: EdgeInsets.all(mediaQuery.size.height * 0.026),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(WeatherIcons.thermometer),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              temp,
                              style: const TextStyle(fontSize: 90),
                            ),
                            const Text(
                              "C",
                              style: TextStyle(fontSize: 30),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(14)),
                    margin: EdgeInsets.fromLTRB(
                      mediaQuery.size.height * 0.025,
                      0,
                      mediaQuery.size.height * 0.010,
                      0,
                    ),
                    padding: EdgeInsets.all(mediaQuery.size.height * 0.01),
                    height: mediaQuery.size.height * 0.25,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Icon(WeatherIcons.day_windy),
                          ],
                        ),
                        SizedBox(
                          height: mediaQuery.size.height * 0.02,
                        ),
                        Text(
                          air,
                          style: const TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        const Text("km/hr"),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(14)),
                    margin: EdgeInsets.fromLTRB(
                      mediaQuery.size.height * 0.010,
                      0,
                      mediaQuery.size.height * 0.025,
                      0,
                    ),
                    padding: EdgeInsets.all(mediaQuery.size.height * 0.026),
                    height: mediaQuery.size.height * 0.25,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Icon(WeatherIcons.humidity),
                          ],
                        ),
                        SizedBox(
                          height: mediaQuery.size.height * 0.02,
                        ),
                        Text(
                          hum,
                          style: const TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        const Text("Percent"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(mediaQuery.size.height * 0.03),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text("Made By Karan"),
                  Text("Data Provided By Openweathermap.org"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
