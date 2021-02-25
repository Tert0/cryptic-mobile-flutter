import 'package:get_it/get_it.dart';
import 'package:cryptic_mobile/websocket.dart';


GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<Client>(() => Client('wss://ws.cryptic-game.net'));
}