import 'package:flutter/material.dart';

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
                            onPressed: () {
                              print(nameController.text);
                              print(passwordController.text);
                            },
                          )),
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
