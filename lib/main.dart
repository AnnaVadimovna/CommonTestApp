import 'package:flutter/material.dart';
import 'package:common_test/app/di/di.dart';
import 'package:common_test/app/location_app.dart';

void main() {
  configureDependencies();
  runApp(LocationApp());
}
