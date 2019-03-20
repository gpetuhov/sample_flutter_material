import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  // TODO: Make a collection of cards (102)
  // TODO: Add a variable for Category (104)
  @override
  Widget build(BuildContext context) {
    // TODO: Return an AsymmetricView (104)
    // TODO: Pass Category variable to AsymmetricView (104)
    // Scaffold provides convenient APIs for displaying
    // all sorts or common Material Components like drawers,
    // snack bars, bottom sheets and a Floating Action Button.
    return Scaffold(
      // This is the top app bar of the home screen
      appBar: AppBar(
        // On Android title will be left-aligned, on iOS - centered
        title: Text('SHRINE'),
      ),
      // TODO: Add a grid view (102)
      body: Center(
        child: Text('You did it!'),
      ),
    );
  }
}
