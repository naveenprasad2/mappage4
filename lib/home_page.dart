import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'mappage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          MapPage(),
          // Container(
          //   height: height,
          //   width: width,
          //   decoration: const BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage("assets/map.jpg"),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          Positioned(
            top: 60,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: Colors.yellow[600],
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            right: 20,
            top: 60,
            child: Container(
              height: 50,
              width: 330,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const Text(
                    //   'Pickup location',
                    //   style: TextStyle(
                    //     color: Colors.grey,
                    //     fontSize: 13,
                    //     fontWeight: FontWeight.w600,
                    //   ),
                    // ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Pickup Location',
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        isDense: true,
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 1,
            child: Container(
              height: 180,
              width: width,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
                color: Colors.yellow[600]?.withOpacity(0.8),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 370,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Search Drop Location',
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                        height: 50,
                        width: 370,
                        child: ElevatedButton(
                            onPressed: () {}, child: Text('Book Ride')))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
