import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../database/auth_methods.dart';
import '../../../models/app_user.dart';
import '../../../providers/prod_provider.dart';
import '../../../providers/user_provider.dart';
import '../../../widgets/custom_widgets/custom_network_image.dart';
import '../../../widgets/product/grid_view_of_prod.dart';

class ProfileWebview extends StatelessWidget {
  const ProfileWebview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width / 6),
      child: Consumer2<UserProvider, ProdProvider>(builder: (
        BuildContext context,
        UserProvider userPro,
        ProdProvider prodPro,
        _,
      ) {
        final AppUser user = userPro.user(uid: AuthMethods.uid);
        return Column(
          children: <Widget>[
            const SizedBox(height: 20),
            _Header(
              user: user,
              postCount: prodPro.usersProducts(AuthMethods.uid).length,
            ),
            Expanded(
              child: GridViewOfProducts(
                posts: prodPro.usersProducts(user.uid),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.user, required this.postCount, Key? key})
      : super(key: key);
  final AppUser user;
  final int postCount;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 180,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CustomNetworkImage(
            imageURL: user.imageURL ?? '',
            width: 120,
            height: 120,
            borderRadius: 12,
          ),
          const SizedBox(width: 10),
          SizedBox(
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  user.displayName ?? 'null',
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 22,
                  ),
                ),
                Text(
                  user.rating.toString(),
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                Text(
                  user.bio ?? '',
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      height: 80,
                      width: 80,
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.wallet_outlined,
                            color: Theme.of(context).primaryColor,
                            size: 64,
                          ),
                          const Text('Wallet'),
                        ],
                      ),
                    ),
                    _DigitalButton(count: postCount, title: 'Post'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _DigitalButton(
                      count: user.supporting?.length ?? 0,
                      title: 'Supportings',
                    ),
                    _DigitalButton(
                      count: user.supporters?.length ?? 0,
                      title: 'Supporters',
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _DigitalButton extends StatelessWidget {
  const _DigitalButton({
    required this.count,
    required this.title,
    Key? key,
  }) : super(key: key);

  final int count;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 80,
      child: Column(
        children: <Widget>[
          Text(
            count.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 48,
            ),
          ),
          Text(title),
        ],
      ),
    );
  }
}
