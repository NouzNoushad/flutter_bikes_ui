import 'package:flutter/material.dart';

class TopCategories extends StatefulWidget {
  const TopCategories({super.key});

  @override
  State<TopCategories> createState() => _TopCategoriesState();
}

class _TopCategoriesState extends State<TopCategories> {
  List<Map<String, dynamic>> categories = [
    {
      'image': 'super_bike.png',
      'title': 'Super Bikes',
    },
    {
      'image': 'scooter.png',
      'title': 'Scooter',
    },
    {
      'image': 'cruiser.png',
      'title': 'Cruiser Bikes',
    },
    {
      'image': 'honda-bike.png',
      'title': 'Commuter',
    },
  ];

  final List prices = [
    "\$100 - \$1000",
    "\$150 - \$1500",
    "\$300 - \$3000",
    "\$1500 - \$5000",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Top Category and Price",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return Container(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/${category['image']}",
                        height: 60,
                        width: 80,
                        fit: BoxFit.contain,
                      ),
                      Text(
                        category['title'],
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            height: 45,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: prices.length,
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.fromLTRB(10, 8, 8, 8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(-2, 2),
                        blurRadius: 10,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                  child: Text(
                    prices[index],
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
