import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tasky/Feature/tasks/screen/completed_tasks_screen.dart';
import 'package:tasky/Feature/home/screen/home_screen.dart';
import 'package:tasky/Feature/profile/screen/profile_screen.dart';
import 'package:tasky/Feature/tasks/screen/todo_tasks_screen.dart';
import 'package:tasky/core/services/preference_manegar/preference_manegar.dart';
import 'package:tasky/core/services/preference_manegar/storage_key.dart';

class AppController with ChangeNotifier {
  int currentIndex = 0;

  List<Widget> bodyContent = [
    HomeScreen(),
    TodoTasksScreen(),
    CompletedTasksScreen(),
    ProfileScreen(),
  ];
  Widget body = HomeScreen();

  late String userName;
  late String motivationQoute;

  File? image;
  final _imagePicker = ImagePicker();
  Future<void> pickImageFromGallery() async {
    final pickFile = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickFile != null) {
      image = File(pickFile.path);
      userImagePath = image!.path;
      _restoreUserImage();
    }
    notifyListeners();
  }

  Future<void> pickImageFromCamera() async {
    final pickFile = await _imagePicker.pickImage(source: ImageSource.camera);
    if (pickFile != null) {
      image = File(pickFile.path);
      userImagePath = image!.path;
      _restoreUserImage();
    }
    notifyListeners();
  }

  void logout() {
    PreferenceManegar().clear();
  }

  _restoreUserImage() async {
    await PreferenceManegar().setString(StorageKey.userImage, userImagePath!);
  }

  String? userImagePath;
  TextEditingController userNameController = TextEditingController();
  TextEditingController motivationQouteController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> init() async {
    await _getUserData();
    userNameController.text = userName;
    motivationQouteController.text = motivationQoute;
    notifyListeners();
  }

  Future<void> _getUserData() async {
    userName = PreferenceManegar().getString(StorageKey.userName)!;
    motivationQoute = PreferenceManegar().getString(
      StorageKey.motivationQoute,
    )!;
    userImagePath = PreferenceManegar().getString(StorageKey.userImage);
    if (userImagePath != null) {
      image = File(userImagePath!);
    }
  }

  Future<void> updateUserData() async {
    await PreferenceManegar().setString(
      StorageKey.userName,
      userNameController.text,
    );
    await PreferenceManegar().setString(
      StorageKey.motivationQoute,
      motivationQouteController.text,
    );
    notifyListeners();
  }

  void change(int indx) {
    currentIndex = indx;
    body = bodyContent[currentIndex];
    notifyListeners();
  }
}
