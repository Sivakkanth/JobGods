import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobgods/models/user_model.dart';
import 'package:jobgods/repository/authentication_respository/authentication_respository.dart';
import '../repository/user_respository/user_respository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

// Respository
  final _authRepo = Get.put(AuthenticationRespository());
  final _userRepo = Get.put(UserRespository());

  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Error", "Login to continue");
    }
  }

  Future<List<UserModel>> getAllUser() async {
    return await _userRepo.allUser();
  }

  updateRecord(UserModel user) async {
    await _userRepo.updateUserRecord(user);
  }
}
