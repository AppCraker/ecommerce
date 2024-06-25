import 'package:ecommerce/Provider/cart_provider.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/screens/Cart/check_out.dart';
import 'package:flutter/material.dart';

import '../nav_bar_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final finalList = provider.cart;
    producrQuantity(IconData icon, int index) {
      return GestureDetector(
          onTap: () {
            setState(() {
              icon == Icons.add
                  ? provider.incrementQtn(index)
                  : provider.decrementQtn(index);
            });
          },
        child: Icon(
          icon,
          size: 20,
        ),
      );
    }
    return Scaffold(
      bottomSheet: CheckOutBox(),
      body: SafeArea(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(8),
            child: Row(
              children: [
                IconButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomNavBar(),),);
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.all(15)
                  ),

                ),

                Text(
                  "Cart",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),

                Container(),
              ],
            ),
            ),

            Expanded(child: ListView.builder(
                itemCount: finalList.length ,
                itemBuilder: (context,index){
                  final cartItems = finalList[index];
              return Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),

                      ),
                      padding: EdgeInsets.all(15),
                      child: (
                      Row(
                        children: [
                          Container(
                            height: 120,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: kcontentColor
                            ),
                            padding: EdgeInsets.all(15),
                            child: Image.asset(cartItems.image),
                          ),

                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  cartItems.title,
                                  style: TextStyle(
                                    fontWeight:FontWeight.bold,
                                    fontSize: 16,
                                  ),
                              ),
                              SizedBox(height: 5,),

                              Text(
                                cartItems.category,
                                style: TextStyle(
                                  fontWeight:FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text(
                                "\R\s${cartItems.price}",
                                  style: TextStyle(
                                    fontWeight:FontWeight.bold,
                                    fontSize: 14,
                                  ),
                              )
                            ],
                          )

                        ],
                      )
                      ),
                    ),
                  ),

                  Positioned(
                    top: 35,
                      right: 15,

                      child: Column(
                        children: [
                          IconButton(
                              onPressed: (){
                                finalList.removeAt(index);
                                setState(() {

                                });
                              },
                              icon:Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 22,
                              ),
                          ),


                  const SizedBox(height: 10),
                  Container(
                  height: 40,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kcontentColor,
                  border: Border.all(
                  color: Colors.grey.shade400,
                  width: 2,
                  ),
                  ),
                  child: Row(
                  children: [
                  const SizedBox(width: 10),
                  producrQuantity(Icons.add, index),
                  const SizedBox(width: 10),
                  Text(
                  cartItems.quantity.toString(),
                  style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  ),
                  ),
                  const SizedBox(width: 10),
                  producrQuantity(Icons.remove, index),
                  const SizedBox(width: 10),
                  ],
                  ),
                  ),
                  ],
                      ),
                  )
                ],
              );
            })
            )
          ],
        ),
      ),
    );
  }
}
