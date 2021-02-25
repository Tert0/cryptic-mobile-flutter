import 'package:get_it/get_it.dart';
import 'package:cryptic_mobile/websocket.dart';


GetIt locator = GetIt.instance;

void setup_locator() {
  locator.registerLazySingleton<Client>(() => Client('wss://ws.cryptic-game.net'));
}