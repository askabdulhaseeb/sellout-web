import 'package:flutter/material.dart';

import '../../../widgets/custom_widgets/responsive_layout.dart';
import 'add_product_webview.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({Key? key}) : super(key: key);
  static const String routeName = 'add_product';

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobile: AddProductWebview(),
      tablet: AddProductWebview(),
      desktop: AddProductWebview(),
    );
  }
}
