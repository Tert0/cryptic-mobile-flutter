import 'package:flutter/material.dart';
import 'package:cryptic_mobile/websocket.dart';

void main() => runApp(MaterialApp(home: HomeScreen()));

class HomeScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<HomeScreen> {
  Future<int> onlinePlayer() async {
    Client cl = await Client().init('wss://ws.cryptic-game.net');
    int players = (await cl.request({"action": "status"}))['online'];
    return players;
  }

  @override
  Widget build(context) {
    return FutureBuilder<int>(
        future: onlinePlayer(),
        builder: (context, AsyncSnapshot<int> snapshot) {
          if (snapshot.hasData) {
            return Container(
              color: Colors.grey[300],
              child:Center(child: Text(snapshot.data.toString())));
          } else {
            return Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
