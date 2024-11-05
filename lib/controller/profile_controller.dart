import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http_header/controller/api_services.dart';
import '../model/user_model.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;
  var userProfile = UserModel().obs;

  void fetchUserDetails() async {
    isLoading(true); // Set loading state to true
    try {
      var result = await ApiServices().getUserDetails();
      if (result != null) {
        userProfile.value = result; // Assign the fetched user profile
        print(userProfile.value.name.toString());
      } else {
        // Handle the case where result is null
        Get.snackbar("Error", "Failed to fetch user details");
      }
    } catch (e) {
      // Handle any exceptions that occur during the API call
      Get.snackbar("Error", "An error occurred: $e");
    } finally {
      // This block is executed regardless of whether an exception occurred or not
      isLoading(false); // Set loading state back to false
    }
  }
}
