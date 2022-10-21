import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../model/user_model.dart';

class DataController extends GetxController {
  Rx<User_Model> user_model = User_Model().obs;
  var isDataLoading = false.obs;
  RxMap<String, dynamic> list = <String, dynamic>{}.obs;
  final box = GetStorage();

  @override
  Future<void> onInit() async {
    super.onInit();
    getApi();
  }

  @override
  Future<void> onPressed(int index) async {
    list[user_model.value.data![index].id.toString()] = user_model.value.data![index].toJson();
    box.write("cart", list);
    // list[user_model.value.data![index].id.toString()] =
    //     user_model.value.data![index].toJson();
    //
    // box.write(user_model.value.data![index].id!,
    //     list[user_model.value.data![index].toJson()]);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

  getApi() async {
    try {
      isDataLoading(true);
      http.Response response = await http.get(
          Uri.tryParse('http://dummyapi.io/data/v1/user')!,
          headers: {'app-id': '6218809df11d1d412af5bac4'});
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        user_model.value = User_Model.fromJson(result);
      } else {
        ///error
      }
    } catch (e) {
      log('error');
      print('error');
    } finally {
      isDataLoading(false);
    }
  }
}
