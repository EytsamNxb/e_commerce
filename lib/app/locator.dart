
import 'package:get_it/get_it.dart';
import 'package:ecommerce/shared_preferences/shared_preferences_service.dart';

final serviceLocator = GetIt.instance;

Future<void> setupServiceLocator() async {
  final sf = await SharedPreferencesService.getInstance();
  serviceLocator.registerSingleton(sf);
}