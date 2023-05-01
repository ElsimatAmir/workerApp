import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';
import 'package:worker/app/constants/constants.dart';

import '../../routers/routers_export.dart';
import '../../widgets/widgets.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  //TODO: add to init services file
  final AppRouter _router = Get.find();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Image(
                  image: AssetImage('assets/worker_logo.png'),
                ),
              ),
              AppConstants.defaultPadding.h,
              if (_isLoading)
                AppConstants.spinner
              else
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.defaultPadding * 2),
                  child: MyButton(
                    onPressed: _buttonClicked,
                    title: 'Continue',
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _buttonClicked() {
    _router.replaceAll([const LoginRoute()]);
  }
}
