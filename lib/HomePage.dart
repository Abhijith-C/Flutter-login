import 'package:demo/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'List.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
      body: ListView.separated(
          itemBuilder: (ctx, index) => ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://www.pinkvilla.com/imageresize/thalapathy_vijay_case_filed.jpg?width=752&format=webp&t=pvorg'),
                ),
                title: Text('PERSON $index'),
                subtitle: Text('person $index'),
              ),
          separatorBuilder: (ctx, index) => Divider(),
          itemCount: 30),
    );
  }

  void signOut(BuildContext ctx) async {
    SharedPreferences dataBase = await SharedPreferences.getInstance();
    dataBase.clear();
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (contex) => LoginPage()), (route) => false);
  }
}
