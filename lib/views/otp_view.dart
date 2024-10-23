/*
import 'package:flutter/material.dart';

import '../mappage.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final _otpControllers = List.generate(4, (_) => TextEditingController());

  @override
  void initState() {
    super.initState();
    _otpControllers.asMap().forEach((index, controller) {
      controller.addListener(() => _onOtpChanged(controller, index));
    });
  }

  void _onOtpChanged(TextEditingController controller, int index) {
    if (controller.text.length == 1) {
      if (index < 3) {
        FocusScope.of(context).nextFocus();
      }
    } else if (controller.text.isEmpty && index > 0) {
      FocusScope.of(context).previousFocus();
    }
  }

  @override
  void dispose() {
    _otpControllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  void _submitOtp() {
    final otp = _otpControllers.map((controller) => controller.text).join();
    if (otp.length == 4) {
      print('OTP entered: $otp');

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MapPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a valid 4-digit OTP.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(250.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(60),
            bottomRight: Radius.circular(60),
          ),
          child: AppBar(automaticallyImplyLeading: false,
              centerTitle: true,
              backgroundColor: Colors.yellow[600],
              toolbarHeight: 260.0,
              flexibleSpace: Stack(children: [
                Positioned(
                  top: height * 0.15,
                  left: width * 0.3,
                  child: Text(
                    "Verification!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.2,
                  left: width * 0.1,
                  child: Text(
                    "Please enter the 4-digit code sent to you at",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.22,
                  left: width * 0.35,
                  child: Text(
                    "+911234567890",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ),
                *//*

*/
/*Positioned(
                  top: 30,
                  left: 50,
                  child: Container(
                    height: 200,
                    width: 260,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/assets/dot.jpg'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Colors.blue.withOpacity(0.04),
                          BlendMode.dstATop,
                        ),
                      ),
                    ),
                  ),
                ),*//*
*/
/*

              ])),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:  EdgeInsets.only(top: height * 0.1, bottom: height * 0.15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _otpControllers.map((controller) {
                  return SizedBox(
                    width: width * 0.15,
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: height * 0.01),
                        isDense: true,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.yellow[600]!,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.yellow[600]!,
                            width: 3.0,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        if (value.length > 1) {
                          controller.text = value[0];
                        }
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              width: width * 0.6,
              height: height * 0.05,
              child: ElevatedButton(
                onPressed: _submitOtp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[600],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*//*





import 'dart:math';
import 'package:flutter/material.dart';
import '../mappage.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final _otpControllers = List.generate(6, (_) => TextEditingController());
  late String _generatedOtp;

  @override
  void initState() {
    super.initState();
    _generateOtp(); // Generate OTP when page loads
    _otpControllers.asMap().forEach((index, controller) {
      controller.addListener(() => _onOtpChanged(controller, index));
    });
  }

  void _generateOtp() {
    // Generate a 6-digit random OTP
    var rng = Random();
    _generatedOtp = List.generate(6, (_) => rng.nextInt(10).toString()).join();

    // Use addPostFrameCallback to show SnackBar after the build is completed
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Generated OTP: $_generatedOtp'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 10),
        ),
      );
    });
  }

  void _onOtpChanged(TextEditingController controller, int index) {
    if (controller.text.length == 1) {
      if (index < 5) {
        FocusScope.of(context).nextFocus();
      }
    } else if (controller.text.isEmpty && index > 0) {
      FocusScope.of(context).previousFocus();
    }
  }

  @override
  void dispose() {
    _otpControllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  void _submitOtp() {
    final enteredOtp = _otpControllers.map((controller) => controller.text).join();
    if (enteredOtp == _generatedOtp) {
      print('OTP entered: $enteredOtp');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MapPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Incorrect OTP. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(250.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(60),
            bottomRight: Radius.circular(60),
          ),
          child: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              backgroundColor: Colors.yellow[600],
              toolbarHeight: 260.0,
              flexibleSpace: Stack(children: [
                Positioned(
                  top: height * 0.15,
                  left: width * 0.3,
                  child: Text(
                    "Verification!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.2,
                  left: width * 0.1,
                  child: Text(
                    "Please enter the 6-digit code sent to you at",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.22,
                  left: width * 0.35,
                  child: Text(
                    "+911234567890",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ),
              ])),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: height * 0.1, bottom: height * 0.15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _otpControllers.map((controller) {
                  return SizedBox(
                    width: width * 0.1,
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: height * 0.01),
                        isDense: true,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.yellow[600]!,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.yellow[600]!,
                            width: 3.0,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        if (value.length > 1) {
                          controller.text = value[0];
                        }
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              width: width * 0.6,
              height: height * 0.05,
              child: ElevatedButton(
                onPressed: _submitOtp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[600],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
import 'dart:math';
import 'package:flutter/material.dart';

import '../mappage.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final _otpControllers = List.generate(6, (_) => TextEditingController());
  final _focusNodes = List.generate(6, (_) => FocusNode());
  late String _generatedOtp;

  @override
  void initState() {
    super.initState();
    _generateOtp();
  }

  void _generateOtp() {
    var rng = Random();
    _generatedOtp = List.generate(6, (_) => rng.nextInt(10).toString()).join();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Generated OTP: $_generatedOtp'),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 10),
        ),
      );
    });
  }

  void _onOtpChanged(String value, int index) {
    if (value.length == 1 && index < 5) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    }
  }

  @override
  void dispose() {
    _otpControllers.forEach((controller) => controller.dispose());
    _focusNodes.forEach((node) => node.dispose());
    super.dispose();
  }

  void _submitOtp() {
    final enteredOtp = _otpControllers.map((controller) => controller.text).join();
    if (enteredOtp == _generatedOtp) {
      print('OTP entered: $enteredOtp');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MapPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Incorrect OTP. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(250.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(60),
            bottomRight: Radius.circular(60),
          ),
          child: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: Colors.yellow[600],
            toolbarHeight: 260.0,
            flexibleSpace: Stack(
              children: [
                Positioned(
                  top: height * 0.15,
                  left: width * 0.3,
                  child: const Text(
                    "Verification!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.2,
                  left: width * 0.1,
                  child: const Text(
                    "Please enter the 6-digit code sent to you at",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.22,
                  left: width * 0.35,
                  child: const Text(
                    "+911234567890",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: height * 0.1, bottom: height * 0.15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _otpControllers.asMap().entries.map((entry) {
                  int index = entry.key;
                  TextEditingController controller = entry.value;
                  return SizedBox(
                    width: width * 0.1,
                    child: TextField(
                      controller: controller,
                      focusNode: _focusNodes[index],
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: height * 0.01),
                        isDense: true,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.yellow[600]!,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.yellow[600]!,
                            width: 3.0,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      onChanged: (value) => _onOtpChanged(value, index),
                      maxLength: 1, // Restrict input to a single digit
                      buildCounter: (_, {required currentLength, maxLength, required isFocused}) => null,
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              width: width * 0.6,
              height: height * 0.05,
              child: ElevatedButton(
                onPressed: _submitOtp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[600],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],

        ),
      ),
    );
  }
}

/*void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OTP Input',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const Otp(),
      debugShowCheckedModeBanner: false,
    );
  }*/
//}