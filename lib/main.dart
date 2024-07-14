import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:myapp/pages/home_page.dart";
import "package:myapp/pages/list_user.dart";

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomePage(),
        ),
        GetPage(
          name: '/list-user',
          page: () => ListUser(),
        ),
      ],
    ),
  );
}
