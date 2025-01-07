import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:boilerplate/shared/core/di/di.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDepedencies() async {
  getIt.init();
  getIt.allowReassignment = true;
}