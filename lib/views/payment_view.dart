import 'package:flutter/material.dart';


class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String _selectedPaymentMethod = 'wallet'; // The default selected method

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Payments"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Wallets',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Container(
                height: height * 0.1,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.yellow.shade800),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio<String>(
                      value: 'wallet',
                      groupValue: _selectedPaymentMethod,
                      onChanged: (value) {
                        setState(() {
                          _selectedPaymentMethod = value!;
                        });
                      },
                    ),
                    Icon(Icons.account_balance_wallet_outlined),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Karki Wallet', style: TextStyle(fontSize: 18)),
                          Text('Low Balance: 0.0', style: TextStyle(color: Colors.red)),
                        ],
                      ),
                    ),
                    //Spacer(),
                    Padding(
                      padding:  EdgeInsets.only(left: width * 0.05),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.yellow.shade100,
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(Icons.add),
                            Text('Add Money'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.015),
              Text(
                'UPI',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: height * 0.09,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.yellow.shade800),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Radio<String>(
                      value: 'upi',
                      groupValue: _selectedPaymentMethod,
                      onChanged: (value) {
                        setState(() {
                          _selectedPaymentMethod = value!;
                        });
                      },
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: width * 0.015),
                      child: Icon(Icons.account_balance_wallet_outlined),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Select App', style: TextStyle(fontSize: 18)),
                          Text('Pay with any UPI app'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height  * 0.015),
              Text(
                'Pay Later',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                //height: 85,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.yellow.shade800),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 13),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Radio<String>(
                            value: 'payLater',
                            groupValue: _selectedPaymentMethod,
                            onChanged: (value) {
                              setState(() {
                                _selectedPaymentMethod = value!;
                              });
                            },
                          ),
                          Icon(Icons.account_balance_wallet_outlined),
                          SizedBox(width: width * 0.02),
                          Text('Pay at drop', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                      SizedBox(height: 5),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.yellow.shade50,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.star_border_purple500_rounded, color: Colors.yellow.shade800),
                            Text('Go cashless, after ride pay by scanning QR code'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * 0.015),
              Text(
                'Others',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.yellow.shade800),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 13),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Radio<String>(
                            value: 'cash',
                            groupValue: _selectedPaymentMethod,
                            onChanged: (value) {
                              setState(() {
                                _selectedPaymentMethod = value!;
                              });
                            },
                          ),
                          Icon(Icons.account_balance_wallet_outlined),
                          SizedBox(width: 10),
                          Text('Cash', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                      SizedBox(height: 5),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.yellow.shade50,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.star_border_purple500_rounded, color: Colors.yellow.shade800),
                            Text('You can pay via cash or UPI for your driver'),
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
      ),
    );
  }
}