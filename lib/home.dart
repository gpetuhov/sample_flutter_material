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
        // Leading field places widget at the leading position.
        // IconButton is a convenient way to display buttons with material icons
        leading: IconButton(
          icon: Icon(
            // Hamburger icon
            Icons.menu,
            // The information in this field better explains what this button does
            // to people who use screen readers.
            // It's a lot like Android's Content Labels.
            // For a Widget that doesn't have a semanticLabel: field,
            // you can wrap it in a Semantics widget.
            semanticLabel: 'menu',
          ),
          onPressed: () {
            print('Menu button');
          },
        ),
        // On Android title will be left-aligned, on iOS - centered
        title: Text('SHRINE'),
        // Actions are displayed at the trailing side of the title
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
            onPressed: () {
              print('Search button');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.tune,
              semanticLabel: 'filter',
            ),
            onPressed: () {
              print('Filter button');
            },
          ),
        ],
      ),
      // TODO: Add a grid view (102)
      body: Center(
        child: Text('You did it!'),
      ),
    );
  }
}
