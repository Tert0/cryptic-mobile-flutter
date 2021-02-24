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
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          child: ListView(
            children: [
              Container(
                child: Center(
                  child: new Container(
                      width: 200,
                      height: 200,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.cover,
                              image: new NetworkImage(
                                  "https://raw.githubusercontent.com/cryptic-game/graphics/master/app_icon/cryptic_mobile/1024x1024.png")))),
                ),
                color: Color(0xff121212),
              ),
              ListTile(
                  tileColor: Colors.grey,
                  title: Text('Logout'),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  }),
              FutureBuilder<int>(
                  future: onlinePlayer(),
                  builder: (context, AsyncSnapshot<int> snapshot) {
                    if (snapshot.hasData) {
                      return ListTile(
                        tileColor: Colors.grey,
                        title: Text('Spieler online'),
                        onTap: () {
                          return AlertDialog(
                            title: Center(
                                child: Text(
                                    'Es sind momentan $snapshot.data.toString() online')),
                            backgroundColor: Colors.grey[300],
                            actions: <Widget>[
                              FlatButton(
                                child: Text('Ok'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: Container(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                  })
            ],
          ),
          color: Color(0xff121212),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.lime,
      ),
    );
  }
}
