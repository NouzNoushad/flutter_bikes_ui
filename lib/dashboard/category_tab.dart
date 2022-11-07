import 'package:flutter/material.dart';
import 'package:flutter_bikes_ui/bike_details.dart';
import 'package:flutter_bikes_ui/model/newest.dart';

class CategoryTabBar extends StatefulWidget {
  const CategoryTabBar({super.key});

  @override
  State<CategoryTabBar> createState() => _CategoryTabBarState();
}

class _CategoryTabBarState extends State<CategoryTabBar>
    with SingleTickerProviderStateMixin {
  late final TabController _controller = TabController(length: 3, vsync: this);
  List<Newest> newest = NewestList;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              tabs: const [
                Text(
                  "Newest Bike",
                ),
                Text(
                  "Popular",
                ),
                Text(
                  "Upcoming",
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
                newestBikes(),
                const Center(
                  child: Text("Popular"),
                ),
                const Center(
                  child: Text("Upcoming"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget newestBikes() => Expanded(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: newest.length,
          itemBuilder: (context, index) {
            final newestBrand = newest[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => BikeDetails(newest: newestBrand)),
                );
              },
              child: Card(
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/${newestBrand.image}0.png",
                        height: 145,
                        width: 150,
                        fit: BoxFit.contain,
                      ),
                      Text(
                        newestBrand.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        "\$${newestBrand.price}*",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 11,
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                          ),
                          child: const Text(
                            "Book Now / Test Drive",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
}
