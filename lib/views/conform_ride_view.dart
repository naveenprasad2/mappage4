
import 'package:flutter/material.dart';

class ConformView extends StatefulWidget {
  const ConformView({super.key});

  @override
  State<ConformView> createState() => _ConformViewState();
}

class _ConformViewState extends State<ConformView> {
  int? selectedAmount; // Store the selected amount

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final List<int> amounts = [10, 20, 30, 40];

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                //height: height * 0.55,
                height: height * 0.7,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Nunito",
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: "Vehicle No : ",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Nunito",
                                  ),
                                ),
                                TextSpan(text: "TN57Al5450"),
                              ],
                            ),
                          ),
                          RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Nunito",
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: "OTP : ",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Nunito",
                                  ),
                                ),
                                TextSpan(text: "5450"),
                              ],
                            ),
                          ),
                        ],
                      ),
                       SizedBox(height: height * 0.01),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: width * 0.015 ),
                        child: Row(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                'lib/assets/auto.jpg',
                                fit: BoxFit.cover,
                                width: 50,
                                height: 50,
                              ),
                            ),
                             SizedBox(width: width * 0.01),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Raja",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Nunito",
                                  ),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  "Languages know: English, Tamil",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF8C8C8C),
                                    fontFamily: "Nunito",
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "4.5",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF8C8C8C),
                                        fontFamily: "Nunito",
                                      ),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                       SizedBox(height: height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                            onPressed: () {},
                            child:  Text("Contact Info",style: TextStyle(color: Colors.yellow.shade600),),
                          ),
                          RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Nunito",
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: "Total Fair : ",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Nunito",
                                  ),
                                ),
                                TextSpan(text: "280.0"),
                              ],
                            ),
                          ),
                        ],
                      ),
                       SizedBox(height: height * 0.02),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Ride Details",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Nunito",
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      Container(
                        //height: height * 0.28,
                        height: height * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25),),
                          color: Colors.grey,
                          border: Border.all(color: Colors.black, width: 2),
                        ),

                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              RichText(
                                text: const TextSpan(
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Nunito",
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "Ride Booked at : ",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Nunito",
                                      ),
                                    ),
                                    TextSpan(text: "02:10 PM"),
                                  ],
                                ),
                              ),
                              Divider(thickness: 2,),
                              RichText(
                                text: const TextSpan(
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Nunito",
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "Estimated time : ",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Nunito",
                                      ),
                                    ),
                                    TextSpan(text: "03:15 PM"),
                                  ],
                                ),
                              ),
                              Divider(color: Colors.grey),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: RichText(
                                  text: const TextSpan(
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Nunito",
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: "Driver will be reached within ",

                                      ),
                                      TextSpan(text: "5 Minutes",style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Nunito",
                                      ),),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(color: Colors.grey),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Do you want to tip our driver ?",style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Nunito",
                                ),),
                              ),
                              Divider(color: Colors.grey),

/* Wrap(
                                spacing: 10,
                                children: amounts.map((amount) {
                                  return ChoiceChip(
                                    label: Text("$amount Rs"),
                                    selected: selectedAmount == amount,
                                    onSelected: (bool selected) {
                                      setState(() {
                                        // Always set selectedAmount to the clicked amount
                                        selectedAmount = amount;
                                      });
                                    },
                                    selectedColor: Colors.yellow.shade600,
                                    backgroundColor: Colors.grey[200], // Background when not selected
                                  );
                                }).toList(),
                              )*/

                              Wrap(
                                spacing: 5,
                                children: amounts.map((amount) {
                                  bool isSelected = selectedAmount == amount;
                                  return ChoiceChip(
                                    label: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        if (isSelected)
                                        /*Icon(
                                            Icons.check,
                                            color: Colors.black,
                                            size: 16,
                                          ),*/
                                          SizedBox(width: 5),
                                        Text(
                                          "$amount Rs",
                                          style: TextStyle(
                                            color: isSelected
                                                ? Colors.black
                                                : Colors.grey.shade600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    selected: isSelected,
                                    onSelected: (bool selected) {
                                      setState(() {
                                        selectedAmount =
                                        selected ? amount : null;
                                      });
                                    },
                                    selectedColor: Colors.yellow.shade600,
                                    backgroundColor: Colors.grey[300],
                                  );
                                }).toList(),
                              ),

                            ],
                          ),
                        ),
                      ),

/* Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.circle,
                                      color: Colors.green,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 8),
                                    Container(
                                      height: height * 0.035,
                                      width: width * 0.75,
                                      child: const Text("Kodambakam"),
                                    ),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 30),
                                  child: Divider(color: Colors.grey),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.circle,
                                      color: Colors.red,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 8),
                                    Container(
                                      height: height * 0.035,
                                      width: width * 0.75,
                                      child: const Text("Tambaram"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),*/

                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


