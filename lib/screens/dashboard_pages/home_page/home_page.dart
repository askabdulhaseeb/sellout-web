import 'package:flutter/material.dart';

import '../../../widgets/custom_widgets/responsive_layout.dart';
import 'home_webview.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobile: HomeWebview(),
      tablet: HomeWebview(),
      desktop: HomeWebview(),
    );
  }
}
