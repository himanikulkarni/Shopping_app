import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping__app/providers/cart_provider/cart_provider.dart';
import 'package:shopping__app/providers/orders_provider/orders.dart';
import 'package:shopping__app/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const id = '/CartScreen';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total'),
                  const Spacer(),
                  Chip(label: Text("${cart.totalToPay.toString()} \$")),
                  TextButton(
                      onPressed: () {
                        Provider.of<Orders>(context, listen: false).addOrder(
                            cartItems: cart.items.values.toList(),
                            totalPrice: cart.totalToPay);
                        cart.clearCart();
                      },
                      child: const Text("Order Now"))
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (context, index) => CartItemTile(
                      id: cart.items.values.toList()[index].id,
                      title: cart.items.values.toList()[index].title,
                      price: cart.items.values.toList()[index].price,
                      qty: cart.items.values.toList()[index].qty,
                      productId: cart.items.keys.toList()[index],
                    )),
          ),
        ],
      ),
    );
  }
}
