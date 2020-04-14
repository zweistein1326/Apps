import 'package:flutter/material.dart';
import 'package:mark_it/screens/home.dart';
import '../screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.green,
            height: MediaQuery.of(context).size.height * 0.6,
            width: double.infinity,
            child: Image.network(
              'https://i.ytimg.com/vi/MPV2METPeJU/maxresdefault.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: FlatButton(
                    child: Text('Login with Google'),
                    onPressed: () {},
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: FlatButton(
                    child: Text('Login with email'),
                    onPressed: () {},
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: FlatButton(
                    child: Text('Login with mobile'),
                    onPressed: () {},
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: FlatButton(
                    child: Text('Skip'),
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(Home.routeName);
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
