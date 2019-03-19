import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controllers are needed to control text input fields
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

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
            // [Name]
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                filled: true, // fills the background to help the user identify input field
                labelText: 'Username',
              ),
            ),
            // spacer
            SizedBox(height: 12.0),
            // [Password]
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Password',
              ),
              obscureText: true,  // replaces the input with bullets
            ),
            // ButtonBar arranges its children in a row
            ButtonBar(
              // TODO: Add a beveled rectangular border to CANCEL (103)
              children: <Widget>[
                // We should use FlatButton for less important actions
                FlatButton(
                  child: Text('CANCEL'),
                  // Buttons without onPressed fields become disabled
                  onPressed: () {
                    // Clear the text fields
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                ),
                // TODO: Add an elevation to NEXT (103)
                // TODO: Add a beveled rectangular border to NEXT (103)
                // We should use RaisedButton for the most important action
                RaisedButton(
                  child: Text('NEXT'),
                  onPressed: () {
                    // TODO: Show the next page (101)
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// TODO: Add AccentColorOverride (103)
