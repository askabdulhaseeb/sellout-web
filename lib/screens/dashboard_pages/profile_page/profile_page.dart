import 'package:flutter/material.dart';

import '../../../widgets/custom_widgets/responsive_layout.dart';
import 'profile_webview.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static const String routeName = 'profile';

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobile: ProfileWebview(),
      tablet: ProfileWebview(),
      desktop: ProfileWebview(),
    );
  }
}
