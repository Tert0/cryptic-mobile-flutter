import 'package:cryptic_mobile/websocket.dart';

Future<Map> makeLogin(String userName, String pwd) async {
  Client client = await Client().init('wss://ws.cryptic-game.net');
  Map response = await client
      .request({"action": "login", "name": userName, "password": pwd});
  if (response.containsKey('token')) {
    print(response);
    return {'login': true, 'token': response['token']};
  } else {
    print('Wrong Credentials');
    return {'login': false};
  }
}
