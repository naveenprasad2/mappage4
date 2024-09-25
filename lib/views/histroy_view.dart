import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final List<Map<String, dynamic>> bookingHistory = [
    {
      'date': '02-09-2024 15:50:57',
      'price': '123',
      'icon1': Icons.location_on_outlined,
      'Text1': 'Tambaram (தாம்பரம்), East Tambaram Railway Station Road, West Tambaram, Tambaram, East Tambaram, Tambaram, Chennai, Tamil Nadu 600045, India \nIndia\nIN\nTamil Nadu',
      'icon2': Icons.location_on,
      'Text2': 'V3RJ+GC2, Vandalur, Tamil Nadu 600048, India600048',
      'status': 'Booked',
    },
    {
      'date': '02-09-2024 15:50:56',
      'price': '123',
      'icon1': Icons.location_on_outlined,
      'Text1': 'Tambaram (தாம்பரம்), East Tambaram Railway Station Road, West Tambaram, Tambaram, East Tambaram, Tambaram, Chennai, Tamil Nadu 600045, India \nIndia\nIN\nTamil Nadu',
      'icon2': Icons.location_on,
      'Text2': 'V3RJ+GC2, Vandalur, Tamil Nadu 600048, India600048',
      'status': 'Booked',
    },
    {
      'date': '02-09-2024 15:50:54',
      'price': '123',
      'icon1': Icons.location_on_outlined,
      'Text1': 'Tambaram (தாம்பரம்), East Tambaram Railway Station Road, West Tambaram, Tambaram, East Tambaram, Tambaram, Chennai, Tamil Nadu 600045, India \nIndia\nIN\nTamil Nadu',
      'icon2': Icons.location_on,
      'Text2': 'V3RJ+GC2, Vandalur, Tamil Nadu 600048, India600048',
      'status': 'Booked',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent.shade700,
        title: Text('History',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        //toolbarHeight: 20.0,
      ),
      body: Column(
        children: [
          // Container(
          //   padding: EdgeInsets.all(8.0),
          //   height: 40,
          //   width: 130,
          //   decoration: BoxDecoration(
          //     color: Colors.yellowAccent.shade700,
          //     borderRadius: BorderRadius.only(
          //       bottomLeft: Radius.circular(15),
          //       bottomRight: Radius.circular(15),
          //     ),
          //   ),
          //   child: Text(
          //     'History',
          //     style: TextStyle(
          //       color: Colors.white,
          //       fontSize: 18,
          //       fontWeight: FontWeight.bold,
          //     ),
          //     textAlign: TextAlign.center,
          //   ),
          // ),
          SizedBox(height: height * 0.01),
          Expanded(
            child: ListView.builder(
              itemCount: bookingHistory.length,
              itemBuilder: (context, index) {
                final booking = bookingHistory[index];
                return Padding(
                  padding:  EdgeInsets.symmetric(horizontal: width * 0.03,vertical: height * 0.015),
                  child: Stack(
                    children: [
                      Container(
                        height: height * 0.35,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                              offset: Offset(8,6),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(right: width * 0.45, top: height * 0.01),
                                child: Text(
                                  booking['date'] ?? '',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15
                                  ),
                                ),
                              ),
                              SizedBox(height: height * 0.008),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(booking['icon1'],
                                      color: Colors.yellowAccent.shade700),
                                  SizedBox(width: 5),
                                  Flexible(
                                    child: Text(
                                      booking['Text1'] ?? '',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: height * 0.005),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(booking['icon2'],
                                      color: Colors.yellowAccent.shade700),
                                  SizedBox(width: 5),
                                  Flexible(
                                    child: Text(
                                      booking['Text2'] ?? '',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: height * 0.005),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 13.0),
                                  child: Text(
                                    'Status: ${booking['status']}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 12,
                        right: 28,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            'Price: ₹${booking['price']}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}