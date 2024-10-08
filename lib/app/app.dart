import 'package:addtocart/ui/service/items_service.dart';
import 'package:addtocart/ui/views/home/home_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ItemsService),
    // @stacked-service
  ],
)
class App {}
