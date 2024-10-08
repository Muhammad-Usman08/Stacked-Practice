import 'package:addtocart/ui/views/faviourite/faviourite_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class FaviouriteView extends StatelessWidget {
  const FaviouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => FaviouriteViewmodel(),
        builder: (context, favModel, childs) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Faviourite Screen',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: favModel.faviouriteItems.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        itemCount: favModel.faviouriteItems.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin:const EdgeInsets.only(bottom: 10),
                            child: ListTile(
                              tileColor: Colors.grey[300],
                              title: Text(
                                  '${favModel.faviouriteItems[index]['itemName']}'),
                              subtitle: Text(
                                  '${favModel.faviouriteItems[index]['itemDescription']}'),
                            ),
                          );
                        }),
                  )
                : const Center(
                    child: Text('No Faviourites'),
                  ),
          );
        });
  }
}
