import 'package:demo/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'List.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  int len = list.length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
        actions: [
          IconButton(
              onPressed: () {
                signOut(context);
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
            itemBuilder: (ctx, index) => ListTile(
                  leading: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(list[index]['imgurl']),
                  ),
                  title: Text(list[index]['name']),
                  subtitle: Text(list[index]['sub']),
                ),
            separatorBuilder: (ctx, index) => Divider(),
            itemCount: len),
      ),
    );
  }

  void signOut(BuildContext ctx) async {
    SharedPreferences dataBase = await SharedPreferences.getInstance();
    dataBase.clear();
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (contex) => LoginPage()), (route) => false);
  }
}
