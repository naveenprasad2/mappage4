import 'package:flutter/material.dart';
import 'package:mappage4/views/payment_done_view.dart';

class OtpConformationPage extends StatefulWidget {
  const OtpConformationPage({super.key});

  @override
  State<OtpConformationPage> createState() => _OtpConformationPageState();
}

class _OtpConformationPageState extends State<OtpConformationPage> {
  int? selectedAmount;
  final List<int> amounts = [10, 20, 30];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
            Container(
              height: height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/assets/location.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 130,
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50)),
                    color: Colors.white),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.black)),
                          child: IconButton(
                              onPressed: () {}, icon: Icon(Icons.arrow_back))),
                      Column(
                        children: [
                          Text(
                            '35 min',
                            style: TextStyle(color: Colors.green, fontSize: 30),
                          ),
                          Text(
                            '23km',
                            style: TextStyle(
                                color: Colors.grey.shade700, fontSize: 25),
                          )
                        ],
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.black)),
                          child: IconButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentDone()));
                                //showAlertDialog(context);
                              },
                              icon: Icon(Icons.check))),
                    ],
                  ),
                ),
              ),
            )
          ]),
        ],
      ),
    );
  }

 /* void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.yellow.shade700, width: 3),
              // Border color and width
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Your ride ended Sucessfully...!',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text('Total Fair : 280.0'),
                  SizedBox(height: 10),
                  Container(
                    height: 175,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black),
                        color: Colors.grey),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Text(
                            "Do you want to tip our driver ?",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Nunito",
                            ),
                          ),
                          Divider(color: Colors.grey),
                          Wrap(
                           spacing: 5,
                            children: amounts.map((amount) {
                              bool isSelected = selectedAmount == amount;
                              return ChoiceChip(
                                label: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (isSelected) SizedBox(width: 5),
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
                                    selectedAmount = selected ? amount : null;
                                  });
                                },
                                selectedColor: Colors.yellow.shade600,
                                backgroundColor: Colors.grey[300],
                              );
                            }).toList(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, right: 20),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    backgroundColor: Colors.yellow.shade600),
                                onPressed: selectedAmount != null
                                    ? () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    OtpConformationPage()));
                                      }
                                    : null,
                                child: Text('Done')),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Skip'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }*/
}
