import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';

import 'custom_profileimage.dart';



class CustomProfile extends StatelessWidget {
  final String text1;
  final String? imageBase64;
  final IconData icon2;
  final String text2;
  final VoidCallback onIconTap;

  const CustomProfile({
    super.key,
    required this.text1,
    required this.imageBase64,
    required this.icon2,
    required this.text2,
    required this.onIconTap,
  });

  Uint8List? _decodeBase64Image(String? base64String) {
    if (base64String != null && base64String.isNotEmpty) {
      try {
        final bytes = base64Decode(base64String.split(',').last);
        return Uint8List.fromList(bytes);
      } catch (e) {
        print('Error decoding base64 image: $e');
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final imageBytes = _decodeBase64Image(imageBase64);

    return Stack(
      children: [
        Container(
          height: height * 0.36,
          width: width,
          decoration:  BoxDecoration(color: Colors.yellow.shade600,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 40, 25, 60),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back),),
                    Padding(
                      padding:  EdgeInsets.only(right: width * 0.35),
                      child: Text(
                        text1,
                        style: const TextStyle(
                          fontSize: 20,
                          //fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: "Nunito",

                        ),
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow[600],
                        ),
                        onPressed: (){

                        },
                        child:Row(children: [
                      Icon(Icons.help_outline,color: Colors.black,),
                      Text('Help',style: TextStyle(color: Colors.black),)
                    ],) )
                  ],
                ),
                Padding(
                  padding:  EdgeInsets.only(top: height * 0.005),
                  child: ProfileImage(
                    imageBytes: imageBytes,
                    onEdit: onIconTap,
                  ),
                ),
                Spacer(),
                Text(
                  text2,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500,fontFamily: "Nunito",
                  ),
                ),

              ],
            ),
          ),
        ),
      ],
    );
  }
}
