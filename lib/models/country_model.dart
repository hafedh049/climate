import 'package:flutter/material.dart';

@immutable
class CountryModel {
  final String countyName;
  final String countryFlag;

  const CountryModel({required this.countyName, required this.countryFlag});
}
