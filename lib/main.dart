import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sweet_nav_bar/sweet_nav_bar.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List items = ['All', 'Juice', 'Drinko', 'Coffe', 'Tea', 'Soda', 'Milk'];
  final List<Color> _alreadyusedcolors = [];

  Color _randomColor() {
    Color newColor =
        Color((math.Random().nextDouble() * 0xffffff).toInt()).withOpacity(0.5);
    while (_alreadyusedcolors.contains(newColor)) {
      newColor = Color((math.Random().nextDouble() * 0xffffff).toInt())
          .withOpacity(0.5);
    }
    _alreadyusedcolors.add(newColor);
    return newColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SweetNavBar(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
        currentIndex: 1,
        backgroundColor: Colors.black,
        paddingBackgroundColor: Colors.white,
        items: [
          SweetNavBarItem(
            isGradiant: false,
            sweetBackground: Colors.black,
            sweetActive: const Icon(Icons.other_houses),
            sweetIcon: const Icon(
              Icons.other_houses_outlined,
            ),
            sweetLabel: 'Home',
          ),
          SweetNavBarItem(
            isGradiant: false,
            sweetBackground: Colors.black,
            sweetIcon: const Icon(
              Icons.favorite_border_outlined,
              color: Colors.grey,
            ),
            sweetLabel: 'Home',
          ),
          SweetNavBarItem(
              sweetBackground: Colors.black,
              isGradiant: false,
              sweetIcon: const Icon(
                Icons.shopping_bag_outlined,
                color: Colors.grey,
              ),
              sweetLabel: 'Business'),
          SweetNavBarItem(
              isGradiant: false,
              sweetBackground: Colors.black,
              sweetIcon: const Icon(
                Icons.person_outline,
                color: Colors.grey,
              ),
              sweetLabel: 'School'),
        ],
        onTap: (index) {
          setState(() {});
        },
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 28.0,
                    backgroundImage: NetworkImage(
                      "https://i.ibb.co/PGv8ZzG/me.jpg",
                    ),
                  ),
                  CircleAvatar(
                    radius: 28.0,
                    backgroundColor: Colors.grey[200],
                    child: const Icon(
                      Icons.notifications_none_outlined,
                      size: 30.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12.0,
              ),
              const Text('Order Your\nFavourite Drinks',
                  style: TextStyle(
                      fontSize: 26.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: Colors.black87)),
              const SizedBox(
                height: 12.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 60,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        hintText: 'Search Here...',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.pink[400],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.tune_outlined,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 12.0,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ListView.builder(
                  itemCount: items.length,
                  scrollDirection: Axis.horizontal,
                  physics: const ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        items[index],
                        style: TextStyle(
                          fontWeight: items[index] == 'All'
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ), // Your widget here
                    );
                  },
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                    height: 310.0,
                    enableInfiniteScroll: true,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.2),
                items: [1, 2, 3, 4].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        padding: const EdgeInsets.all(16),
                        width: 270,
                        decoration: BoxDecoration(
                          color: _randomColor(),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: Image.asset(
                          "assets/$i.png",
                          fit: BoxFit.fitHeight,
                        ),
                      );
                    },
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
