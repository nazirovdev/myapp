import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/user_controller.dart';

class ListUser extends StatelessWidget {
  final UserController userController = Get.put(UserController());
  ListUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          'Daftar User',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Obx(
        () {
          if (userController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: userController.userList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        userController.userList[index].avatar,
                      ),
                    ),
                    title: Text(
                      userController.userList[index].firstName,
                    ),
                    subtitle: Text(
                      userController.userList[index].email,
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
