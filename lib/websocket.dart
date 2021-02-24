import 'dart:async';
import 'dart:convert';
import 'package:uuid/uuid.dart';
import 'dart:io';

var uuid = Uuid();

class Client {
  bool loggedIn = false;
  WebSocket socket;
  Stream stream;

  Future<Client> init(String url) async {
    this.socket = await WebSocket.connect(url);
    this.stream = this.socket.asBroadcastStream();
    print('Connected');
    return this;
  }

  Future<dynamic> request(Map data) async {
    this.socket.add(jsonEncode(data));
    return jsonDecode(await this.stream.first);
  }

  Future<dynamic> ms(String ms, List<String> endpoint, Map data) {
    return this.request({
      "tag": uuid.v4(),
      "ms": ms,
      "endpoint": endpoint,
      "data": data,
    });
  }

  Future<Map> login(String userName, String pwd) async {
    dynamic resp = await this.request({"action": "login", "name": userName, "password": pwd});
    if (resp.containsKey('token')) {
      return {'login': true, 'token': resp['token']};
    } else {
      print('Wrong Credentials');
      return {'login': false};
    }
  }
}
