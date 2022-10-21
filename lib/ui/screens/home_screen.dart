import 'package:counter_app_getx/ui/controller/home_controller.dart';
import 'package:counter_app_getx/ui/screens/view_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final DataController dataController = Get.put(DataController());
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rest API Using GetX',
        ),
        centerTitle: true,
      ),
      body: Obx(() => dataController.isDataLoading.value
          ? const Center(child: CircularProgressIndicator())
          : GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 4,
              mainAxisSpacing: 8,
              children: selectCard(),
            )),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => ViewPage()));
          },
          isExtended: true,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          label: Text(
            'Submit',
            style: TextStyle(color: Colors.blueGrey),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  selectCard() {
    return List.generate(dataController.user_model.value.data!.length,
        (index) {
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
                      dataController.user_model.value.data![index].picture!),
                ),
                Text(
                  dataController.user_model.value.data![index].title!
                      .toUpperCase(),
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                ),
                Text(dataController.user_model.value.data![index].firstName!,
                    style: const TextStyle(color: Colors.black, fontSize: 18)),
                Text(dataController.user_model.value.data![index].lastName!,
                    style: const TextStyle(color: Colors.black, fontSize: 18)),
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () {
                      dataController.onPressed(index);
                    },
                    child: Text('Add'))
              ],
            ),
          ),
        ),
      );
    });
  }
}
