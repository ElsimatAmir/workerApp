import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';
import 'package:worker/app/constants/constants.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:worker/ui/routers/routers.dart';
import 'package:worker/ui/routers/routers.gr.dart';
import 'package:worker/ui/widgets/widgets.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AppRouter _router = Get.find();
  late FormGroup _form;

  @override
  void initState() {
    super.initState();
    _form = fb.group({
      'loginEmailOrPhoneNumber': FormControl<String>(validators: [
        Validators.required,
        Validators.maxLength(26),
        Validators.minLength(2),
      ]),
      'password': FormControl<String>(validators: [
        Validators.required,
        Validators.maxLength(20),
        Validators.minLength(6),
      ]),
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.defaultPadding),
              child: Column(
                children: [
                  const Center(
                    child: CircleAvatar(
                      foregroundImage: AssetImage('assets/worker_logo.png'),
                      radius: 120,
                    ),
                  ),
                  ReactiveForm(
                    formGroup: _form,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const MyReactiveTextField(
                          formControlName: 'loginEmailOrPhoneNumber',
                          hint: 'Email or a Phone Number',
                          prefixIcon: Icon(Icons.person),
                        ),
                        AppConstants.defaultPadding.h,
                        const MyReactiveTextField(
                          formControlName: 'password',
                          hint: 'Enter the password',
                          isPassword: true,
                          prefixIcon: Icon(Icons.lock),
                        ),
                        AppConstants.defaultPadding.h,
                        MyReactiveButton(
                          title: 'Login',
                          onPressed: _logIn,
                        ),
                      ],
                    ),
                  ),
                  AppConstants.defaultPadding.h,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forget Password',
                        ),
                      ),
                    ],
                  ),
                  AppConstants.defaultPadding.h,
                  const DividerWithText(middleText: 'Or sign in'),
                  AppConstants.defaultPadding.h,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {/*  Create a login with FaceBook*/},
                        child: const CircleAvatar(
                          backgroundColor: AppColorsConstants.white,
                          foregroundImage:
                              AssetImage('assets/facebookLogo.jpg'),
                          radius: 26,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {/*  Create a login with Vk*/},
                        child: const CircleAvatar(
                          backgroundColor: AppColorsConstants.white,
                          foregroundImage: AssetImage('assets/vkLogo.png'),
                          radius: 26,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {/*  Create a login with google*/},
                        child: const CircleAvatar(
                          backgroundColor: AppColorsConstants.white,
                          foregroundImage: AssetImage('assets/googleLogo.png'),
                          radius: 22,
                        ),
                      ),
                    ],
                  ),
                  AppConstants.defaultPadding.h,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'Create new account',
                        style: AppConstants.textStyleSmallText,
                      ),
                      TextButton(
                        onPressed: () => _router.push(const SignInRoute()),
                        child: const Text(
                          'Registration',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

//TODO: add a loging logic by clicking the login Button
  void _logIn() {}
}
