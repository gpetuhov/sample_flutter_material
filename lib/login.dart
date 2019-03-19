import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SafeArea prevents Child from being hidden by display notch
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            // SizedBox is just a spacing
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/diamond.png'),
                SizedBox(height: 16.0),
                Text('SHRINE'),
              ],
            ),
            SizedBox(height: 120.0),
            // TODO: Wrap Username with AccentColorOverride (103)
            // TODO: Remove filled: true values (103)
            // TODO: Wrap Password with AccentColorOverride (103)
            // TODO: Add button bar (101)
            // [Name]
            TextField(
              decoration: InputDecoration(
                filled: true, // fills the background to help the user identify input field
                labelText: 'Username',
              ),
            ),
            // spacer
            SizedBox(height: 12.0),
            // [Password]
            TextField(
              decoration: InputDecoration(
                filled: true,
                labelText: 'Password',
              ),
              obscureText: true,  // replaces the input with bullets
            ),
          ],
        ),
      ),
    );
  }
}

// TODO: Add AccentColorOverride (103)
