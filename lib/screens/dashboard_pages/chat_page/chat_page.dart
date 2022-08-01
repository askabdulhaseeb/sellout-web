import 'package:flutter/material.dart';

import '../../../widgets/custom_widgets/responsive_layout.dart';
import 'chat_webview.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);
  static const String routeName = 'chats';

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobile: ChatWebview(),
      tablet: ChatWebview(),
      desktop: ChatWebview(),
    );
  }
}
