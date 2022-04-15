import 'package:app_for_interview/app/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:camera/camera.dart';

import 'app/routes/app_pages.dart';

List<CameraDescription> cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  WidgetsFlutterBinding.ensureInitialized();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error: $e.code\nError Message: $e.message');
  }
  // change if you want to change the mode to dev to production
  FlavorConfig(
    variables: {
      kDevMode: true,
    },
  );
  // local storage initilization
  // await GetStorage.init();
  // firebase initilization
  await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
