import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  // Absolute black magic. 
  List<String> products; // Set the product property
  Products(this.products); // Grabs the incoming 'products' argument and stores it in the products property

  @override
  Widget build(BuildContext context) {
    return Column(
      children: products
          .map((element) => Card(
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/food.jpg'),
                    Text(element)
                  ],
                ),
              ))
          .toList(),
    );
  }
}
