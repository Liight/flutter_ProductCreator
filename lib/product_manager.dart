import 'package:flutter/material.dart';

import './products.dart';
import './product_control.dart';

class ProductManager extends StatefulWidget {
  final String startingProduct; // declares immutable string

  ProductManager({this.startingProduct = 'Sweets Tester'}) {
    // binds the startingProduct(above) to this class
    print('[ProductManager Widget] Constructor');
  }

  @override // overrides the state of the this class with it's sister state class
  State<StatefulWidget> createState() {
    print('[ProductManager Widget] createState()');
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<String> _products = [];

  @override // overrides the default initState() method in the current class
  void initState() {
    // initialises the state in this class,
    // it will run before the build class reducing the need for a re-render
    print('[_ProductManagerState Widget] initState()');
    _products.add(widget.startingProduct); // Add to List widget
    super
        .initState(); // calls the State (this class extends State) as a constructor before overrides
  }

  @override
  void didUpdateWidget(ProductManager oldWidget) {
    print('[_ProductManagerState Widget] didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }

  void _addProduct(String product) {
    setState(() {
      _products.add(product);
    });
  }

  @override // overrides the default Widget in this class
  Widget build(BuildContext context) {
    print('[_ProductManagerState Widget] build()');
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          child: ProductControl(_addProduct),
        ),
        Products(_products)
      ],
    );
  }
}
