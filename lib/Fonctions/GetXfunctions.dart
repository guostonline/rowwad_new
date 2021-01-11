import 'package:get/get.dart';

class GetXFunctions extends GetxController {
  RxDouble btn1Visible = 1.0.obs;
  RxDouble btn2Visible = 1.0.obs;
  RxDouble btn3Visible = 1.0.obs;
  RxDouble btn4Visible = 1.0.obs;

  buttonsVisibility(int buttonNumber) {
    switch (buttonNumber) {
      case 1:
        btn1Visible.value = 1.0;
        btn2Visible.value = 0.0;
        btn3Visible.value = 0.0;
        btn4Visible.value = 0.0;
        break;
      case 2:
        btn1Visible.value = 0.0;
        btn2Visible.value = 1.0;
        btn3Visible.value = 0.0;
        btn4Visible.value = 0.0;
        break;
      case 3:
        btn1Visible.value = 0.0;
        btn2Visible.value = 0.0;
        btn3Visible.value = 1.0;
        btn4Visible.value = 0.0;
        break;
      case 4:
        btn1Visible.value = 0.0;
        btn2Visible.value = 0.0;
        btn3Visible.value = 0.0;
        btn4Visible.value = 1.0;
        break;
      default:
    }
  }

  RxDouble buttonsCheker(int button) {
    // RxDouble result;
    switch (button) {
      case 1:
        return btn1Visible;
        break;
      case 2:
        return btn2Visible;
        break;
      case 3:
        return btn3Visible;
        break;
      case 4:
        return btn4Visible;
        break;
      default:
        return null;
    }

    // return result;
  }
}
