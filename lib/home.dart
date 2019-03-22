import 'package:flutter/material.dart';

import 'model/products_repository.dart';
import 'model/product.dart';
import 'supplemental/asymmetric_view.dart';

// This whole file changed again in Codelab MDC-104
// Old file from Codelab MDC-103 can be found in home_old2.dart
// and old file before Codelab MDC-103 can be found in hove_old.dart
// (these files are not used in the app, but remain for reference).

class HomePage extends StatelessWidget {
  final Category category;

  const HomePage({this.category: Category.all});

  @override
  Widget build(BuildContext context) {
    return AsymmetricView(products: ProductsRepository.loadProducts(category));
  }
}
