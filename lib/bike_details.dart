import 'package:flutter/material.dart';
import 'package:flutter_bikes_ui/model/newest.dart';

class BikeDetails extends StatefulWidget {
  final Newest newest;
  const BikeDetails({super.key, required this.newest});

  @override
  State<BikeDetails> createState() => _BikeDetailsState();
}

class _BikeDetailsState extends State<BikeDetails> {
  int _index = 0;
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: detailsAppBar(),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: Stack(
                  children: [
                    Positioned(
                      bottom: -20,
                      left: -10,
                      child: Image.asset(
                        "assets/${widget.newest.image}$_index.png",
                        height: 300,
                        width: 300,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Wrap(
                        direction: Axis.vertical,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _index = 0;
                              });
                            },
                            child: Card(
                              elevation: 8,
                              child: Image.asset(
                                "assets/${widget.newest.image}0.png",
                                height: 50,
                                width: 70,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _index = 1;
                              });
                            },
                            child: Card(
                              elevation: 8,
                              child: Image.asset(
                                "assets/${widget.newest.image}1.png",
                                height: 50,
                                width: 70,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _index = 2;
                              });
                            },
                            child: Card(
                              elevation: 8,
                              child: Image.asset(
                                "assets/${widget.newest.image}2.png",
                                height: 50,
                                width: 70,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.all(18),
                child: ListView(
                  children: [
                    const Text(
                      "Key Specs of KTM 125 Duke",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 70,
                      width: double.infinity,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          specsCard(
                              "Engine", "${widget.newest.details['engine']}cc"),
                          specsCard(
                              "Power", "${widget.newest.details['power']}bhp"),
                          specsCard("Mileage",
                              "${widget.newest.details['mileage']}kmpl"),
                          specsCard(
                              "Brake", "${widget.newest.details['brake']}"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Specification",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Theme(
                      data: ThemeData(
                          colorScheme: const ColorScheme.light(
                        primary: Colors.green,
                      )),
                      child: Stepper(
                        currentStep: _currentStep,
                        onStepCancel: () {
                          if (_currentStep > 0) {
                            setState(() {
                              _currentStep -= 1;
                            });
                          }
                        },
                        onStepContinue: () {
                          if (_currentStep <= 0) {
                            setState(() {
                              _currentStep += 1;
                            });
                          }
                        },
                        onStepTapped: (int index) {
                          setState(() {
                            _currentStep = index;
                          });
                        },
                        steps: [
                          Step(
                            title: const Text(
                              "Product Overview",
                            ),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Version - standard",
                                ),
                                const Text(
                                  "Ex showroom price",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "\$${widget.newest.price}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Step(
                            title: const Text(
                              "Engine & Transmission",
                            ),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Displacement",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "\$${widget.newest.details['engine']}cc",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
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

  Widget specsCard(String title, String details) => Card(
        elevation: 8,
        child: Container(
          width: 55,
          margin: const EdgeInsets.all(6.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              Text(
                details,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      );

  Widget detailsAppBar() => Container(
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 10),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.green],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
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
            Text(
              widget.newest.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
}
