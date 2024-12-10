import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class Check extends StatefulWidget {
  const Check({super.key});

  @override
  State<Check> createState() => _CheckState();
}

class _CheckState extends State<Check> {
  final List<Map<String, String>> cards = [
    {
      'image': 'assets/images/homepage1',
      'text': 'Card 1',
    },
    {
      'image': 'assets/images/homepage1',
      'text': 'Card 2',
    },
    {
      'image': 'assets/images/homepage1',
      'text': 'Card 3',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Carousel'),
      ),
      body: Center(
        child: CarouselSlider.builder(
          itemCount: cards.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage(cards[index]['image']!),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  cards[index]['text']!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: 200.0,
            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
          ),
        ),
      ),
    );
  }
}