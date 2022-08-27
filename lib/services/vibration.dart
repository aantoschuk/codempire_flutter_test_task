import 'dart:developer';

import 'package:vibration/vibration.dart';

void vibrate() async {
  Vibration.cancel();
  if (await Vibration.hasVibrator() == true) {
    if (await Vibration.hasAmplitudeControl() == true &&
        await Vibration.hasCustomVibrationsSupport() == true) {
      log('accepted');
      Vibration.vibrate(amplitude: 5, duration: 100);
    } else {
      Vibration.vibrate(duration: 100);
    }
  }
}
