import 'package:flutter/material.dart';

import '../../../Provider/favourite_provider.dart';
import '../../../constants.dart';
import '../../../models/product_model.dart';

class DetailAppBar extends StatelessWidget {
  const DetailAppBar({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return Padding(
        padding: EdgeInsets.all(10),
        child: Row(
        children: [
          IconButton(
              style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.all(15)
              ),
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios)
          ),

          Spacer(),
          IconButton(
              style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.all(15)
              ),
              onPressed: (){},

              icon: Icon(Icons.share_outlined)
          ),
          SizedBox(
            width: 10,
          ),

          IconButton(
              style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.all(15)
              ),
              onPressed: (){
                provider.toggleFavorite(product);
              },

              icon: Icon(
                provider.isExist(product)
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: Colors.black,
                size: 25,
              )
          ),
        ],
    ),
    );
  }
}
