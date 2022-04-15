import 'package:app_for_interview/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;
  //SIGN IN METHOD
  Future signOut() async {
    await _auth.signOut();
    Get.offAllNamed(Routes.LOGIN);
    print('signout');
  }
}
