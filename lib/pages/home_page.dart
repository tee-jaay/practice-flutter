import 'package:coff/util/coffe_type.dart';
import 'package:coff/util/coffee_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of coffee types
  final List coffeeTypes = [
    [
      'Cappuccino',
      true,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Black',
      false,
    ],
    [
      'Tea',
      false,
    ],
  ];

  // user coffee type select
  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeTypes.length; i++) {
        coffeeTypes[i][1] = false;
      }
      coffeeTypes[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        actions: const [
          Icon(Icons.person),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // find best coffee for you
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Text(
              'Find the best coffee \nfor you',
              style: GoogleFonts.bebasNeue(
                fontSize: 42,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          // search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Find your coffee..',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            height: 32.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeTypes.length,
              itemBuilder: (context, index) {
                return CoffeeType(
                  coffeeType: coffeeTypes[index][0],
                  isSelelcted: coffeeTypes[index][1],
                  onTap: () => coffeeTypeSelected(index),
                );
              },
            ),
          ),
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              CoffeeTile(
                coffeeName: 'Latte',
                coffeeDescription: 'with almond milk',
                coffeeImage: 'lib/images/image1.jpg',
                coffeePrice: '4.53',
              ),
              CoffeeTile(
                coffeeName: 'Cappuccino',
                coffeeDescription: 'with almond milk',
                coffeeImage: 'lib/images/image2.jpg',
                coffeePrice: '7.53',
              ),
              CoffeeTile(
                coffeeName: 'Black',
                coffeeDescription: 'with almond milk',
                coffeeImage: 'lib/images/image3.jpg',
                coffeePrice: '6.01',
              ),
              CoffeeTile(
                coffeeName: 'Tea',
                coffeeDescription: 'with almond milk',
                coffeeImage: 'lib/images/image4.jpg',
                coffeePrice: '8.53',
              ),
            ],
          ))
          // horizontal list view
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
        ],
      ),
    );
  }
}
