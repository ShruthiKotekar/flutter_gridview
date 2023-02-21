
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

//apply this class to home: attribute of MaterialApp()
class MyGridView extends StatefulWidget{
  @override
  _MyGridViewState createState(){
    return _MyGridViewState();
  } 
}

class _MyGridViewState extends State<MyGridView> {
  late List<PeopleOne> peoplelist; //list array variable for peoples

  @override
  void initState() {

    peoplelist = [ 
        PeopleOne(title:"COMEDY",  subtitle: "PJ WAALE BABU", event: "Aabir Lahiry",img: "assets/images/comedy.png"),
        PeopleOne(title:"TV & Film",  subtitle: "Anupama Chopra Reviews", event: "Film Companion",img: "assets/images/tv.png"),
        PeopleOne(title: "Kids & Family", subtitle: "Story Time with Soha Ali Khan", event: "Juggernaut Books", img: "assets/images/kids.png",),
        PeopleOne(title: "Education", subtitle: "Billionaire Mindset", event: "Amit Singh", img: "assets/images/education.png",),
        PeopleOne(title:"COMEDY",  subtitle: "PJ WAALE BABU", event: "Aabir Lahiry",img: "assets/images/comedy.png"),
        PeopleOne(title:"TV & Film",  subtitle: "Anupama Chopra Reviews", event: "Film Companion",img: "assets/images/tv.png"),
        PeopleOne(title: "Kids & Family", subtitle: "Story Time with Soha Ali Khan", event: "Juggernaut Books", img: "assets/images/kids.png",),
        PeopleOne(title: "Education", subtitle: "Billionaire Mindset", event: "Amit Singh", img: "assets/images/education.png",)
    ];  //list of peoples using PeopleOne model class, you can convert from JSON too

   
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Color(0xff000000),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 153, 0, 255),
          // The search area here
          title: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    /* Clear the search field */
                  },
                ),
                hintText: 'Search...',
                border: InputBorder.none),
          ),
        ),
      )),

        body:Column(
          children: [
              SizedBox(height: 40),
                 Padding(
             padding: EdgeInsets.only(left: 16, right: 16),
             child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Browse By Category",
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "High Quality Podcasts",
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Color(0xffa29aac),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
             ),
             
              ]
              ),
              ]
              ),
              ),
           SizedBox(height: 20),
            Flexible(
              child: GridView.count( //use GridView.count for independent to silver layout
                  crossAxisCount: 2, //
                   padding: EdgeInsets.only(left: 16, right: 16),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,

                  //scrollDirection: Axis.horizontal, //set this for horizontal scroll direction
                  shrinkWrap: true,
                  children: peoplelist.map((people){ //user peoplelist.map to loop over the list
                      return  Container(
                       decoration: BoxDecoration(
                gradient: LinearGradient(
               colors: [Colors.purple, Colors.blue],
              begin: Alignment.bottomLeft,
               end: Alignment.topRight,
          ),
               borderRadius: BorderRadius.circular(10),
                       ),
                       child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Image.asset(people.img, width: 42),
                 SizedBox(height: 14),
                 Text(
                   people.title,
                   style: GoogleFonts.openSans(
                     textStyle: TextStyle(
                       color: Colors.white,
                       fontSize: 16,
                       fontWeight: FontWeight.w600,
                     ),
                   ),
                 ),
                 SizedBox(height: 8),
                 Text(
                   people.subtitle,
                   style: GoogleFonts.openSans(
                     textStyle: TextStyle(
                       color: Colors.white38,
                       fontSize: 10,
                       fontWeight: FontWeight.w600,
                     ),
                   ),
                 ),
                 SizedBox(height: 14),
                 Text(
                   people.event,
                   style: GoogleFonts.openSans(
                     textStyle: TextStyle(
                       color: Colors.white70,
                       fontSize: 11,
                       fontWeight: FontWeight.w600,
                     ),
                   ),
                 ),
               ],
                       ),
                     );
                  }).toList(), //don't forget to to add .toList() at last of map
                ),
            ),
          ],
        )
      );
  }
}


class PeopleOne{
   String title, subtitle, event, img;
   PeopleOne({required this.title, required this.subtitle, required this.event, required this.img});
 
}



