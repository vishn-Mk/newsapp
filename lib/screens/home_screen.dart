

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/screens/article_screen.dart';
import 'package:newsapp/screens/discover_screen.dart';
import 'package:newsapp/screens/view_news_screen.dart';
import 'package:newsapp/widgets/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);



  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  int _currentIndex = 0;

  List<Widget> myPages = [
    ViewNewsScreen(),
    DiscoverScreen(),
    CustomScrollViewExample(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,

      bottomNavigationBar: NavigationBarWidget(ontap: (value) {

        setState(() {
          _currentIndex = value;
        });



      }, currentIndex: _currentIndex,),
      body: myPages[_currentIndex] ,
    );
  }
}



class TaggedText extends StatelessWidget {
  final String text;
  final String tag;
  final String article;

  const TaggedText(
      {required this.text, required this.tag, required this.article, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                tag,
                style: GoogleFonts.zenAntique(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black12,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          article,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            shadows: [
              Shadow(
                blurRadius: 10.0,
                color: Colors.black12,
                offset: Offset(2.0, 2.0),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              TextButton(
                onPressed: () {
                  // Handle "Learn More" tap
                },
                child: Row(
                  children: const [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        'Learn More',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.blue,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}//
