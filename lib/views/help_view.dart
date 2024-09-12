import 'package:flutter/material.dart';

class FaqScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final double screenWidth = MediaQuery.of(context).size.width;
    final double textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FAQs',
          style: TextStyle(fontWeight: FontWeight.w500 ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24 * textScaleFactor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.confirmation_num_outlined, color: Colors.black, size: 20 * textScaleFactor),
                  SizedBox(width: 8 * textScaleFactor),
                  Text(
                    'Ticket',
                    style: TextStyle(fontSize: 16 * textScaleFactor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(screenWidth * 0.05),
        children: [
          ListTile(
            title: Text('Safety & Security', style: TextStyle(fontSize: 16 * textScaleFactor)),
            trailing: Icon(Icons.arrow_forward_ios, size: 16 * textScaleFactor),
            onTap: () {
              // Handle tap
            },
          ),
          Divider(),
          ListTile(
            title: Text('Billing/Ride Related Issues', style: TextStyle(fontSize: 16 * textScaleFactor)),
            trailing: Icon(Icons.arrow_forward_ios, size: 16 * textScaleFactor), // Responsive icon size
            onTap: () {
              // Handle tap
            },
          ),
          Divider(),
          ListTile(
            title: Text('Account & App', style: TextStyle(fontSize: 16 * textScaleFactor)), // Responsive text size
            trailing: Icon(Icons.arrow_forward_ios, size: 16 * textScaleFactor), // Responsive icon size
            onTap: () {
              // Handle tap
            },
          ),
          Divider(),
          ListTile(
            title: Text('Referrals', style: TextStyle(fontSize: 16 * textScaleFactor)), // Responsive text size
            trailing: Icon(Icons.arrow_forward_ios, size: 16 * textScaleFactor), // Responsive icon size
            onTap: () {
              // Handle tap
            },
          ),
          Divider(),
          ListTile(
            title: Text('Payment & Wallets', style: TextStyle(fontSize: 16 * textScaleFactor)),
            trailing: Icon(Icons.arrow_forward_ios, size: 16 * textScaleFactor),
            onTap: () {

            },
          ),
          Divider(),
          ListTile(
            title: Text('Power Pass', style: TextStyle(fontSize: 16 * textScaleFactor)),
            trailing: Icon(Icons.arrow_forward_ios, size: 16 * textScaleFactor),
            onTap: () {

            },
          ),
          Divider(),
          ListTile(
            title: Text('Other Issues', style: TextStyle(fontSize: 16 * textScaleFactor)),
            trailing: Icon(Icons.arrow_forward_ios, size: 16 * textScaleFactor),
            onTap: () {

            },
          ),
        ],
      ),
    );
  }
}