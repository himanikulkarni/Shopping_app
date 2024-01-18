import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping__app/providers/cart_provider/cart_provider.dart';
import 'package:shopping__app/providers/product.dart';
import 'package:shopping__app/screens/productDetailsScreen.dart';

class GridProductItem extends StatelessWidget {
  const GridProductItem({
    super.key,
    //required this.id, required this.title, required this.image
  });

  //final String id, title, image;

  @override
  Widget build(BuildContext context) {
    //final product = Provider.of<Product>(context);
    return Consumer<Product>(builder: (context, product, _) {
      final cart = Provider.of<Cart>(context, listen: false);
      return ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: GridTile(
          footer: GridTileBar(
            title: Text(
              product.title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 10),
            ),
            backgroundColor: Colors.black,
            leading: IconButton(
              icon: product.isFavorite
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_border),
              onPressed: () {
                product.toggleIsFav();
              },
            ),
            trailing: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                cart.addItem(
                    productId: product.id,
                    title: product.title,
                    price: product.price);
              },
            ),
          ),
          child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(ProductDetailsScreen.id, arguments: product.id);
              },
              child: Image.asset(product.image)),
        ),
      );
    });
  }
}
