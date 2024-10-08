import 'package:addtocart/ui/views/cart/cart_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => CartViewmodel(),
        builder: (context, cartModel, childs) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Cart Screen',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Colors.blue[400],
            ),
            body: cartModel.itemsService.cartItems.isNotEmpty?Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: cartModel.itemsService.cartItems.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: ListTile(
                        tileColor: Colors.grey[300],
                        leading: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {
                                  cartModel.increaseQuantity(index);
                                },
                                icon:const Icon(
                                  Icons.add,
                                  size: 13,
                                )),
                            Text(
                                '${cartModel.itemsService.cartItems[index]['quantity'].toString()}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12)),
                            IconButton(
                                onPressed: () {
                                  cartModel.decreaseQuantity(index);
                                },
                                icon:const Icon(
                                  Icons.remove,
                                  size: 13,
                                )),
                          ],
                        ),
                        title: Text(
                            '${cartModel.itemsService.cartItems[index]['itemName']}'),
                        subtitle: Text(
                            '${cartModel.itemsService.cartItems[index]['itemDescription']}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                                '${cartModel.itemsService.cartItems[index]['itemPrice']}'),
                            IconButton(
                                onPressed: () {
                                  cartModel.deleteItemFromCart(index);
                                },
                                icon: const Icon(Icons.delete)),
                          ],
                        ),
                      ),
                    );
                  }),
            ):Center(child: Text('No Items in your cart')),
          );
        });
  }
}
