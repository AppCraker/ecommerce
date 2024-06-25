import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/screens/Detail/detail.dart';
import 'package:ecommerce/screens/Detail/Widget/detail_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Provider/favourite_provider.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return GestureDetector(
      onTap: () {
        
        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen(product: product,)),);
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: kcontentColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15),
                Center(
                  child: Image.asset(
                    product.image,
                    width: 130,
                    height: 130,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    product.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "\R\s ${product.price}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    Row(
                      children: List.generate(
                          product.colors.length,
                          (index) => Container(
                            width: 17,
                            height: 17,
                            margin: EdgeInsets.only(right:4),
                            decoration: BoxDecoration(
                              color: product.colors[index],
                              shape: BoxShape.circle
                            ),
                          )),
                    )
                  ],
                )
              ],
            ),
          ),

          Positioned(
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 40,
                    width: 40,
                  decoration: BoxDecoration(
                    color: kprimaryColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20) ,
                      bottomLeft: Radius.circular(20)
                    ),
                  ),
                  child: GestureDetector(
                    onTap: (){
                      provider.toggleFavorite(product);
                    },
                    child: Icon(provider.isExist(product)
                        ? Icons.favorite
                        : Icons.favorite_border,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
