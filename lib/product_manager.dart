import 'package:flutter/material.dart';

import './products.dart';

class ProductManager extends StatefulWidget {
  final String startingProduct; // declares immutable string

  ProductManager(this.startingProduct); // binds the startingProduct(above) to this class

  @override // overrides the state of the this class with it's sister state class
  State<StatefulWidget> createState() {
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<String> _products = [];

  @override // overrides the default initState() method in the current class
  void initState() { // initialises the state in this class, it will run before the build class reducing the need for a re-render
    _products.add(widget.startingProduct); // Add to List widget
    super.initState(); // calls the State (this class extends State) as a constructor before overrides
  }


  @override // overrides the default Widget in this class
  Widget build(BuildContext context) {
    return Column(children: [Container(
      margin: EdgeInsets.all(10.0),
      child: RaisedButton(
        onPressed: () {
          setState(() {
            _products.add('Advanced Food Tester');
          });
        },
        child: Text('Add Product'),
      ),
    ),
    Products(_products)
    ],);
  }
}
