import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../database/auth_methods.dart';
import '../../functions/responsive_function.dart';
import '../../functions/time_date_functions.dart';
import '../../models/app_user.dart';
import '../../models/product.dart';
import '../../providers/user_provider.dart';
import '../../utilities/utilities.dart';
import '../../widgets/custom_slideable_urls_tile.dart';
import '../../widgets/custom_widgets/custom_elevated_button.dart';
import '../../widgets/custom_widgets/custom_profile_image.dart';
import '../../widgets/custom_widgets/show_info_dialog.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({required this.product, Key? key})
      : super(key: key);
  static const String routeName = 'product-detail';
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Card(
            elevation: 5,
            child: Container(
              width: MediaQuery.of(context).size.width / 1.5,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Consumer<UserProvider>(
                  builder: (BuildContext context, UserProvider userPro, _) {
                final AppUser postBy = userPro.user(uid: product.uid);
                return Column(
                  children: <Widget>[
                    const SizedBox(height: 10),
                    ListTile(
                      leading:
                          CustomProfileImage(imageURL: postBy.imageURL ?? ''),
                      title: Text(postBy.displayName ?? 'null'),
                      subtitle: Text(
                          TimeDateFunctions.timeInWords(product.timestamp!)),
                      trailing: IconButton(
                        onPressed: () {
                          // TODO: Notification Seller Button click
                          showInfoDialog(
                            context,
                            title: 'Next Milestone',
                            message: 'This is a part of next milestone',
                          );
                        },
                        icon: const Icon(Icons.more_vert_outlined),
                      ),
                    ),
                    CustomSlidableURLsTile(urls: product.prodURL),
                    _InfoCard(product: product),
                    _ButtonSection(user: postBy, product: product),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.product, Key? key}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Padding(
          padding: EdgeInsets.all(Utilities.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      product.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    product.price.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: const <Widget>[
                  Icon(
                    Icons.location_on,
                    color: Colors.grey,
                    size: 12,
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Location here',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  )
                ],
              ),
              const SizedBox(height: 8),
              Text(
                product.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ButtonSection extends StatelessWidget {
  const _ButtonSection({required this.user, required this.product, Key? key})
      : super(key: key);
  final AppUser user;
  final Product product;
  static const EdgeInsetsGeometry _padding = EdgeInsets.symmetric(vertical: 8);
  static const EdgeInsetsGeometry _margin = EdgeInsets.symmetric(vertical: 3);
  static const TextStyle _textStyle =
      TextStyle(color: Colors.white, fontSize: 16);
  @override
  Widget build(BuildContext context) {
    return user.uid == AuthMethods.uid
        ? const SizedBox()
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: Utilities.padding),
            child: !ResponsiveFunctions.isMobile(context)
                ? Row(
                    children: <Widget>[
                      Flexible(
                        child: CustomElevatedButton(
                          padding: _padding,
                          margin: _margin,
                          textStyle: _textStyle,
                          title: 'Buy Now',
                          onTap: () {
                            if (user.displayName == null ||
                                user.displayName == '') {
                              return;
                            }
                            // Navigator.of(context)
                            //     .push(MaterialPageRoute<ProductChatScreen>(
                            //   builder: (BuildContext context) => BuyNowScreen(
                            //     product: product,
                            //   ),
                            // ));
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      product.acceptOffers
                          ? Flexible(
                              child: CustomElevatedButton(
                                padding: _padding,
                                margin: _margin,
                                textStyle: _textStyle,
                                title: 'Make Offer',
                                onTap: () {
                                  // Navigator.of(context)
                                  //     .push(MaterialPageRoute<ProductChatScreen>(
                                  //   builder: (BuildContext context) => MakeOfferScreen(
                                  //     product: product,
                                  //     user: user,
                                  //   ),
                                  // ));
                                },
                              ),
                            )
                          : const SizedBox(),
                      const SizedBox(width: 10),
                      Flexible(
                        child: CustomElevatedButton(
                          padding: _padding,
                          margin: _margin,
                          bgColor: Colors.transparent,
                          border:
                              Border.all(color: Theme.of(context).primaryColor),
                          textStyle: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).primaryColor,
                          ),
                          title: 'Message Seller',
                          onTap: () {
                            if (user.displayName == null ||
                                user.displayName == '') {
                              return;
                            }
                            // Navigator.of(context)
                            //     .push(MaterialPageRoute<ProductChatScreen>(
                            //   builder: (BuildContext context) => ProductChatScreen(
                            //     otherUser: user,
                            //     chatID: '${AuthMethods.uid}${product.pid}',
                            //     product: product,
                            //   ),
                            // ));
                          },
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: <Widget>[
                      CustomElevatedButton(
                        padding: _padding,
                        margin: _margin,
                        textStyle: _textStyle,
                        title: 'Buy Now',
                        onTap: () {
                          if (user.displayName == null ||
                              user.displayName == '') {
                            return;
                          }
                          // Navigator.of(context)
                          //     .push(MaterialPageRoute<ProductChatScreen>(
                          //   builder: (BuildContext context) => BuyNowScreen(
                          //     product: product,
                          //   ),
                          // ));
                        },
                      ),
                      product.acceptOffers
                          ? CustomElevatedButton(
                              padding: _padding,
                              margin: _margin,
                              textStyle: _textStyle,
                              title: 'Make Offer',
                              onTap: () {
                                // Navigator.of(context)
                                //     .push(MaterialPageRoute<ProductChatScreen>(
                                //   builder: (BuildContext context) => MakeOfferScreen(
                                //     product: product,
                                //     user: user,
                                //   ),
                                // ));
                              },
                            )
                          : const SizedBox(),
                      CustomElevatedButton(
                        padding: _padding,
                        margin: _margin,
                        bgColor: Colors.transparent,
                        border:
                            Border.all(color: Theme.of(context).primaryColor),
                        textStyle: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                        ),
                        title: 'Message Seller',
                        onTap: () {
                          if (user.displayName == null ||
                              user.displayName == '') {
                            return;
                          }
                          // Navigator.of(context)
                          //     .push(MaterialPageRoute<ProductChatScreen>(
                          //   builder: (BuildContext context) => ProductChatScreen(
                          //     otherUser: user,
                          //     chatID: '${AuthMethods.uid}${product.pid}',
                          //     product: product,
                          //   ),
                          // ));
                        },
                      ),
                    ],
                  ),
          );
  }
}
