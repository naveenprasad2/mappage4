import 'package:flutter/material.dart';
import 'package:mappage4/mappage.dart';

class CancelReason extends StatefulWidget {
  const CancelReason({super.key});

  @override
  State<CancelReason> createState() => _CancelReasonState();
}

class _CancelReasonState extends State<CancelReason> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/assets/map.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: height * 0.65, // 60% of the screen height
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Why do you want to cancel?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Please provide the reason for cancellation',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        _buildRadioOption('Selected Wrong Pickup Location'),
                        _buildRadioOption('Selected Wrong Drop Location'),
                        _buildRadioOption('Booked By Mistake'),
                        _buildRadioOption('Selected Difference Service/Vehicle'),
                        _buildRadioOption('Taking Too Long To Confirm The Ride'),
                        _buildRadioOption('Got a Ride Elsewhere'),
                        _buildRadioOption('Others'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow[600],
                    ),

                    onPressed: () {
                      _showPopupMessage(context);
                    },
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  void _showPopupMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.yellow[600],
          title: Text('Cancellation',style: TextStyle(fontWeight: FontWeight.bold),),
          content: Text('Your Cancellation Request Successfully Confirmed!',style: TextStyle(fontWeight: FontWeight.w600),),
          actions: [
            TextButton(
              child: Text('Close',style: TextStyle(color: Colors.red),),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MapPage()));
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildRadioOption(String title) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 0.002),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
      leading: Radio<String>(
        value: title,
        groupValue: _selectedOption,
        fillColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            return states.contains(MaterialState.selected)
                ? Colors.yellow.shade700
                : Colors.black;
          },
        ),
        activeColor: Colors.black,
        onChanged: (String? value) {
          setState(() {
            _selectedOption = value;
          });
        },
      ),
    );
  }
}
