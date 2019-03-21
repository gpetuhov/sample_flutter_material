import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/products_repository.dart';
import 'model/product.dart';

class HomePage extends StatelessWidget {
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
      // We use the count() constructor since the number of items to display
      // is countable and not infinite.
      body: GridView.count(
          // The crossAxisCount: specifies how many items across. We want 2 columns.
          // Cross axis in Flutter means the non-scrolling axis.
          // The scrolling direction is called the main axis.
          // (GridView has vertical scrolling by default)
          crossAxisCount: 2,
          padding: EdgeInsets.all(16.0),
          childAspectRatio: 8.0 / 9.0,
          children: _buildGridCards(context)),
    );
  }

  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);

    if (products == null || products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products.map((product) {
      // Cards are independent elements that display content
      // and actions on a single subject.
      // The Card widget alone doesn't have enough information
      // to lay itself out where we could see it,
      // so we encapsulate it in a GridView widget.
      return Card(
        clipBehavior: Clip.antiAlias,
        // TODO: Adjust card heights (103)
        child: Column(
          // Center items on the card
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // The AspectRatio widget decides what shape the image takes
            // no matter what kind of image is supplied.
            AspectRatio(
              aspectRatio: 18 / 11,
              child: Image.asset(
                product.assetName,
                package: product.assetPackage,
                // The images are drawn with a BoxFit of .scaleDown by default.
                // We change that to .fitWidth so they zoom in a little
                // and remove the extra whitespace.
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  // Align labels to the bottom and center
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // Here we customize style of the text,
                    // so that the text will become smaller, than in our app's custom theme.
                    Text(
                      product == null ? '' : product.name,
                      style: theme.textTheme.button,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      product == null ? '' : formatter.format(product.price),
                      style: theme.textTheme.caption,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}
