import 'package:addtocart/app/app.locator.dart';
import 'package:addtocart/ui/service/items_service.dart';
import 'package:stacked/stacked.dart';

class CartViewmodel extends BaseViewModel {
  ItemsService itemsService = locator<ItemsService>();
  

  increaseQuantity(index){
     itemsService.cartItems[index]['quantity']++;
     rebuildUi();
  }

  decreaseQuantity(index){
   if(itemsService.cartItems[index]['quantity']!=0){
     itemsService.cartItems[index]['quantity']--;
   }
   else if(itemsService.cartItems[index]['quantity']==0){
     itemsService.cartItems.removeAt(index);
   }
   rebuildUi();
  }
  
  deleteItemFromCart(index) {
    itemsService.cartItems.removeAt(index);
    rebuildUi();
  }
}
