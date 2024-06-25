import 'package:ecommerce/constants.dart';
import 'package:ecommerce/screens/Detail/Widget/add_to_cart.dart';
import 'package:ecommerce/screens/Detail/Widget/detail_app_bar.dart';
import 'package:ecommerce/screens/Detail/Widget/image_slider.dart';
import 'package:ecommerce/screens/Detail/Widget/item_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/product_model.dart';
import 'Widget/description.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int currentImage =0;
  int currentColor = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AddToCart(product: widget.product,),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: kcontentColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              // For back button share and favourite
              DetailAppBar(product: widget.product,),
        
              //For Detailing Image Slider
        
              MyImageSlider(onChange: (index){
                setState(() {
                  currentImage = index;
                });
              }, image: widget.product.image),
        
              SizedBox(
                height: 10,
              ),
        
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    4,
                        (index) => AnimatedContainer(
                      duration: Duration(microseconds: 300),
                      width: currentImage == index ? 15 : 8,
                      height: 8,
                      margin: EdgeInsets.only(right: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: currentImage == index
                              ? Colors.black
                              : Colors.transparent,
        
                          border: Border.all(color: Colors.black)
                      ),
                    ),
                  )),
        
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
        
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40)
                  )
                ),
                padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 20,
                      bottom:100 ,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //product name , price, seller and rating
                    ItemDetail(product: widget.product),
                    const SizedBox(height: 20),
                    const Text(
                      "Color",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: List.generate(
                        widget.product.colors.length,
                            (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              currentColor = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: currentColor == index
                                  ? Colors.white
                                  : widget.product.colors[index],
                              border: currentColor == index
                                  ? Border.all(
                                color: widget.product.colors[index],
                              )
                                  : null,
                            ),
                            padding: currentColor == index
                                ? const EdgeInsets.all(2)
                                : null,
                            margin: const EdgeInsets.only(right: 10),
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                  color: widget.product.colors[index],
                                  shape: BoxShape.circle),
                            ),
                          ),
                        ),
                      ),
                    ),
        
                    const SizedBox(height: 25),
                    // for description
                    Description(description: widget.product.description,),
                  ],
                ),
        
              ),
        
        
        
            ],
          ),
        ),
      ),
    );
  }
}
