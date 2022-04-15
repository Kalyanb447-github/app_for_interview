import 'package:app_for_interview/app/modules/home/views/components/NavDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../constants.dart';
import '../controllers/home_controller.dart';
import 'detection/home.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    bool devMode = FlavorConfig.instance.variables[kDevMode] ?? false;
    Future<bool> onWillPop() {
      // controller.saveDataToLocalForFutureUse();
      return Future.value(true);
    }

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Welcome'),
        ),
        drawer: NavDrawer(),

        body: Center(
          child: FloatingActionButton.extended(
            onPressed: () {
              // controller.changeDiceFace();

              Get.to(HomePage(cameras));
            },
            label: Text('Scan'),
          ),
        ),
        // body: GetX<HomeController>(
        //   init: HomeController(),
        //   builder: (_) {
        //     return Center(
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //         children: [],
        //       ),
        //     );
        //   },
        // ),
        // floatingActionButton: FloatingActionButton.extended(
        //     onPressed: () {
        //       // controller.changeDiceFace();
        //     },
        //     label: Text('Role The Dice')),
      ),
    );
  }
}
