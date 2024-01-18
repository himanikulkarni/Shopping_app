import 'package:flutter/material.dart';
import 'package:shopping__app/providers/product.dart';

class Products with ChangeNotifier {
  final List<Product> _availProducts = [
    Product(
      id: '1001',
      title: 'Sweatshirt',
      description: "Printed Sweatshirt",
      image: 'assets/sweatshirt.jpeg',
      price: 1499,
    ),
    Product(
      id: '1002',
      title: 'Trousers',
      description: "High waisted cargo trousers",
      image: 'assets/cargos.png',
      price: 2199,
    ),
    Product(
      id: '1003',
      title: 'Jacket',
      description: "Color blocked jacket",
      image: 'assets/jacket.jpg',
      price: 1599,
    ),
    Product(
      id: '1004',
      title: 'Shoes',
      description: "Running shoes",
      image: 'assets/shoes.jpeg',
      price: 1999,
    ),
    Product(
      id: '1005',
      title: 'Dress',
      description: "Black bodycon dress",
      image: 'assets/dress.jpg',
      price: 1199,
    ),
    Product(
      id: '1006',
      title: 'Tshirt',
      description: "Striped T-shirt",
      image: 'assets/tshirt.jpeg',
      price: 599,
    ),
    Product(
      id: '1007',
      title: 'Shorts',
      description: "Denim Shorts",
      image: 'assets/shorts.jpeg',
      price: 1399,
    ),
    Product(
      id: '1008',
      title: 'Belt',
      description: "Leather belt",
      image: 'assets/belt.jpeg',
      price: 499,
    ),
  ];
  List<Product> get favoriteProducts {
    return _availProducts.where((product) => product.isFavorite).toList();
  }

  List<Product> get availProducts => _availProducts;

  Product findById(String id) {
    return _availProducts.firstWhere((product) => product.id == id);
  }
}
