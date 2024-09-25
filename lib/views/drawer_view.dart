// import 'package:flutter/material.dart';
// import 'package:mappage4/views/profile_view.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'login_view.dart';
//
// class MenuPage extends StatefulWidget {
//   const MenuPage({super.key});
//
//   @override
//   State<MenuPage> createState() => _MenuPageState();
// }
//
// class _MenuPageState extends State<MenuPage> {
//   final String customerCareNumber = "tel:+1234567890";
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     return Drawer(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
//         backgroundColor: Colors.yellow[600],
//         child: ListView(
//           children: <Widget>[
//             Center(
//               child: Text(
//                 'Priya',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             Center(
//               child: Text(
//                 '1234567890',
//                 style: TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),
//             ListTile(
//               leading: Icon(Icons.account_circle, color: Colors.white),
//               title: Text('Profile', style: TextStyle(color: Colors.white)),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.history, color: Colors.white),
//               title: Text('History', style: TextStyle(color: Colors.white)),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.headset_mic_outlined, color: Colors.white),
//               title: Text('Customer Care', style: TextStyle(color: Colors.white)),
//               onTap: () {
//                 _launchCaller();
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.exit_to_app_sharp, color: Colors.white),
//               title: Text('Logout', style: TextStyle(color: Colors.white)),
//               onTap: () {
//                 Navigator.pop(context); // Close the drawer first
//
//                 Future.delayed(Duration(milliseconds: 300), () {
//                   // Slight delay to ensure drawer is completely closed before showing the dialog
//                   showDialog(
//                     context: context,
//                     builder: (context) => AlertDialog(
//                       backgroundColor: Colors.yellow[700],
//                       content: Container(
//                         height: 80,
//                         decoration: BoxDecoration(shape: BoxShape.rectangle),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               'Are you sure you want to Logout?',
//                               style: TextStyle(color: Colors.black),
//                             ),
//                             SizedBox(height: 10),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 TextButton(
//                                   onPressed: () {
//                                     Navigator.pop(context); // Close the dialog
//                                   },
//                                   child: Text('NO', style: TextStyle(color: Colors.black)),
//                                 ),
//                                 TextButton(
//                                   onPressed: () {
//                                     Navigator.pop(context); // Close the dialog
//                                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
//                                   },
//                                   child: Text('YES', style: TextStyle(color: Colors.black)),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 });
//               },
//             ),
//           ],
//         ),
//       );
//   }
//
//   void _launchCaller() async {
//     final Uri url = Uri.parse(customerCareNumber);
//     if (await canLaunchUrl(url)) {
//       await launchUrl(url);
//     } else {
//       throw 'Could not launch $customerCareNumber';
//     }
//   }
//
// }

import 'package:flutter/material.dart';
import 'package:mappage4/views/histroy_view.dart';
import 'package:mappage4/views/payment_view.dart';
import 'package:mappage4/views/profile_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'login_view.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final String customerCareNumber = "tel:+1234567890";
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Drawer(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: height * 0.23,
            color: Colors.yellow.shade600,
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: height * 0.075),
              child: Column(
                  children:[
                    Text(
                      'Priya',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '1234567890',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ]
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: <Widget>[
                  // Center(
                  //   child: Text(
                  //     '1234567890',
                  //     style: TextStyle(
                  //       fontSize: 15,
                  //       fontWeight: FontWeight.bold,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                  //SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.yellow.shade700)
                    ),
                    child: ListTile(
                      leading: Icon(Icons.account_circle,),
                      title: Text('Profile',),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                      },
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: height * 0.015),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.yellow.shade700)
                      ),
                      child: ListTile(
                        leading: Icon(Icons.history,),
                        title: Text('History',),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HistoryScreen()));
                        },
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.yellow.shade700)
                    ),
                    child: ListTile(
                      leading: Icon(Icons.currency_rupee,),
                      title: Text('Payment',),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentPage()));
                      },
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: height * 0.015),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.yellow.shade700)
                      ),
                      child: ListTile(
                        leading: Icon(Icons.headset_mic_outlined,),
                        title: Text('Customer Care',),
                        onTap: () {
                          _launchCaller();
                        },
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.yellow.shade700)
                    ),
                    child: ListTile(
                      leading: Icon(Icons.exit_to_app_sharp,),
                      title: Text('Logout',),
                      onTap: () {
                        Navigator.pop(context); // Close the drawer first

                        Future.delayed(Duration(milliseconds: 300), () {
                          // Slight delay to ensure drawer is completely closed before showing the dialog
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              backgroundColor: Colors.yellow[600],
                              content: Container(
                                height: height * 0.15,
                                decoration: BoxDecoration(shape: BoxShape.rectangle),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Are you sure you want to Logout?',
                                      style: TextStyle(color: Colors.black,fontSize: 18),
                                    ),
                                    //SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context); // Close the dialog
                                          },
                                          child: Text('NO', style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold)),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context); // Close the dialog
                                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                                          },
                                          child: Text('YES', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                      },
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

  void _launchCaller() async {
    final Uri url = Uri.parse(customerCareNumber);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $customerCareNumber';
    }
  }

}
