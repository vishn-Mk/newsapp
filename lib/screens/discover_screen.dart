import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/art.dart';
import 'package:newsapp/food.dart';
import 'package:newsapp/health.dart';
import 'package:newsapp/politics.dart';


class DiscoverScreen extends StatefulWidget {
 
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> with TickerProviderStateMixin {
  TextEditingController searchcontroller=TextEditingController();
  late TabController _tabController;

  @override
  void initState() {
   
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [SizedBox(height: 20,),
                Text(
                  'Discover',
                  style:GoogleFonts.abel(fontSize:30,fontWeight:FontWeight.w900)),
                 SizedBox(height: 5),
                Text(
                  'News from all over the world',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: searchcontroller,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    filled: true,
                    prefixIcon: const Icon(
                      (Icons.search),
                      color: Colors.grey,
                    ),
                    suffixIcon: const RotatedBox(
                      quarterTurns: 1,
                      child: Icon(
                        Icons.tune,
                        color: Colors.grey,
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(height: 30),
                TabBar(
                  indicatorColor: Colors.black,
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: const [
                    Text('Health'),
                    Text('Politics'),
                    Text('Art'),
                    Text('Food'),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                HealthPage(),
                PoliticsPage(),
                ArtPage(),
                FoodPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
