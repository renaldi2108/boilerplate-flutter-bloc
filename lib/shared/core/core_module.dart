import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@module
abstract class CoreModule {
  @singleton
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();
}