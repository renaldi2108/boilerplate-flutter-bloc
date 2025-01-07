import 'package:alice/alice.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class AppAlice {
  late Alice alice;
  final GlobalKey<NavigatorState> _navigatorKey;

  AppAlice(this._navigatorKey) {
    alice = Alice(
        showNotification: kDebugMode,
        showInspectorOnShake: kDebugMode,
        showShareButton: kDebugMode,
        navigatorKey: _navigatorKey
    );
  }
}