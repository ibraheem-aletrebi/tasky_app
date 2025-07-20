import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tasky/Feature/layaout/controller/app_controller.dart';

import 'package:tasky/core/widgets/custom_elevated_button.dart';
import 'package:tasky/core/widgets/custom_text_form_field.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppController>(
      create: (context) => AppController()..init(),
      builder: (context, child) {
        AppController appController = context.read<AppController>();
        return Scaffold(
          appBar: AppBar(title: Text('User Details')),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CustomTextFormField(
                            title: 'User Name',
                            hintTxt: 'ibraheem al-etrebi',
                            controller: appController.userNameController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "This field is required..!";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 28),
                          CustomTextFormField(
                            title: 'Motivation Quote',
                            hintTxt: 'One task at a time. One step closer.',
                            controller: appController.motivationQouteController,
                            maxLines: 6,
                          ),
                        ],
                      ),
                    ),
                  ),

                  CustomElevatedButton(
                    onPressed: () {
                      appController.updateUserData();
                      context.pop(true);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 8,
                      children: [Icon(Icons.add), Text('Save Changes')],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
