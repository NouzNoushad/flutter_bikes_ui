import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bikes_ui/dashboard/category_tab.dart';
import 'package:flutter_bikes_ui/dashboard/search_bikes.dart';
import 'package:flutter_bikes_ui/dashboard/top_categories.dart';
import 'package:flutter_bikes_ui/top_brands.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 6,
              child: Container(
                child: Stack(
                  children: [
                    ClipPath(
                      clipper: CustomClipDesign(),
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.blue, Colors.green],
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        bikeAppBar(),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Book Your".toUpperCase(),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.amber,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                Text(
                                  "dream bike".toUpperCase(),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                const Text(
                                  "Lowest Price \$2500",
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                Container(
                                  height: size.height / 25,
                                  width: size.width / 3,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const TopBrands()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.horizontal(
                                          left: Radius.circular(20),
                                          right: Radius.circular(20),
                                        ),
                                      ),
                                    ),
                                    child: const Text(
                                      "Top Brands",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                const SearchBikes(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                        right: 10,
                        child: Image.asset(
                          "assets/ktm_rc_390.png",
                          height: 200,
                          width: 200,
                        )),
                  ],
                ),
              ),
            ),
            const Expanded(
              flex: 4,
              child: TopCategories(),
            ),
            const Expanded(
              flex: 6,
              child: CategoryTabBar(),
            ),
          ],
        ),
      ),
    );
  }

  Widget bikeAppBar() => Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.menu),
            Row(
              children: const [
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
      );
}

class CustomClipDesign extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double width = size.width;
    double height = size.height;

    path.moveTo(width / 4, 0);
    path.quadraticBezierTo(
        width / 4.5, height / 3.2, width / 2.5, height / 2.8);
    path.quadraticBezierTo(
        width / 1.4, height / 2.5, width / 1.5, height / 1.6);
    path.quadraticBezierTo(width / 1.8, height, width, height - 20);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
