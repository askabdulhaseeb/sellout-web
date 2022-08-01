import 'package:flutter/material.dart';

import '../../widgets/custom_widgets/responsive_layout.dart';
import 'dashboard_webview.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      desktop: DaskboardWebview(),
      mobile: DaskboardWebview(),
    );
  }
}
