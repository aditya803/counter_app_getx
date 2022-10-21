import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';

class NextScreen extends StatelessWidget {
  final int index;
  NextScreen({Key? key, required this.index}) : super(key: key);

  final TextEditingController _nameFieldController = TextEditingController();

  DataController dataController= Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(dataController.user_model.value.data![index].firstName!),
              TextField(
                onChanged: (value) {
                  dataController.user_model.value.data![index].firstName = value;
                },
                controller: _nameFieldController,
                decoration: const InputDecoration(
                    focusColor: Colors.red,
                    filled: true,
                    hintText: "Enter your name"),
              ),
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text('save'))
            ],
          ),
        )
    ));
  }
}
