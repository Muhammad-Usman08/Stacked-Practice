import 'package:addtocart/app/app.locator.dart';
import 'package:addtocart/ui/service/items_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  ItemsService itemsService = locator<ItemsService>();
  List items = [
    {
      'itemName': 'Cap',
      'itemPrice': '300',
      'itemDescription': 'Boys white cap',
      'isFaviourite': false,
      'quantity':1,
    },
    {
      'itemName': 'Wallet',
      'itemPrice': '1000',
      'itemDescription': 'Mens beautiful wallet',
      'isFaviourite': false,
      'quantity':1,
    },
    {
      'itemName': 'Shoes',
      'itemPrice': '5000',
      'itemDescription': 'Addidas shoe for boys and girls',
      'isFaviourite': false,
      'quantity':1,
    }
  ];

  // add to cart
  addToCart(index) {
    var itemCopy = Map<String, dynamic>.from(items[index]);
    itemCopy['quantity'] = 1;
    itemsService.cartItems.add(itemCopy);
    print(itemsService.cartItems);
  }
  //add faviourite items
  addFav(index) async {
    if (items[index]['isFaviourite'] == true) {
      items[index]['isFaviourite'] = false;
      itemsService.faviouriteItem
          .removeWhere((item) => item['itemName'] == items[index]['itemName']);
    } else {
      items[index]['isFaviourite'] = true;
      itemsService.faviouriteItem.add(items[index]);
    }
    rebuildUi();
  }
}
