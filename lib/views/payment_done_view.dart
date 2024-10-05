import 'package:flutter/material.dart';

class PaymentDone extends StatefulWidget {
  const PaymentDone({super.key});

  @override
  State<PaymentDone> createState() => _PaymentDoneState();
}

class _PaymentDoneState extends State<PaymentDone> {
  int? selectedAmount;
  final List<int> amounts = [10, 20, 30];
  double baseFare = 280.0;
  double totalFare = 280.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 80),
        child: Column(
          children: [
            //Image.asset('lib/assets/Auto.png'),
            Center(
              child: Text(
                'Your ride ended\n Successfully...!',
                style: TextStyle( color: Colors.green, fontSize: 35),
              ),
            ),
            SizedBox(height: 10),
            Text('Total Fare: ${totalFare.toStringAsFixed(1)}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            SizedBox(height: 10),
            Container(
              height: 175,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black),
                color: Colors.grey,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Text(
                      "Do you want to tip our driver?",
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
                                  color: isSelected ? Colors.black : Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                          selected: isSelected,
                          onSelected: (bool selected) {
                            setState(() {
                              selectedAmount = selected ? amount : null;
                              totalFare = baseFare + (selectedAmount ?? 0);
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
                          backgroundColor: Colors.yellow.shade600,
                        ),
                        onPressed: selectedAmount != null
                            ? () {
                          // Handle the 'Done' action here
                          // For example, you can show a message or navigate to another page
                        }
                            : null,
                        child: Text('Done'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.yellow.shade600,
              ),
              onPressed: () {
                _showPaidDialog();               },
              child: Text('Paid'),
            ),
          ],
        ),
      ),
    );
  }

  void _showPaidDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Payment Confirmation'),
          content: Text('Your payment of \$${totalFare.toStringAsFixed(1)} has been processed.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}






