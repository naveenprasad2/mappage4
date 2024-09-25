import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../widget/onboarding_item.dart';
import 'login_view.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final controller = OnboardingItems();
  final pageController = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomSheet: Container(
      //   //color: Colors.,
      //   padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      //   child: isLastPage? getStarted() : Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       TextButton(
      //           onPressed: ()=>pageController.jumpToPage(controller.items.length-1),
      //           child: const Text("Skip",style: TextStyle(color: Colors.grey),)),
      //       SmoothPageIndicator(
      //         controller: pageController,
      //         count: controller.items.length,
      //         onDotClicked: (index)=> pageController.animateToPage(index,
      //             duration: const Duration(milliseconds: 600), curve: Curves.easeIn),
      //         effect:  WormEffect(
      //           dotHeight: 12,
      //           dotWidth: 12,
      //           activeDotColor: Colors.yellow.shade600,
      //         ),
      //       ),
      //
      //       //Next Button
      //       ElevatedButton(
      //         onPressed: () => pageController.nextPage(
      //             duration: const Duration(milliseconds: 600),
      //             curve: Curves.easeIn),
      //         style: ElevatedButton.styleFrom(
      //           backgroundColor: Colors.yellow[600],
      //           shape: CircleBorder(),
      //           padding: EdgeInsets.all(16),
      //         ),
      //         child: Icon(Icons.navigate_next, color: Colors.black),
      //       ),
      //     ],
      //   ),
      // ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: PageView.builder(
                  onPageChanged: (index)=> setState(()=> isLastPage = controller.items.length-1 == index),
                  itemCount: controller.items.length,
                  controller: pageController,
                  itemBuilder: (context,index){
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(controller.items[index].image),
                       // const SizedBox(height: 5),
                        Text(controller.items[index].title,
                          style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                        const SizedBox(height: 15),
                        Text(controller.items[index].descriptions,
                            style: const TextStyle(color: Colors.grey,fontSize: 17), textAlign: TextAlign.center),
                      ],
                    );

                  }),
            ),
          ),
          Container(
            //color: Colors.,
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: isLastPage? getStarted() : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: ()=>pageController.jumpToPage(controller.items.length-1),
                    child: const Text("Skip",style: TextStyle(color: Colors.grey),)),
                SmoothPageIndicator(
                  controller: pageController,
                  count: controller.items.length,
                  onDotClicked: (index)=> pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 600), curve: Curves.easeIn),
                  effect:  WormEffect(
                    dotHeight: 12,
                    dotWidth: 12,
                    activeDotColor: Colors.yellow.shade600,
                  ),
                ),

                //Next Button
                ElevatedButton(
                  onPressed: () => pageController.nextPage(
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeIn),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow[600],
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(16),
                  ),
                  child: Icon(Icons.navigate_next, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }



  Widget getStarted(){
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.yellow[600]
      ),
      width: 155,
      height: 50,
      child: TextButton(
        onPressed: ()async{
          final pres = await SharedPreferences.getInstance();
          pres.setBool("onboarding", true);
          if(!mounted)return;
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
        },
        child: const Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "Getting started",
              style: TextStyle(color: Colors.white),
            ),
            Icon(Icons.navigate_next, color: Colors.white),
          ],

        ),
      ),
    );
  }
}