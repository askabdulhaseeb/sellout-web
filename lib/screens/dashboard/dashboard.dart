import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/prod_provider.dart';
import '../../providers/user_provider.dart';
import '../../widgets/custom_widgets/responsive_layout.dart';
import 'dashboard_webview.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);
  static const String routeName = '/';
  @override
  Widget build(BuildContext context) {
    Provider.of<UserProvider>(context).init();
    Provider.of<ProdProvider>(context).init();
    // Provider.of<AuctionProvider>(context).init();
    return const ResponsiveLayout(
      desktop: DaskboardWebview(),
      mobile: DaskboardWebview(),
    );
  }
}
