import 'package:flutter/material.dart';

class TermsConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions'),
        backgroundColor: Colors.yellowAccent.shade700,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Terms and Conditions',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              '1. Introduction',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Welcome to our app. These terms and conditions outline the rules and regulations for the use of our application.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              '2. User Agreement',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'By using this app, you accept these terms and conditions in full. Do not continue to use the app if you do not accept all of the terms and conditions stated on this page.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            // Add more sections as needed
            Text(
              '3. Privacy Policy',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Your privacy is important to us. Please review our privacy policy to understand how we collect, use, and share your information.',
              style: TextStyle(fontSize: 16),
            ),
            // Add more sections as needed
            SizedBox(height: 20),
            Text(
              '4. Governing Law',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'These terms and conditions are governed by and construed in accordance with the laws of Your Country and you irrevocably submit to the exclusive jurisdiction of the courts in that State or location.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
