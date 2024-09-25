// import 'package:flutter/material.dart';
//
// class SearchPage extends StatefulWidget {
//   @override
//   _SearchPageState createState() => _SearchPageState();
// }
//
// class _SearchPageState extends State<SearchPage> {
//   TextEditingController currentLocationController = TextEditingController();
//   TextEditingController dropLocationController = TextEditingController();
//
//   String value = 'For me';
//   String groupValue = 'For me';
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
//         title: Text("Drop"),
//         actions: [
//           ElevatedButton(
//             onPressed: () {
//               showModalBottomSheet(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return Container(
//                     padding: EdgeInsets.all(16.0),
//                     height: 200,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Expanded(
//                               child: ListTile(
//                                 title: Text('For me'),
//                                 onTap: () {
//                                   setState(() {
//                                     value = 'For me';
//                                     groupValue = 'For me';
//                                   });
//                                   Navigator.pop(context);
//                                 },
//                               ),
//                             ),
//                             Align(
//                               alignment: Alignment.centerRight,
//                               child: Radio<String>(
//                                 value: 'For me',
//                                 groupValue: groupValue,
//                                 onChanged: (value) {
//                                   setState(() {
//                                     this.value = value!;
//                                     groupValue = value!;
//                                   });
//                                   Navigator.pop(context);
//                                 },
//                               ),
//                             ),
//                           ],
//                         ),
//                         Divider(),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Expanded(
//                               child: ListTile(
//                                 title: Text('Others'),
//                                 onTap: () {
//                                   setState(() {
//                                     value = 'Others';
//                                     groupValue = 'Others';
//                                   });
//                                   Navigator.pop(context);
//                                 },
//                               ),
//                             ),
//                             Align(
//                               alignment: Alignment.centerRight,
//                               child: Radio<String>(
//                                 value: 'Others',
//                                 groupValue: groupValue,
//                                 onChanged: (value) {
//                                   setState(() {
//                                     this.value = value!;
//                                     groupValue = value!;
//                                   });
//                                   Navigator.pop(context);
//                                 },
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),);
//                 },
//               );
//             },
//             child: Text(value),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey.shade400),
//                   color: Colors.grey.shade200,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.circle,
//                             color: Colors.green,
//                             size: 20,
//                           ),
//                           SizedBox(width: 8),
//                           Expanded(
//                             child: TextFormField(
//                               controller: currentLocationController,
//                               decoration: InputDecoration(
//                                 hintText: "PickUp location",
//                                 border: InputBorder.none,
//                               ),
//                             ),
//                             // child: Autocomplete<String>(
//                             //   optionsBuilder: (TextEditingValue textEditingValue) {
//                             //     if (textEditingValue.text.isEmpty) {
//                             //       return const Iterable<String>.empty();
//                             //     }
//                             //     return tamilNaduPlaces.where((String place) {
//                             //       return place.toLowerCase().contains(
//                             //           textEditingValue.text.toLowerCase());
//                             //     });
//                             //   },
//                             //   onSelected: (String selection) {
//                             //     currentLocationController.text = selection;
//                             //   },
//                             //   fieldViewBuilder: (BuildContext context,
//                             //       TextEditingController fieldTextEditingController,
//                             //       FocusNode fieldFocusNode,
//                             //       VoidCallback onFieldSubmitted) {
//                             //     currentLocationController = fieldTextEditingController;
//                             //     return TextFormField(
//                             //       controller: currentLocationController,
//                             //       focusNode: fieldFocusNode,
//                             //       decoration: InputDecoration(
//                             //         hintText: "Your Current Location",
//                             //         border: InputBorder.none,
//                             //       ),
//                             //     );
//                             //   },
//                             // ),
//                           ),
//                         ],
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 30),
//                         child: Divider(
//                           color: Colors.grey.shade400,
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.circle,
//                             color: Colors.red,
//                             size: 20,
//                           ),
//                           SizedBox(width: 8),
//                           Expanded(
//                             child: TextFormField(
//                               controller: dropLocationController,
//                               decoration: InputDecoration(
//                                 hintText: "Drop location",
//                                 border: InputBorder.none,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:mappage4/views/select_ride_view.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<String> tamilNaduPlaces = [
    'Nerkunram',
    'Porur',
    'Anna Nagar',
    'Vadapalani',
    'Valasarvakkam',
    'Meenambakam',
    'Pallavaram',
    'Chrompet',
    'Tambaram',
    'Kodambakkam',
    'Guindy',
    'st.thomas mount'
  ];
  TextEditingController currentLocationController = TextEditingController();
  TextEditingController dropLocationController = TextEditingController();

  String value = 'For me';
  late String selectedPlace;
  String groupValue = 'For me';

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();

    currentLocationController.addListener(_checkIfFieldsAreFilled);
    dropLocationController.addListener(_checkIfFieldsAreFilled);
  }

  bool _checkIfFieldsAreFilled() {
    setState(() {
      isButtonEnabled = currentLocationController.text.isNotEmpty &&
          dropLocationController.text.isNotEmpty;
    });return isButtonEnabled;
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
        title: Text("Drop"),
        actions: [
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    padding: EdgeInsets.all(16.0),
                    height: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Booking Ride for',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ListTile(
                                title: Text('For me'),
                                onTap: () {
                                  setState(() {
                                    value = 'For me';
                                    groupValue = 'For me';
                                  });
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Radio<String>(
                                value: 'For me',
                                groupValue: groupValue,
                                onChanged: (value) {
                                  setState(() {
                                    this.value = value!;
                                    groupValue = value!;
                                  });
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ListTile(
                                title: Text('Others'),
                                onTap: () {
                                  setState(() {
                                    value = 'Others';
                                    groupValue = 'Others';
                                  });
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Radio<String>(
                                value: 'Others',
                                groupValue: groupValue,
                                onChanged: (value) {
                                  setState(() {
                                    this.value = value!;
                                    groupValue = value!;
                                  });
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),);
                },
              );
            },
            style: ElevatedButton.styleFrom(foregroundColor: Colors.black,side: BorderSide(color: Colors.grey.shade300)),
            child: Text(value),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: width * 0.02),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: Colors.green,
                            size: 20,
                          ),
                          SizedBox(width: width * 0.03),
                          SizedBox(
                            height: height * 0.04,
                            width: width * 0.8,
                            child: Autocomplete<String>(
                              optionsBuilder: (TextEditingValue textEditingValue) {
                                if (textEditingValue.text.isEmpty) {
                                  return const Iterable<String>.empty();
                                }
                                return tamilNaduPlaces.where((String place) {
                                  return place.toLowerCase().contains(textEditingValue.text.toLowerCase());
                                });
                              },
                              onSelected: (String selectedplace) {
                                setState(() {
                                  selectedPlace = selectedplace;
                                });
                              },
                              fieldViewBuilder: (BuildContext context,
                                  TextEditingController fieldController,
                                  FocusNode focusNode,
                                  VoidCallback onFieldSubmitted) {
                                return TextFormField(
                                  controller: fieldController,
                                  focusNode: focusNode,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    hintText: "Pickup location",
                                    border: InputBorder.none,
                                  ),
                                  onChanged: (value) {
                                    _checkIfFieldsAreFilled();
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Divider(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: Colors.red,
                            size: 20,
                          ),
                          SizedBox(width: width * 0.03),
                          SizedBox(
                            height: height * 0.04,
                            width: width * 0.8,
                            child: Autocomplete<String>(
                              optionsBuilder: (TextEditingValue textEditingValue) {
                                if (textEditingValue.text.isEmpty) {
                                  return const Iterable<String>.empty();
                                }
                                return tamilNaduPlaces.where((String place) {
                                  return place.toLowerCase().contains(textEditingValue.text.toLowerCase());
                                });
                              },
                              onSelected: (String selectedplace) {
                                setState(() {
                                  selectedPlace = selectedplace;
                                });
                              },
                              fieldViewBuilder: (BuildContext context,
                                  TextEditingController fieldController,
                                  FocusNode focusNode,
                                  VoidCallback onFieldSubmitted) {
                                return TextFormField(
                                  controller: fieldController,
                                  focusNode: focusNode,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    hintText: "Drop location",
                                    border: InputBorder.none,
                                  ),
                                  onChanged: (value) {
                                    _checkIfFieldsAreFilled();
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Padding(
            //     padding: const EdgeInsets.all(16.0),
            //     child: ElevatedButton(
            //       onPressed: _checkIfFieldsAreFilled() ? () {} : null, // Disable button if not enabled
            //       style: ElevatedButton.styleFrom(
            //         backgroundColor: _checkIfFieldsAreFilled() ? Colors.yellow : Colors.grey,
            //         minimumSize: Size(width, 50), // Full-width button
            //       ),
            //       child: Text('Done'),
            //     ),
            //   ),
            // ),
            SizedBox(height: 10,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow.shade600,foregroundColor: Colors.black,
                minimumSize: Size(250,50)
              ),
                onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => RideBookingPage()));
                }, child: Text('Done'))
      ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    currentLocationController.dispose();
    dropLocationController.dispose();
    super.dispose();
  }
}
