import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_spintech/views/home.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  PageController controller = PageController();
  int index = 0;
  final data = [
    {
      'image':
          'handsome-man-black-suit-with-white-shirt-posing-attractive-guy-with-fashion-hairstyle-confident-man-with-short-beard-adult-boy-with-brown-hair-full-portrait21.png',
      'text': 'Your style tell about you',
      'sub':
          'There are many clothes with designs that are suitable for you today'
    },
    {
      'image': 'man-portrait11.png',
      'text': 'Level up your lifestyle',
      'sub':
          'There are many clothes with designs that are suitable for you today'
    },
    {
      'image':
          'handsome-man-black-suit-with-white-shirt-posing-attractive-guy-with-fashion-hairstyle-confident-man-with-short-beard-adult-boy-with-brown-hair-full-portrait21.png',
      'text': 'Your style tell about you',
      'sub':
          'There are many clothes with designs that are suitable for you today'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff061023),
      body: Stack(
        children: [
          PageView.builder(
              controller: controller,
              itemCount: data.length,
              onPageChanged: (value) {
                setState(() {
                  index = value;
                });
              },
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/${data[index]['image']}'))),
                );
              }),
          Positioned(
            bottom: 70,
            left: 0,
            right: 0,
            child: Stack(
              children: [
                Container(
                  height: 230,
                  width: 1 / 0,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Colors.transparent,
                        Color(0xff061023),
                        Colors.black
                      ])),
                ),
                Positioned(
                    bottom: 60,
                    left: 20,
                    right: 20,
                    child: Column(
                      children: [
                        Text(
                          data[index]['text'].toString(),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          data[index]['sub'].toString(),
                          style: Theme.of(context).textTheme.bodyLarge,
                        )
                      ],
                    )),
              ],
            ),
          ),
          Positioned(bottom: 0, left: 0, right: 0, child: bottomStepShow()),
          /* Positioned(
            bottom: 95,
            right: 10,
            left: 10,
            child: Opacity(
              opacity: .8,
              child: Container(
                height: 140,
                width: 1/0,
                color: Colors.black,
              ),
            )) */
        ],
      ),
    );
  }

  Widget bottomStepShow() => Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        height: 95,
        width: 1 / 0,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 0, 32, 48),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...[0, 1, 2].map(
                    (e) => AnimatedContainer(
                      height: 8,
                      width: 8,
                      duration: const Duration(
                        milliseconds: 500,
                      ),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == e ? Colors.white : Colors.blueGrey),
                    ),
                  )
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Continuer',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.black),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(
                        Icons.arrow_forward,
                        size: 12,
                      ),
                    )
                  ],
                ))
          ],
        ),
      );
}
