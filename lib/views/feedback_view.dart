/*
import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
        title: Text('Feedback'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
           Container(
             decoration: BoxDecoration(
               border: Border.all(color: Colors.transparent),
               borderRadius: BorderRadius.circular(10),
               color: Colors.red,
             ),
           )
          ],
        ),
      ),
    );
  }
}
*/




import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  double _rating = 0;
  String _comments = '';
  List<String> feedbackOptions = [
    "Ride was smooth",
    "Faced issues with directions",
    "Passenger was polite",
    "Time delay"
  ];
  Map<String, bool> selectedOptions = {};

  @override
  void initState() {
    super.initState();
    // Initialize all options as not selected
    feedbackOptions.forEach((option) {
      selectedOptions[option] = false;
    });
  }

  void _submitFeedback() {
    // Handle feedback submission (e.g., send data to server)
    print("Rating: $_rating");
    print("Comments: $_comments");
    print("Selected Options: ${selectedOptions.entries.where((e) => e.value).map((e) => e.key).toList()}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rate Your Ride'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Driver :',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                Text('Raja',style: TextStyle(fontSize: 18),),
              ],
            ),
            Text(
              'Rate the Ride',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            ),
            SizedBox(height: 16),
            Text(
              'Predefined Feedback',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 10.0,
              children: feedbackOptions.map((option) {
                return FilterChip(
                  label: Text(option),
                  selected: selectedOptions[option] ?? false,
                  onSelected: (bool value) {
                    setState(() {
                      selectedOptions[option] = value;
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Text(
              'Additional Comments',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your comments here...',
              ),
              onChanged: (text) {
                setState(() {
                  _comments = text;
                });
              },
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: _submitFeedback,
                child: Text('Submit Feedback'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
