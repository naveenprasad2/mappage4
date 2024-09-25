import 'package:flutter/material.dart';
import 'package:mappage4/views/terms_conditions.dart';
import 'login_view.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        title: Text('Sign Up',style: TextStyle(fontWeight: FontWeight.bold),),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)),
        centerTitle: true,
        backgroundColor: Colors.yellow[600],
      ),
      /*PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.elliptical(200, 60),
            bottomRight: Radius.circular(60),
          ),
          child: AppBar(
            backgroundColor: Colors.yellow.shade700,
            centerTitle: true,
            toolbarHeight: 100.0,
            title: Text('Sign Up',
              style: TextStyle(fontWeight: FontWeight.w500),),
          ),
        ),
      ),*/
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: height * 0.03,horizontal: width * 0.02),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              //SizedBox(height: 10),
              Container(
                width: width * 0.9,
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.yellow.shade600,),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: height * 0.02),
              Container(
                width: width * 0.9,
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.yellow.shade600,),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                        .hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: height * 0.02),
              Container(
                width: width * 0.9,
                child: TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.yellow.shade600,),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                      return 'Please enter a valid phone number';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: height * 0.02),
              Container(
                width: width * 0.9,
                child: TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.yellow.shade600,),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: height * 0.02,),
              Row(children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                ),
                Text("By signing up you agree to the ",
                    style:
                    TextStyle(fontWeight: FontWeight.w400, fontSize: 13)),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TermsConditionsPage()),
                    );
                  },
                  child: Text(
                    "Terms and conditions*",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Colors.blue),
                  ),
                ),
              ]),
              SizedBox(height: height * 0.03),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow.shade600,
                    foregroundColor: Colors.white),
                onPressed: _signUp,
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /*void _signUp() {
    if (_formKey.currentState!.validate()) {
      if (_isChecked) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Success'),
            content: Text('Signup completed successfully!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:
            Text('Please agree to the Terms and Conditions to proceed.')));
      }
    }
  }*/

  /*void _signUp() {
    if (_formKey.currentState!.validate()) {
      if (_isChecked) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(

            title: Text('Success'),
            content: Text('Signup completed successfully!'),
          ),
        );

        // Automatically dismiss the dialog after 2 seconds and navigate
        Future.delayed(Duration(seconds: 10), () {
          Navigator.of(context).pop(); // Dismiss the dialog
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Please agree to the Terms and Conditions to proceed.')));
      }
    }
  }*/

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      if (_isChecked) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Colors.yellow[600],
            title: Text(
              'Success',
              style: TextStyle(color: Colors.black),
            ),
            content: Text(
              'Signup completed successfully!',
              style: TextStyle(color: Colors.black),
            ),
          ),
        );
        Future.delayed(Duration(seconds: 2), () {
          Navigator.of(context).pop();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Please agree to the Terms and Conditions to proceed.')));
      }
    }
  }


}
