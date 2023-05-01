//Services export and Init file

import 'package:get/get.dart';
import 'package:worker/app/services/app_notification_message.dart';
import './../../ui/routers/routers.dart';
export './app_notification_message.dart';

Future initServices() async {
  Get.put<IAppNotificationMessage>(AppNotificationMessage());
  Get.put(AppRouter());
}
