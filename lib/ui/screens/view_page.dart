import 'package:counter_app_getx/ui/controller/home_controller.dart';
import 'package:flutter/material.dart';

class ViewPage extends StatelessWidget {
  ViewPage({Key? key}) : super(key: key);
  DataController dataController = DataController();
  @override
  Widget build(BuildContext context) {
    final data = dataController.box.read("cart") as Map;
    print(data.entries.runtimeType);
    print(data.keys.runtimeType);
    print(data.values.runtimeType);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child:ListView(
            children: data.entries.map((element){
              return Center(
                child: Card(
                  color: Colors.blueGrey,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(height: 10),
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(
                              element.value['picture']),
                        ),
                        Text(

                              element.value['title'].toUpperCase(),
                          style: const TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        Text(element.value['firstName'],
                            style: const TextStyle(color: Colors.black, fontSize: 18)),
                        Text(element.value['lastName']??"",
                            style: const TextStyle(color: Colors.black, fontSize: 18)),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
        ),
      ),
    );
  }
}
