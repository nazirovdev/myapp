import 'dart:convert';

import 'package:get/get.dart';
import 'package:myapp/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  var isLoading = true.obs;
  var userList = <UserModel>[].obs;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    isLoading.value = true;

    try {
      var response = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));

      if (response.statusCode == 200) {
        var data = json.decode(response.body)['data'] as List;

        userList.value = data.map((user) => UserModel.fromJson(user)).toList();
      }
    } finally {
      isLoading.value = false;
    }
  }
}
