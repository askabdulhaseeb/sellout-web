import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/product.dart';
import '../../../providers/prod_provider.dart';
import '../../../widgets/custom_widgets/custom_elevated_button.dart';
import '../../../widgets/product/prod_post_tile.dart';

class HomeWebview extends StatelessWidget {
  const HomeWebview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        SizedBox(width: size.width / 6),
        Consumer<ProdProvider>(
          builder: (BuildContext context, ProdProvider prodPro, _) {
            final List<Product> products = prodPro.products;
            return SizedBox(
              width: size.width / 2,
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProdPostTile(product: products[index]);
                },
              ),
            );
          },
        ),
        SizedBox(
          width: size.width / 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomElevatedButton(
                title: '+ Start Selling',
                onTap: () {},
              ),
              const SizedBox(height: 24),
              const Text(
                'Suggestions for you',
                style: TextStyle(
                  letterSpacing: 0.8,
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),
              // SizedBox(
              //   height: size.height / 2,
              //   width: size.width / 6,
              //   child: Consumer<UserProvider>(
              //       builder: (BuildContext context, UserProvider userPro, _) {
              //     log('Userrrrr: ${userPro.users.length}');
              //     return userPro.users.isEmpty
              //         ? const SizedBox()
              //         : ListView.builder(
              //             itemCount: 10,
              //             itemBuilder: (BuildContext context, int index) {
              //               final AppUser user = userPro.users[index];
              //               return ListTile(
              //                 leading: CustomProfileImage(
              //                     imageURL: user.imageURL ?? ''),
              //                 title: Text(user.displayName ?? 'null'),
              //                 trailing: CustomElevatedButton(
              //                   title: 'Follow',
              //                   onTap: () {},
              //                 ),
              //               );
              //             },
              //           );
              //   }),
              // )
            ],
          ),
        ),
      ],
    );
  }
}
