import 'dart:async';
import 'dart:convert';
import 'package:uuid/uuid.dart';
import 'dart:io';

var uuid = Uuid();

class Client {
  bool loggedIn = false;
  WebSocket websocket;
  Stream stream;
  String url;

  Client(String url) {
    this.url = url;
  }

  Future<Client> init(String url) async {
    this.websocket = await WebSocket.connect(url);
    this.stream = this.websocket.asBroadcastStream();
    print('Connected');
    return this;
  }

  Future<dynamic> request(Map data) async {
    if (this.websocket == null) {
      await this.init(this.url);
    }
    print(data);
    this.websocket.add(jsonEncode(data));
    print('making request');
    print(jsonDecode(await this.stream.first));
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
    dynamic resp = await this.request(
        {"action": "login", "world": "de", "name": userName, "password": pwd});
    print('resp');
    if (resp.containsKey('token')) {
      print('Logged in');
      return {'login': true, 'token': resp['token']};
    } else {
      print('Wrong Credentials');
      return {'login': false};
    }
  }
}
