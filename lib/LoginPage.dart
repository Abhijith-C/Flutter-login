import 'package:demo/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  void initState() {
    isLoggedIn(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('LoginPage'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                  controller: _userController,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(), labelText: 'User name'),
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(), labelText: 'Password'),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      passwordCheck(context);
                    },
                    child: Text('Login'))
              ],
            ),
          ),
        ));
  }

  void passwordCheck(BuildContext ctx) async {
    SharedPreferences dataBase = await SharedPreferences.getInstance();
    if (_userController.text == 'abhi' && _passwordController.text == 'jith') {
      dataBase.setBool(SAVE_KEY, true);
      Navigator.of(ctx)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  void isLoggedIn(ctx) async {
    SharedPreferences dataBase = await SharedPreferences.getInstance();
    if (dataBase.getBool(SAVE_KEY) == true) {
      Navigator.of(ctx)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    }
  }
}
