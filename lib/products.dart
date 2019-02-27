import 'package:flutter/material.dart';

class Products extends StatelessWidget { 
  final List<String> products; // Set an immutable strongly typed variable
  Products(this.products){
    print('[Products Widget] Constructor');
  } // Grabs the incoming 'products' argument and stores it as a property of the class Products

  @override
  Widget build(BuildContext context) {
    print('[Products Widget] build()');
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
