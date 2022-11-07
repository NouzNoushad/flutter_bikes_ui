import 'package:flutter/material.dart';

class SearchBikes extends StatefulWidget {
  const SearchBikes({super.key});

  @override
  State<SearchBikes> createState() => _SearchBikesState();
}

class _SearchBikesState extends State<SearchBikes> {
  bool _newBikeValue = false;
  bool _budgetBikeValue = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 9,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(50),
          right: Radius.circular(50),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(-1, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Transform.scale(
                    scale: 0.8,
                    child: Checkbox(
                        value: _newBikeValue,
                        shape: const CircleBorder(),
                        activeColor: Colors.grey,
                        onChanged: (bool? value) {
                          setState(() {
                            _newBikeValue = value!;
                          });
                        }),
                  ),
                  const Text(
                    "New Bike",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Transform.scale(
                    scale: 0.8,
                    child: Checkbox(
                        value: _budgetBikeValue,
                        shape: const CircleBorder(),
                        activeColor: Colors.grey,
                        onChanged: (bool? value) {
                          setState(() {
                            _budgetBikeValue = value!;
                          });
                        }),
                  ),
                  const Text(
                    "Budget Bike",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const Text(
                "Advanced search",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              searchTextFields("select brand"),
              searchTextFields("select bike"),
            ],
          ),
        ],
      ),
    );
  }

  Widget searchTextFields(hint) => Container(
        height: 25,
        width: MediaQuery.of(context).size.width / 2 - 60,
        child: TextField(
          style: const TextStyle(
            fontSize: 12,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: hint,
            hintStyle: const TextStyle(
              fontSize: 12,
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(20),
                right: Radius.circular(20),
              ),
              borderSide: BorderSide.none,
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(20),
                right: Radius.circular(20),
              ),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      );
}
