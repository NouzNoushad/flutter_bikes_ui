import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class TopBrands extends StatefulWidget {
  const TopBrands({super.key});

  @override
  State<TopBrands> createState() => _TopBrandsState();
}

class _TopBrandsState extends State<TopBrands>
    with SingleTickerProviderStateMixin {
  late final TabController _controller = TabController(length: 5, vsync: this);
  List<Map<String, dynamic>> logos = [
    {
      'image': 'yamaha_logo.jpg',
      'brand': 'Yamaha',
    },
    {
      'image': 'ktm_logo.png',
      'brand': 'KTM',
    },
    {
      'image': 'royal_log.png',
      'brand': 'Royal',
    },
    {
      'image': 'tvs_logo.png',
      'brand': 'TVS',
    },
    {
      'image': 'honda_logo.jpg',
      'brand': 'Honda',
    },
  ];
  List<Map<String, dynamic>> bikes = [
    {
      'image': 'ktm_img.jpg',
      'name': 'KTM Duke',
      'price': 2500,
    },
    {
      'image': 'revolt.jpg',
      'name': 'Revolt',
      'price': 1500,
    },
    {
      'image': 'pulsar_125.jpg',
      'name': 'Pulsar 125',
      'price': 1000,
    },
    {
      'image': 'activa.jpg',
      'name': 'Honda Activa',
      'price': 900,
    },
    {
      'image': 'splendor_plus.webp',
      'name': 'Splendor Plus',
      'price': 800,
    },
    {
      'image': 'yamaha_mt15.webp',
      'name': 'Yamaha M15',
      'price': 1200,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.fromLTRB(18, 18, 18, 10),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.blue, Colors.green],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const Text(
                      "Top Brands and Popular",
                      style: TextStyle(color: Colors.white),
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.white,
                          size: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Top Brands",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: logos.length,
                        itemBuilder: (context, index) {
                          final logo = logos[index];
                          return Container(
                            margin: const EdgeInsets.only(right: 15),
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/${logo['image']}",
                                  height: 50,
                                  width: 50,
                                ),
                                Text(logo['brand'])
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  children: [
                    RotatedBox(
                      quarterTurns: 3,
                      child: TabBar(
                        controller: _controller,
                        labelColor: Colors.black,
                        isScrollable: true,
                        indicatorColor: Colors.transparent,
                        labelStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                        tabs: const [
                          Text(
                            "View All",
                          ),
                          Text(
                            "Newest Bike",
                          ),
                          Text(
                            "Popular Bike",
                          ),
                          Text(
                            "Upcoming Bike",
                          ),
                          Text(
                            "Cruiser Bike",
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _controller,
                        children: [
                          viewAllBikes(),
                          const Center(
                            child: Text("Newest"),
                          ),
                          const Center(
                            child: Text("Popular"),
                          ),
                          const Center(
                            child: Text("Upcoming"),
                          ),
                          const Center(
                            child: Text("Cruiser"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget viewAllBikes() => MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemCount: bikes.length,
        itemBuilder: (context, index) {
          final bike = bikes[index];
          return Container(
            height: index.isOdd ? 120 : 200,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage("assets/${bike['image']}"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  bike['name'],
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${bike['price']}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Colors.yellow,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(width: 1, color: Colors.white),
                      ),
                      child: const Text(
                        "Book",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
}
