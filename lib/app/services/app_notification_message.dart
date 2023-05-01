import 'package:fluttertoast/fluttertoast.dart';
import 'package:worker/app/constants/constants.dart';

abstract class IAppNotificationMessage {
  void success(
    String message,
  );
  void error(
    String message,
  );
}

class AppNotificationMessage implements IAppNotificationMessage {
  @override
  void success(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 3,
        backgroundColor: AppColorsConstants.green,
        textColor: AppColorsConstants.white,
        fontSize: 16.0);
  }

  @override
  void error(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 3,
        backgroundColor: AppColorsConstants.red,
        textColor: AppColorsConstants.white,
        fontSize: 16.0);
  }
}
