import 'package:flutter/material.dart';

import '../../../widgets/custom_widgets/responsive_layout.dart';
import 'bit_webview.dart';

class BitPage extends StatelessWidget {
  const BitPage({Key? key}) : super(key: key);
  static const String routeName = 'bits';

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobile: BitWebview(),
      tablet: BitWebview(),
      desktop: BitWebview(),
    );
  }
}
