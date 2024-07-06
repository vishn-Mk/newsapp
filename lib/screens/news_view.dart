import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/Model/News_Model.dart';
import 'package:newsapp/controller/Home_controller.dart';

class viewnewsscreen extends StatefulWidget {

  viewnewsscreen({super.key,required this.currentindex});
  NewsModel  currentindex;

  @override
  State<viewnewsscreen> createState() => _viewnewsscreenState();
}

class _viewnewsscreenState extends State<viewnewsscreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Happy Reading',style:  GoogleFonts.readexPro()),

        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 260.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ClipRRect(borderRadius: BorderRadius.circular(30),
                    child: Image.network(
                      widget.currentindex.image ,// Replace with your image path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.currentindex.description.toString(),
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          widget.currentindex.publishedAt.toString(),
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 8),


                        SizedBox(height: 16),
                        Text(
                          widget.currentindex.content.toString(),
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
