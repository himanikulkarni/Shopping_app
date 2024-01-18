import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping__app/providers/product.dart';
import 'package:shopping__app/providers/ProductProviders.dart';
import 'package:shopping__app/screens/cart_screen.dart';
import 'package:shopping__app/screens/order_screen.dart';
import 'package:shopping__app/screens/profile.dart';
import 'package:shopping__app/screens/search_screen.dart';
import 'package:shopping__app/widgets/GridProductItem.dart';

class Shopping_screen extends StatefulWidget {
  static const id = '/Profile_Screen';
  const Shopping_screen({super.key, required this.data});
  final String data;

  @override
  State<Shopping_screen> createState() => _Shopping_screenState();
}

class _Shopping_screenState extends State<Shopping_screen> {
  bool showFav = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.pink,
          onPressed: () {
            Navigator.of(context).pushNamed(OrdersScreen.id);
          },
          label: const Text('My Orders'),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Phone shop"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(SearchScreen.id);
                },
                icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.id);
                },
                icon: const Icon(Icons.shopping_cart_checkout)),
            PopupMenuButton(
                onSelected: (int selectedVal) {
                  if (selectedVal == 0) {
                    setState(() {
                      showFav = true;
                    });
                  }
                  if (selectedVal == 1) {
                    setState(() {
                      showFav = false;
                    });
                  }
                },
                icon: const Icon(Icons.more_vert),
                itemBuilder: (_) {
                  return [
                    const PopupMenuItem(
                        value: 0, child: Text('filter by favorite')),
                    const PopupMenuItem(
                        value: 1, child: Text('remove filters')),
                  ];
                }),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              Container(
                color: Colors.pinkAccent,
                width: double.infinity,
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/tshirt.jpeg')),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.data,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                  leading: const Icon(Icons.edit),
                  title: const Text(
                    'Edit profile',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    // Handle navigation to the home screen or perform an action
                    Navigator.of(context).pushNamed(ProfileScreen.id); // C
                  }),
              const ListTile(
                leading: Icon(Icons.woman),
                title: Text(
                  'Women',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              const ListTile(
                leading: Icon(Icons.man),
                title: Text(
                  'Men',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              const ListTile(
                leading: Icon(Icons.child_care),
                title: Text(
                  'Kids',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: ProductsGrid(isFav: showFav),
      ),
    );
  }
}

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    super.key,
    required this.isFav,
  });

  final bool isFav;

  @override
  Widget build(BuildContext context) {
    final productDate = Provider.of<Products>(context);
    final availProducts =
        isFav ? productDate.favoriteProducts : productDate.availProducts;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: availProducts.length,
      itemBuilder: (context, index) {
        return ChangeNotifierProvider<Product>.value(
            value: availProducts[index],
            //create: (BuildContext context) => availProducts[index],
            child: const GridProductItem(
                // id: availProducts[index].id,
                // title: availProducts[index].title,
                // image: availProducts[index].image
                // ),
                ));
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1,
        crossAxisSpacing: 15,
        mainAxisSpacing: 30,
      ),
    );
  }
}
