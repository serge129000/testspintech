import 'package:flutter/cupertino.dart';

class MyBottomNav extends StatelessWidget {
  const MyBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25
      ),
      height: 90,
      width: 1/0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/icons/home.png', height: 25,),
          Image.asset('assets/icons/heart.png', height: 25,),
          Image.asset('assets/icons/notification-bing.png', height: 25,),
          Image.asset('assets/icons/profile.png', height: 25,)
        ],
      ),
    );
  }
}
