import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductContainer extends StatelessWidget {
  final String image;
  const ProductContainer({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 210,
          width: 160,
          decoration: BoxDecoration(
              //color: Colors.black,
              image: DecorationImage(image: NetworkImage(image)),
              borderRadius: BorderRadius.circular(20)),
        ),
        Positioned(
          bottom: -20,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            child: Container(
              height: 40,
              width: 40,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.black),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/icons/bag-2.png',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class MyBottomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 80);
    Offset fCtrlPoint = Offset(size.width / 2, size.height);
    Offset fEndPoint = Offset(size.width, size.height - 80);
    path.quadraticBezierTo(
        fCtrlPoint.dx, fCtrlPoint.dy, fEndPoint.dx, fEndPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
