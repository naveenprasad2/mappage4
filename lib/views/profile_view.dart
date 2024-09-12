import 'package:flutter/material.dart';
import '../widget/custom_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();

}

class _ProfilePageState extends State<ProfilePage> {


  String firstName = 'Priya';
  String lastName = 'Ram';
  String email = 'priyaram@gmail.com';
  String Gender = 'Male';
  String groupValue = 'Male';
  DateTime? selectedDate;



  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    super.dispose();
  }


  //String groupValue = 'yes';
  void _showDatePicker() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime(2025),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  String formattedDate() {
    if (selectedDate == null) {
      return '';
    } else {
      return "${selectedDate!.day.toString().padLeft(2, '0')}/"
          "${selectedDate!.month.toString().padLeft(2, '0')}/"
          "${selectedDate!.year}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Column (
          children: [

            CustomProfile(
                text1: 'Profile',
                imageBase64: 'lib/images/mask.png',
                icon2: Icons.arrow_back,
                text2: 'Priya',
                onIconTap: (){}),


            const SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Name',
                style: TextStyle(
                    fontWeight: FontWeight.w500),),
              subtitle: Row(
                children: [
                  Text(firstName),
                  Text(lastName)
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.keyboard_arrow_right_outlined),
                onPressed: () {
                  firstNameController.text = firstName;
                  lastNameController.text = lastName;
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            height: 300,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 240.0),
                                  child: Text(
                                    'Edit Name',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16),
                                // First Name TextField
                                TextField(
                                  controller: firstNameController,
                                  decoration: InputDecoration(
                                    labelText: 'First Name',
                                    prefixIcon: Icon(Icons.person),
                                    suffixIcon: IconButton(
                                      icon: Icon(Icons.close_outlined),
                                      onPressed: () {
                                        firstNameController.clear(); // Clear the text field
                                      },
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 16),
                                // Last Name TextField
                                TextField(
                                  controller: lastNameController,
                                  decoration: InputDecoration(
                                    labelText: 'Last Name',
                                    prefixIcon: Icon(Icons.person_outline),
                                    suffixIcon: IconButton(
                                      icon: Icon(Icons.close_outlined),
                                      onPressed: () {
                                        lastNameController.clear();
                                      },
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 20),
                                SizedBox(
                                  width: double.infinity,
                                  child: TextButton(
                                    onPressed: () {
                                      setState(() {
                                        firstName = firstNameController.text;
                                        lastName = lastNameController.text;
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: Text('Save Changes'),
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.black,
                                      backgroundColor: Colors.yellow[700],
                                      //padding: EdgeInsets.symmetric(vertical: 12.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),




            Divider(indent: 12, endIndent: 12),

            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone Number',
                style: TextStyle(
                    fontWeight: FontWeight.w500),),
              subtitle: Text('+91 1234567890'),
            ),

            const SizedBox(height: 10),
            Divider(indent: 12, endIndent: 12),


            ListTile(
              leading: Icon(Icons.email),
              title: Text(
                'Email',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text(email,
                style: TextStyle(),
              ),
              trailing: IconButton(
                icon: Icon(Icons.keyboard_arrow_right_outlined),
                onPressed: () {
                  emailController.text = email;
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) {
                      return Padding(
                        padding:  EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: SingleChildScrollView(
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30))
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 240.0),
                                    child: Text(' Edit Email',
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  TextField(
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.mail_outline),
                                      suffixIcon: IconButton(
                                        icon: Icon(Icons.close_outlined),
                                        onPressed: () {
                                          emailController.clear();
                                        },
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15)
                                      ),
                                      hintText: 'Email address',
                                    ),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(height: 20,),
                                  TextButton(onPressed: (){
                                    setState(() {
                                      email = emailController.text;
                                    });
                                    Navigator.pop(context);
                                  },
                                    child: Text('Save Changes'),
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.black,
                                      backgroundColor: Colors.yellow[700],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }  ,


              ),
            ),
            const SizedBox(height: 10),


            Divider(indent: 12, endIndent: 12),
            ListTile(
              leading: Icon(Icons.female),
              title: Text(
                'Gender',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text(Gender),
              trailing: IconButton(
                icon: Icon(Icons.keyboard_arrow_right_outlined),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        padding: EdgeInsets.all(16.0),
                        height: 280,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Gender',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: Text('Male'),
                                    onTap: () {
                                      setState(() {
                                        Gender = 'Male'; // Update gender
                                        groupValue = 'Male'; // Update selected radio button
                                      });
                                      Navigator.pop(context); // Close the BottomSheet
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Radio<String>(
                                    value: 'Male',
                                    groupValue: groupValue,
                                    onChanged: (value) {
                                      setState(() {
                                        Gender = value!;
                                        groupValue = value;
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
                                    title: Text('Female'),
                                    onTap: () {
                                      setState(() {
                                        Gender = 'Female';
                                        groupValue = 'Female';
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Radio<String>(
                                    value: 'Female',
                                    groupValue: groupValue,
                                    onChanged: (value) {
                                      setState(() {
                                        Gender = value!;
                                        groupValue = value;
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
                                        Gender = 'Others';
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
                                        Gender = value!;
                                        groupValue = value;
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),

            ),
            const SizedBox(height: 10),



            Divider(indent: 12, endIndent: 12),
            ListTile(
              leading: Icon(Icons.cake),
              title: Text('Date of Birth',style: TextStyle(fontWeight: FontWeight.w500),),
              subtitle: Text(formattedDate(), style: TextStyle(color: Colors.black)),
              trailing: IconButton(
                icon: Icon(Icons.keyboard_arrow_right_outlined), onPressed: _showDatePicker,
              ),
            ),


            const SizedBox(height: 10),
            const Divider(indent: 12, endIndent: 12),
            const ListTile(
              leading: Icon(Icons.verified_outlined),
              title: Text('Member Since',style: TextStyle(fontWeight: FontWeight.w500),),
              subtitle: Text('February 2024'),
            ),
          ],
        ),
      ),
    );
  }
}