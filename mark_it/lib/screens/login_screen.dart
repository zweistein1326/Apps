import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../screens/home_screen.dart';
import 'ProfileScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googlSignIn = new GoogleSignIn();

  Future<FirebaseUser> _signIn(BuildContext context) async {
    Scaffold.of(context).showSnackBar(new SnackBar(
      content: new Text('Sign in'),
    ));

    final GoogleSignInAccount googleUser = await _googlSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    FirebaseUser userDetails =
        (await _firebaseAuth.signInWithCredential(credential)).user;
    ProviderDetails providerInfo = new ProviderDetails(userDetails.providerId);

    List<ProviderDetails> providerData = new List<ProviderDetails>();
    providerData.add(providerInfo);

    UserDetails details = new UserDetails(
      userDetails.providerId,
      userDetails.displayName,
      userDetails.photoUrl,
      userDetails.email,
      providerData,
    );
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) => new ProfileScreen(detailsUser: details),
      ),
    );
    return userDetails;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
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
                            child: Row(
                              children: <Widget>[
                                Icon(FontAwesomeIcons.google),
                                SizedBox(width: 10.0),
                                Text('Login with Google'),
                              ],
                            ),
                            onPressed: () => _signIn(context)
                                .then((FirebaseUser user) => print(user))
                                .catchError((e) => print(e))),
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
                                .pushReplacementNamed(HomeScreen.routeName);
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class UserDetails {
  final String providerDetails;
  final String userName;
  final String photoUrl;
  final String userEmail;
  final List<ProviderDetails> providerData;

  UserDetails(this.providerDetails, this.userName, this.photoUrl,
      this.userEmail, this.providerData);
}

class ProviderDetails {
  ProviderDetails(this.providerDetails);
  final String providerDetails;
}
