import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tasky/core/routing/app_routes.dart';
import 'package:tasky/core/services/preference_manegar/preference_manegar.dart';
import 'package:tasky/core/services/preference_manegar/storage_key.dart';
import 'package:tasky/core/styles/app_assets.dart';
import 'package:tasky/core/widgets/custom_elevated_button.dart';
import 'package:tasky/core/widgets/custom_text_form_field.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppAssets.logo, width: 42),
            Text('Tasky'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 5,
                children: [
                  Text(
                    'Welcome To Tasky',
                    style: TextTheme.of(
                      context,
                    ).displayLarge!.copyWith(fontSize: 24),
                  ),
                  SvgPicture.asset(AppAssets.wavingHandIcon, width: 28),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Your productivity journey starts here.',
                style: TextTheme.of(context).titleMedium,
              ),
              SizedBox(height: 24),
              SvgPicture.asset(AppAssets.weclomeImage),
              SizedBox(height: 28),
              CustomTextFormField(
                controller: userNameController,
                title: 'User Name',
                hintTxt: 'Enter UserName...',
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Username is required.";
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              CustomElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    PreferenceManegar().setString(
                      StorageKey.userName,
                      userNameController.text,
                    );
                    PreferenceManegar().setString(
                      StorageKey.motivationQoute,
                      'One task at a time.One step closer.',
                    );
                    showSuccessSnackBar(context);
                    context.pushNamed(AppRoutes.kMainScreen);
                  } else {
                    showFailedSnackBar(context);
                  }
                },
                child: Text('Let’s Get Started'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showFailedSnackBar(BuildContext context) {
    return showTopSnackBar(
      Overlay.of(context),
      const CustomSnackBar.error(
        message: 'Username is required. Please enter a valid username.',
      ),
    );
  }

  void showSuccessSnackBar(BuildContext context) {
    final String? userName = PreferenceManegar().getString(StorageKey.userName);
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(message: 'Welcome, $userName'),
    );
  }
}
