import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Profile"),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() {
          if (profileController.isLoading.value) {
            return const CircularProgressIndicator();
          } else if (profileController.userProfile.value.id != null) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage:
                      NetworkImage(profileController.userProfile.value.avatar!),
                  radius: 50,
                ),
                const SizedBox(height: 20),
                Text("Name: ${profileController.userProfile.value.name}"),
                Text("Email: ${profileController.userProfile.value.email}"),
                Text("Role: ${profileController.userProfile.value.role}"),
              ],
            );
          } else {
            return const Text("No profile data available.");
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          profileController
              .fetchUserDetails(); // Fetch user details on button press
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
