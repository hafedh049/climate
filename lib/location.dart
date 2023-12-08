import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:word_weather/models/country_model.dart';
import 'package:word_weather/utils/globals.dart';
import 'package:word_weather/views/home.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<List<CountryModel>> _loadCountries() async {
    return json.decode(await rootBundle.loadString("assets/countries.json")).entries.map((e) => CountryModel(countyName: e.value as String, countryFlag: "assets/country_flags/${e.key.toLowerCase()}.png")).toList().cast<CountryModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const Text("Update your location", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        InkWell(
          highlightColor: transparent,
          splashColor: transparent,
          hoverColor: transparent,
          onTap: () async {
            await showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  height: MediaQuery.sizeOf(context).height * .5,
                  child: Column(
                    children: <Widget>[
                      TextField(controller: _searchController),
                      const SizedBox(height: 20),
                      Expanded(
                        child: FutureBuilder<List<CountryModel>>(
                          future: _loadCountries(),
                          builder: (BuildContext context, AsyncSnapshot<List<CountryModel>> snapshot) {
                            if (snapshot.hasData) {
                              List<CountryModel> countries = snapshot.data!;
                              return ListView.builder(
                                itemCount: countries.length,
                                padding: EdgeInsets.zero,
                                itemBuilder: (BuildContext context, int index) => Container(
                                  padding: const EdgeInsets.symmetric(vertical: 8),
                                  child: InkWell(
                                    highlightColor: transparent,
                                    splashColor: transparent,
                                    hoverColor: transparent,
                                    onTap: () {
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const Home()));
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        Image.asset(countries[index].countryFlag, width: 10, height: 12),
                                        const SizedBox(width: 10),
                                        Text(countries[index].countyName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            } else if (snapshot.connectionState == ConnectionState.waiting) {
                              return const Center(child: CircularProgressIndicator(color: blue));
                            } else {
                              return Center(child: Text(snapshot.error.toString(), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)));
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: blue),
            padding: const EdgeInsets.all(8),
            child: const Text("Pick up from the list", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
        ),
        const SizedBox(height: 20),
        InkWell(
          highlightColor: transparent,
          splashColor: transparent,
          hoverColor: transparent,
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: blue),
            padding: const EdgeInsets.all(8),
            child: const Text("Use device location", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }
}
