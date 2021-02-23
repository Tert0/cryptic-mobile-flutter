import 'dart:async';
import 'dart:convert';
import 'package:uuid/uuid.dart';
import 'dart:io';

var uuid = Uuid();

class Client {
  bool loggedIn = false;
  WebSocket websocket;
  Stream stream;


  Future<Client> init(String url) async {
    this.websocket = await WebSocket.connect(url);
    this.stream = this.websocket.asBroadcastStream();
    print('Connected');
    return this;
  }

  Future<dynamic> request(Map data) async {
    this.websocket.add(jsonEncode(data));
    return jsonDecode(await this.stream.first);
  }

  Future<dynamic> ms(String ms, List<String> endpoint, Map data) {
    this.request({
      "tag": uuid.v4(),
      "ms": ms,
      "endpoint": endpoint,
      "data": data,
    });
  }
}