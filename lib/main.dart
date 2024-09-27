import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'blood_bridge.dart';

// void main() {
//   runApp(const BloodBridge());
// }

void main() => runApp(
      DevicePreview(
        // enabled: !kReleaseMode,
        enabled: true,
        builder: (context) => const BloodBridge(),
      ),
    );
