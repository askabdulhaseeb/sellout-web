import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/app_provider.dart';
import '../../providers/user_provider.dart';
import '../../utilities/app_images.dart';
import '../../widgets/custom_widgets/custom_network_image.dart';
import '../dashboard_pages/app_product_page/add_product.dart';
import '../dashboard_pages/bit_page/bit_page.dart';
import '../dashboard_pages/chat_page/chat_page.dart';
import '../dashboard_pages/home_page/home_page.dart';
import '../dashboard_pages/profile_page/profile_page.dart';

class DaskboardWebview extends StatelessWidget {
  const DaskboardWebview({Key? key}) : super(key: key);
  static const List<Widget> _pages = <Widget>[
    HomePage(),
    BitPage(),
    AddProductPage(),
    ChatPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 5,
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Sellout',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
                fontSize: 42,
              ),
            ),
            const _TabBarIcon(),
            Consumer<UserProvider>(
                builder: (BuildContext context, UserProvider userPro, _) {
              return Row(
                children: <Widget>[
                  CustomNetworkImage(
                    imageURL: AppImages.doneURL,
                    borderRadius: 12,
                    height: 40,
                    width: 40,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'no name',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_active,
                      size: 40,
                    ),
                  )
                ],
              );
            }),
          ],
        ),
      ),
      body: Consumer<AppProvider>(
        builder: (BuildContext context, AppProvider appPro, _) {
          return _pages[appPro.currentTap];
        },
      ),
    );
  }
}

class _TabBarIcon extends StatelessWidget {
  const _TabBarIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: ((BuildContext context, AppProvider appPro, _) {
        return SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _icon(
                icon: Icons.home_outlined,
                activeIcon: Icons.home,
                isActive: appPro.currentTap == 0,
                onTap: () => appPro.onTabTapped(0),
              ),
              _icon(
                icon: Icons.shopping_cart_outlined,
                activeIcon: Icons.shopping_cart,
                isActive: appPro.currentTap == 1,
                onTap: () => appPro.onTabTapped(1),
              ),
              _icon(
                icon: Icons.add_box_outlined,
                activeIcon: Icons.add_box_rounded,
                isActive: appPro.currentTap == 2,
                onTap: () => appPro.onTabTapped(2),
              ),
              _icon(
                icon: Icons.message_outlined,
                activeIcon: Icons.message,
                isActive: appPro.currentTap == 3,
                onTap: () => appPro.onTabTapped(3),
              ),
              _icon(
                icon: Icons.person_outline,
                activeIcon: Icons.person,
                isActive: appPro.currentTap == 4,
                onTap: () => appPro.onTabTapped(4),
              ),
            ],
          ),
        );
      }),
    );
  }

  _icon({
    required IconData icon,
    required VoidCallback onTap,
    required bool isActive,
    IconData? activeIcon,
  }) {
    return IconButton(
      splashRadius: 32,
      onPressed: onTap,
      icon: Center(child: Icon(isActive ? activeIcon ?? icon : icon, size: 40)),
    );
  }
}
