import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import '../../models/product.dart';
// import '../../screens/product_detail_screen/product_detail_screen.dart';

class GridViewOfProducts extends StatelessWidget {
  const GridViewOfProducts({required this.posts, Key? key}) : super(key: key);
  final List<Product> posts;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      primary: false,
      shrinkWrap: true,
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) => InkWell(
        onTap: () {},
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Hero(
                tag: posts[index].pid,
                child: AspectRatio(
                  aspectRatio: 4 / 3,
                  child:
                      // posts[index].prodURL[0].isVideo
                      // ? VideoWidget(
                      //     videoUrl: posts[index].prodURL[0].url,
                      //     isMute: true,
                      //     isPause: true,
                      //   )
                      // :
                      ExtendedImage.network(
                    posts[index].prodURL[0].url,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
              child: Text(
                posts[index].title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                  letterSpacing: 1,
                ),
              ),
            ),
            SizedBox(
              height: 20,
              child: Text(
                '\$ ${posts[index].price}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  letterSpacing: 1,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
