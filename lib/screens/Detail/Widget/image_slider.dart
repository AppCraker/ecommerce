import 'package:flutter/cupertino.dart';

class MyImageSlider extends StatelessWidget {
  const MyImageSlider({super.key, required this.onChange, required this.image});
  final Function(int) onChange;
  final String image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
          onPageChanged: onChange,
          itemBuilder: (context,index){
        return Image.asset(image);
      }),
    );
  }
}
