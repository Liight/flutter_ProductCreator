import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';
import '../models/user.dart';

mixin ConnectedProductsModel on Model {
  List<Product> _products = [];
  int _selProductIndex;
  User _authenticatedUser;

  void addProduct(
      String title, String description, String image, double price) {
    final Product newProduct = Product(
        title: title,
        description: description,
        image: image,
        price: price,
        userEmail: _authenticatedUser.email,
        userId: _authenticatedUser.id);
    _products.add(newProduct);
    _selProductIndex = null;
    notifyListeners();
  }
}

mixin ProductsModel on ConnectedProductsModel {
  bool _showFavourites = false;

  List<Product> get allProducts {
    return List.from(_products);
  }

  List<Product> get displayedProducts {
    if (_showFavourites) {
      return _products.where((Product product) => product.isFavourite).toList();
    }
    return List.from(_products);
  }

  bool get displayFavouritesOnly {
    return _showFavourites;
  }

  int get selectedProductIndex {
    return _selProductIndex;
  }

  Product get selectedProduct {
    if (selectedProductIndex == null) {
      return null;
    }
    return _products[selectedProductIndex];
  }

  void updateProduct(
      String title, String description, String image, double price) {
    final Product updatedProduct = Product(
        title: title,
        description: description,
        image: image,
        price: price,
        userEmail: selectedProduct.userEmail,
        userId: selectedProduct.userId);
    _products[selectedProductIndex] = updatedProduct;
    // _selProductIndex = null;
    notifyListeners();
  }

  void deleteProduct() {
    _products.removeAt(selectedProductIndex);
    // _selProductIndex = null;
    notifyListeners();
  }

  void toggleProductFavouriteStatus() {
    final bool isCurrentlyFavourite = selectedProduct.isFavourite;
    final bool newFavouriteStatus = !isCurrentlyFavourite;
    final Product updatedProduct = Product(
        title: selectedProduct.title,
        description: selectedProduct.description,
        price: selectedProduct.price,
        image: selectedProduct.image,
        isFavourite: newFavouriteStatus,
        userEmail: selectedProduct.userEmail,
        userId: selectedProduct.userId);
    _products[selectedProductIndex] = updatedProduct;
    notifyListeners();
    _selProductIndex = null;
  }

  void selectProduct(int index) {
    _selProductIndex = index;
    if(index != null){
      notifyListeners();
    }
    notifyListeners();
  }

  void toggleDisplayMode() {
    _showFavourites = !_showFavourites;
    notifyListeners();
  }

  // ProductsModel({});
}

mixin UserModel on ConnectedProductsModel {
  void login(String email, String password) {
    _authenticatedUser = User(id: 'sdjkgbfs', email: email, password: password);
  }
}
