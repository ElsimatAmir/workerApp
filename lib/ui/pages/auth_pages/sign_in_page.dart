import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';
import 'package:worker/app/constants/constants.dart';
import 'package:worker/ui/widgets/widgets.dart';

import '../../routers/routers.dart';

@RoutePage()
class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final AppRouter _router = Get.find();
  late FormGroup _form;

  @override
  void initState() {
    super.initState();
    _form = fb.group({
      'name': FormControl<String>(validators: [
        Validators.required,
        Validators.maxLength(16),
        Validators.minLength(2),
      ]),
      'age': FormControl<int>(validators: [
        Validators.number,
      ]),
      'email': FormControl<String>(validators: [
        Validators.email,
      ]),
      'phoneNumber': FormControl<int>(validators: [
        Validators.number,
      ]),
      'password': FormControl<String>(validators: [
        Validators.required,
        Validators.maxLength(20),
        Validators.minLength(6),
      ]),
      'policyAgree': FormControl<bool>(validators: [
        Validators.equals(true),
      ]),
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Worker',
            style: AppConstants.textStyleH1,
          ),
          titleSpacing: 10,
          centerTitle: true,
          leading: IconButton(
            onPressed: () => _router.pop(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColorsConstants.orange,
            ),
          ),
          backgroundColor: AppColorsConstants.white,
          shadowColor: AppColorsConstants.orange,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                (AppConstants.defaultPadding * 2).h,
                const Text(
                  'Hiring a worker\'s never been easier, registration now and start ordering a workers.',
                  style: AppConstants.textStyleDefaultText,
                ),
                AppConstants.defaultPadding.h,
                ReactiveForm(
                  formGroup: _form,
                  child: Column(
                    children: [
                      const MyReactiveTextField(
                        formControlName: 'name',
                        hint: 'Enter your name',
                        prefixIcon: Icon(Icons.person),
                      ),
                      AppConstants.defaultPadding.h,
                      MyReactiveTextField(
                        formControlName: 'age',
                        hint: 'Enter your age',
                        keyboardType: TextInputType.number,
                        textInputFormatter: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        prefixIcon: const Icon(Icons.date_range_sharp),
                      ),
                      AppConstants.defaultPadding.h,
                      const MyReactiveTextField(
                        formControlName: 'email',
                        hint: 'Enter your email',
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: Icon(Icons.email),
                      ),
                      AppConstants.defaultPadding.h,
                      MyReactiveTextField(
                        formControlName: 'phoneNumber',
                        keyboardType: TextInputType.number,
                        textInputFormatter: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        hint: 'Enter your phone number',
                        prefixIcon: const Icon(Icons.phone_android_outlined),
                      ),
                      AppConstants.defaultPadding.h,
                      const MyReactiveTextField(
                        formControlName: 'password',
                        hint: 'Enter your password',
                        isPassword: true,
                        prefixIcon: Icon(Icons.lock),
                      ),
                      AppConstants.defaultPadding.h,
                      Row(
                        children: [
                          ReactiveCheckbox(
                            formControlName: 'policyAgree',
                          ),
                          const Text(
                            'I\'am Accepting the Privacy Policy',
                            style: AppConstants.textStyleSmallText,
                          ),
                        ],
                      ),
                      AppConstants.defaultPadding.h,
                      MyReactiveButton(title: 'Sign in', onPressed: _signIn)
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => _router.pop(),
                      child: const Text(
                        'already have an account',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signIn() {}
}
