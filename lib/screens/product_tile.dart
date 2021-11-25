import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/models/shop_product.dart';
import 'package:getx_example/models/shop_product.dart';

class ProductTile extends StatelessWidget {
  final NewProduct product;
  const ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: FadeInImage(
                    image: NetworkImage(
                      product.imageLink!,
                      //loadingBuilder: (context, exception, stackTrack) => Center(child: CircularProgressIndicator()),
                      // (context, exception, stackTrace) {
                      //     return Text('loading');
                      // },
                    ),
                    placeholder: AssetImage("assets/placeHolder.png"),
                    fit: BoxFit.cover,
                    imageErrorBuilder: (context, exception, stackTrack) => Icon(Icons.error),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Obx(() => CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: product.isFavorite.value
                              ? Icon(Icons.favorite_rounded)
                              : Icon(Icons.favorite_border),
                          onPressed: () {
                            product.isFavorite.toggle();
                          },
                        ),
                      )),
                )
              ],
            ),
            SizedBox(height: 8),
            Text(
              product.name!,
              maxLines: 2,
              style:
                  TextStyle(fontFamily: 'avenir', fontWeight: FontWeight.w800),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
            if (product.rating != null)
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      product.rating.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            SizedBox(height: 8),
            Text('\$${product.price}',
                style: TextStyle(fontSize: 32, fontFamily: 'avenir')),
          ],
        ),
      ),
    );
  }
}

/*loading image in different ways 
 1:   child: Image.network(
                    product.imageLink,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, exception, stackTrack) => Center(child: CircularProgressIndicator()),
                    imageErrorBuilder: (context, exception, stackTrack) => Icon(Icons.error),
                  ),

 2:   use fadinimage 
FadeInImage(
                    image: NetworkImage(
                      product.imageLink!,
                    ),
                    placeholder: AssetImage("assets/placeHolder.png"),
                    fit: BoxFit.cover,
                    imageErrorBuilder: (context, exception, stackTrack) => Icon(Icons.error),
                  ),

 3: use extended image
*/