import 'package:flutter/material.dart';
import 'package:newsapp/Model/News_Model.dart';
import 'package:newsapp/controller/Home_controller.dart';
import 'package:newsapp/screens/home_screen.dart';
import 'package:newsapp/screens/news_view.dart';

class ViewNewsScreen extends StatelessWidget {
  const ViewNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsModel>>(
      future: fetchAlbum(), // Ensure this function is defined or imported
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage('assets/img/worker-reading-news-with-tablet.jpg'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.topLeft,

                        ),
                      ),
                      const Positioned(
                        bottom: 10,
                        left: 35,
                        child: TaggedText(
                          text: 'News Of The Day',
                          tag: 'Breaking',
                          article:
                          'V.I.P. Immunization for the Powerful \nand Their Cronies Ratties South America',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    SizedBox(width: 20),
                    Text(
                      'Breaking News',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    SizedBox(width: 170),
                    Text(
                      'More',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => viewnewsscreen(currentindex: snapshot.data![index]),));

                      },
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(16),
                            height: 250,
                            width: 280,
                            margin: const EdgeInsets.only(top: 16, left: 16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 250,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      snapshot.data![index].image?? 'https://via.placeholder.com/150',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  snapshot.data![index].title.toString(),
                                  maxLines: 2,
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 90),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return CircularProgressIndicator();
      },
    );
  }
}
