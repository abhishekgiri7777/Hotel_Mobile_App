import 'package:api_integration/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: 100,
      child: InkWell(
        onTap: () {
          print("Product Name \"" +
              product.name +
              "\" and Price is \"\$" +
              product.price +
              "\".");
        },
        child: Card(
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Image.network(
                        product.imageLink,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: Obx(() => CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: product.isFavorite.value
                                  ? Icon(Icons.favorite_rounded,
                                      size: 30, color: Colors.red)
                                  : Icon(Icons.favorite_border,
                                      size: 30, color: Colors.red),
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
                  product.name,
                  maxLines: 2,
                  style: TextStyle(
                      fontFamily: 'avenir', fontWeight: FontWeight.w800),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    // Expanded(
                    //     child: Text("Place",
                    //     style: TextStyle(fontSize: 25.0),)
                    // ),
                    if (product.rating != null)
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 2),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              product.rating.toString(),
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.star,
                              size: 20,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 8),
                Text('\$${product.price}',
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'avenir')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
