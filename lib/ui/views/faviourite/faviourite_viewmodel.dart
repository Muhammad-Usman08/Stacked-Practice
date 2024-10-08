import 'package:addtocart/app/app.locator.dart';
import 'package:addtocart/ui/service/items_service.dart';
import 'package:stacked/stacked.dart';

class FaviouriteViewmodel extends BaseViewModel{
  ItemsService itemsService = locator<ItemsService>();
  List get faviouriteItems => itemsService.faviouriteItem;
}