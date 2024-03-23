import 'dart:ui';

class UnBoardingContent{
  String image;
  String title;
  String description;

  UnBoardingContent({
    required this.description,
    required this.title,
    required this.image
});
}

List<UnBoardingContent> contents = [
  UnBoardingContent(
      description: 'The "Find Your Desk" application simplifies workplace navigation by providing employees with real-time information about their assigned desks within the office environment.',
      title: 'Find your Desk',
      image: "assets/images/wowone.jpg",
  ),
  UnBoardingContent(description: '"An online payment method facilitates electronic transactions for goods and services over the internet."',
      title: 'Payment Method',
      image: "assets/images/wowtwo.jpg"
  ),
  UnBoardingContent(description: '"My Space" is a mobile application designed for users to organize and personalize their digital content and information in a single, customizable platform.',
      title: 'Let\'s work',
      image: "assets/images/wowthree.jpg"
  ),
];