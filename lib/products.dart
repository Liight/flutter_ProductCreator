import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<String> products; // Set an immutable strongly typed variable
  Products(this.products) {
    print('[Products Widget] Constructor');
  } // Grabs the incoming 'products' argument and stores it as a property of the class Products

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset('assets/food.jpg'),
          Text(products[index])
        ],
      ),
    );
  }

  Widget _buildProductList() {
    Widget productCard;
    if (products.length > 0) {
      productCard = ListView.builder(
        // list view must return a list (allows scroll)
        itemBuilder:
            _buildProductItem, // what does building an item mean, how is an item built
        itemCount: products.length,
      );
    } else {
      productCard = Center(child: Text('No products found, please add some'));
    }
    return productCard;
  }

  @override
  Widget build(BuildContext context) {
    print('[Products Widget] build()');
    return _buildProductList();
  }
}
