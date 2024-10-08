import 'package:addtocart/ui/views/cart/cart_view.dart';
import 'package:addtocart/ui/views/faviourite/faviourite_view.dart';
import 'package:addtocart/ui/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, homeModel, childs) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Add to Cart',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartView()));
                  },
                  icon: const Icon(Icons.card_travel)),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FaviouriteView()));
                  },
                  icon: const Icon(Icons.favorite)),
            ],
            backgroundColor: Colors.blue[400],
          ),
          body: ListView.builder(
              itemCount: homeModel.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${homeModel.items[index]['itemName']}'),
                  subtitle:
                      Text('${homeModel.items[index]['itemDescription']}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            homeModel.addToCart(index);
                          },
                          icon: const Icon(Icons.shopping_bag)),
                      IconButton(
                        onPressed: () {
                          homeModel.addFav(index);
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: homeModel.items[index]['isFaviourite']
                              ? Colors.red
                              : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                );
              }),
        );
      },
    );
  }
}
