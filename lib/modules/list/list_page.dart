import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'list_logic.dart';


class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var logic = Get.put(ListLogic());
    return const Scaffold(
      body: Center(
        child: Text('LoginPage'),
      ),
    );
  }
}
