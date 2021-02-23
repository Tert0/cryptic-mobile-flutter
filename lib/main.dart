import 'package:flutter/material.dart';
import 'package:cryptic_mobile/home.dart';
import 'package:cryptic_mobile/websocket.dart';
//import 'package:cryptic_mobile/login_check.dart';

void main() => runApp(MaterialApp(home: LoginScreen()));
//{
//  runApp(LoginScreen());
//}

// class Cryptic extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login to Cryptic'),
//         backgroundColor: Colors.transparent,
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Container(
//             decoration: BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage('assets/hintergrund.jpeg'),
//                     fit: BoxFit.cover)),
//             child: Center(
//                 child: Container(
//               color: Colors.transparent,
//               child: Text(
//                 'Hi',
//                 style: TextStyle(color: Colors.red, fontSize: 20.0),
//               ),
//             ))),
//       ),
//       backgroundColor: Colors.transparent,
//     );

//     // return Container(
//     //     decoration: BoxDecoration(
//     //         image: DecorationImage(
//     //             image: AssetImage('assets/hintergrund.jpeg'),
//     //             fit: BoxFit.cover)),
//     //     child: Center(
//     //         child: Container(
//     //       color: Colors.transparent,
//     //       child: Text('Hi'),
//     //     )));
//   }
// }

class LoginScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<Client> client() async {
    return await Client().init('wss://ws.cryptic-game.net');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login to Cryptic'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Center(
          child: Container(
              // decoration: BoxDecoration(
              //     image: DecorationImage(
              //         image: AssetImage('assets/hintergrund.jpeg'),
              //         fit: BoxFit.cover)),
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: ListView(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          autocorrect: false,
                          autofocus: true,
                          cursorColor: Colors.green,
                          controller: nameController,
                          decoration: InputDecoration(
                            fillColor: Colors.green[100],
                            filled: true,
                            border: OutlineInputBorder(),
                            labelText: 'User Name',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextField(
                          autocorrect: false,
                          cursorColor: Colors.green,
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(
                            fillColor: Colors.green[100],
                            filled: true,
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                          ),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          //forgot password screen
                        },
                        textColor: Colors.blue,
                        child: Text('Forgot Password'),
                      ),
                      Container(
                          height: 50,
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: RaisedButton(
                              textColor: Colors.white,
                              color: Colors.blue,
                              child: Text('Login'),
                              onPressed: () async {
                                Client client = await Client()
                                    .init('wss://ws.cryptic-game.net');
                                Map check = await client.login(
                                    nameController.text,
                                    passwordController.text);

                                if (check['login'] == true) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()),
                                  );
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text(
                                              'Deine eingegeben Daten sind Falsch'),
                                          actions: <Widget>[
                                            FlatButton(
                                              child: Text('Ok'),
                                              onPressed: () {
                                                passwordController.clear();
                                                nameController.clear();
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      });
                                }
                              })),
                      Container(
                          child: Row(
                        children: <Widget>[
                          Text('Does not have account?'),
                          FlatButton(
                            textColor: Colors.blue,
                            child: Text(
                              'Sign in',
                              style: TextStyle(fontSize: 20),
                            ),
                            onPressed: () {
                              //signup screen
                            },
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ))
                    ],
                  )))),
      backgroundColor: Colors.lightGreenAccent[100],
    );
  }
}
