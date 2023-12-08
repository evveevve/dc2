import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:desired_car/backend/database/search.dart';
import 'package:desired_car/backend/model/details_model.dart';

class Evaluate extends StatefulWidget {
  const Evaluate({super.key});

  @override
  State<Evaluate> createState() => _EvaluateState();
}

class _EvaluateState extends State<Evaluate> {
  String genMileage = '';
  String genDistance = '';
  String genFuelCost = '';
  String evMileage = '';
  String evDistance = '';
  String evFuelCost = '';
  double genPrice = 0;
  double evPrice = 0;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final Color color = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;
    return Stack(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
              minWidth: MediaQuery.of(context).size.width),
          child: Image.asset(
            'assets/ev.png',
            fit: BoxFit.cover,
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.transparent,
          ),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.blue.shade100
                          : Colors.blue,
                      borderRadius: BorderRadius.circular(15)),
                  padding: const EdgeInsets.all(5),
                  child: const Text(
                    'Evaluate your ev',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'General Vehicle..',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: color,
                      shadows: const [
                        Shadow(color: Colors.red, blurRadius: 10),
                        Shadow(color: Colors.red, blurRadius: 10)
                      ]),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: width * 0.8,
                  height: 45,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) => setState(() {
                      genMileage = value.trim();
                    }),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      label: Text(
                        "Mileage",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: color,
                            shadows: const [
                              Shadow(color: Colors.deepOrange, blurRadius: 10),
                              Shadow(color: Colors.deepOrange, blurRadius: 10)
                            ]),
                      ),
                      hintText: "Mileage",
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      )),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 45,
                  width: width * 0.8,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) => setState(() {
                      genDistance = value.trim();
                    }),
                    decoration: InputDecoration(
                      label: Text(
                        "Distance per day",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: color,
                            shadows: const [
                              Shadow(color: Colors.deepOrange, blurRadius: 10),
                              Shadow(color: Colors.deepOrange, blurRadius: 10)
                            ]),
                      ),
                      hintText: "Distance per day",
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: width * 0.8,
                  height: 45,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) => setState(() {
                      genFuelCost = value.trim();
                    }),
                    decoration: InputDecoration(
                      label: Text(
                        "Fuel Cost",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: color,
                            shadows: const [
                              Shadow(color: Colors.deepOrange, blurRadius: 10),
                              Shadow(color: Colors.deepOrange, blurRadius: 10)
                            ]),
                      ),
                      hintText: "Fuel Cost",
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Electric Vehicle..',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                            color: Color.fromARGB(255, 43, 255, 50),
                            blurRadius: 10),
                        Shadow(
                            color: Color.fromARGB(255, 43, 255, 50),
                            blurRadius: 10)
                      ]),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: width * 0.8,
                  height: 45,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) => setState(() {
                      evMileage = value;
                    }),
                    decoration: const InputDecoration(
                      label: Text(
                        "Mileage",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                  color: Color.fromARGB(255, 43, 255, 50),
                                  blurRadius: 10),
                              Shadow(
                                  color: Color.fromARGB(255, 43, 255, 50),
                                  blurRadius: 10)
                            ]),
                      ),
                      hintText: "Daily travel / Energy used",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: Colors.white,
                        shadows: [
                          Shadow(color: Colors.pink, blurRadius: 10),
                          Shadow(color: Colors.pink, blurRadius: 10)
                        ],
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      )),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 45,
                  width: width * 0.8,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) => setState(() {
                      evDistance = value;
                    }),
                    decoration: const InputDecoration(
                      label: Text(
                        "Distance per day",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                  color: Color.fromARGB(255, 43, 255, 50),
                                  blurRadius: 10),
                              Shadow(
                                  color: Color.fromARGB(255, 43, 255, 50),
                                  blurRadius: 10)
                            ]),
                      ),
                      hintText: "Distance per day",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: width * 0.8,
                  height: 45,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) => setState(() {
                      evFuelCost = value;
                    }),
                    decoration: const InputDecoration(
                      label: Text(
                        "Fuel Cost",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                  color: Color.fromARGB(255, 43, 255, 50),
                                  blurRadius: 10),
                              Shadow(
                                  color: Color.fromARGB(255, 43, 255, 50),
                                  blurRadius: 10)
                            ]),
                      ),
                      hintText: "Fuel Cost",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (!(genFuelCost == '' ||
                        genFuelCost.contains(' ') ||
                        genDistance == '' ||
                        genDistance.contains(' ') ||
                        genMileage == '' ||
                        genMileage.contains(' ') ||
                        evFuelCost == '' ||
                        evFuelCost.contains(' ') ||
                        evDistance == '' ||
                        evDistance.contains(' ') ||
                        evMileage == '' ||
                        evMileage.contains(' '))) {
                      setState(() {
                        genPrice = evaluate(
                          double.parse(genMileage),
                          double.parse(genDistance),
                          double.parse(genFuelCost),
                        );
                        evPrice = evaluate(
                          double.parse(evMileage),
                          double.parse(evDistance),
                          double.parse(evFuelCost),
                        );
                      });
                      print('showing dialog');
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Colors.green.shade200,
                                Colors.green.shade400,
                                Colors.green,
                                Colors.green.shade400,
                                Colors.green.shade200
                              ]),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'You ${genPrice - evPrice < 0 ? 'spent more ' : 'saved'}:',
                                  style: const TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                          color: Colors.black, blurRadius: 5),
                                      Shadow(
                                          color: Colors.black, blurRadius: 5),
                                      Shadow(color: Colors.black, blurRadius: 5)
                                    ],
                                  ),
                                ),
                                Text(
                                  "₹ ${(genPrice - evPrice).toStringAsFixed(2)}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: genPrice - evPrice >= 0
                                        ? Colors.white
                                        : Colors.red.shade300,
                                    shadows: const [
                                      Shadow(
                                          color: Colors.black, blurRadius: 5),
                                      Shadow(
                                          color: Colors.black, blurRadius: 5),
                                      Shadow(color: Colors.black, blurRadius: 5)
                                    ],
                                  ),
                                ),
                                Text(
                                  genPrice - evPrice < 0 ? '😣' : '🥳',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    shadows: [
                                      Shadow(
                                          color: Colors.black, blurRadius: 5),
                                      Shadow(
                                          color: Colors.black, blurRadius: 5),
                                      Shadow(color: Colors.black, blurRadius: 5)
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Wrap(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          right: 10, bottom: 10),
                                      decoration: BoxDecoration(
                                          color: Colors.white54,
                                          borderRadius:
                                              BorderRadius.circular(17)),
                                      padding: const EdgeInsets.all(8),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Text(
                                            'General Vehicle: ',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              shadows: [
                                                Shadow(
                                                    color: Colors.black,
                                                    blurRadius: 5),
                                                Shadow(
                                                    color: Colors.black,
                                                    blurRadius: 5),
                                                Shadow(
                                                    color: Colors.black,
                                                    blurRadius: 5)
                                              ],
                                            ),
                                          ),
                                          Text(
                                            "₹${genPrice.toStringAsFixed(2)}",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              shadows: [
                                                Shadow(
                                                    color: Colors.black,
                                                    blurRadius: 5),
                                                Shadow(
                                                    color: Colors.black,
                                                    blurRadius: 5),
                                                Shadow(
                                                    color: Colors.black,
                                                    blurRadius: 5)
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white54,
                                          borderRadius:
                                              BorderRadius.circular(17)),
                                      padding: const EdgeInsets.all(8),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Text(
                                            'Electric Vehicle: ',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              shadows: [
                                                Shadow(
                                                    color: Colors.black,
                                                    blurRadius: 5),
                                                Shadow(
                                                    color: Colors.black,
                                                    blurRadius: 5),
                                                Shadow(
                                                    color: Colors.black,
                                                    blurRadius: 5)
                                              ],
                                            ),
                                          ),
                                          Text(
                                            "₹${evPrice.toStringAsFixed(2)}",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              shadows: [
                                                Shadow(
                                                    color: Colors.black,
                                                    blurRadius: 5),
                                                Shadow(
                                                    color: Colors.black,
                                                    blurRadius: 5),
                                                Shadow(
                                                    color: Colors.black,
                                                    blurRadius: 5)
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                    print('not showing dialog');
                  },
                  style: const ButtonStyle().copyWith(
                      backgroundColor: MaterialStatePropertyAll(
                          Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black),
                      foregroundColor: MaterialStatePropertyAll(
                          Theme.of(context).brightness == Brightness.dark
                              ? Colors.black
                              : Colors.white)),
                  child: const Text('Evaluate'),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  double evaluate(double mileage, double distance, double fuelCost) {
    return (distance / mileage) * fuelCost;
  }
}
