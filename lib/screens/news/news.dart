import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:thaakat_foundation/util/hexcolor.dart';


class NewsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NewsScreenState();
}
class NewsScreenState extends State<NewsScreen> {

  // Base URL for our wordpress API
  final String apiUrl = "https://thaakatfoundation.org/wp-json/wp/v2/";
  // Empty list for our posts
  List posts;

  // Function to fetch list of posts
  Future<String> getPosts() async {

    var res = await http.get(Uri.encodeFull(apiUrl + "posts?_embed"), headers: {"Accept": "application/json"});

    // fill our posts list with results and update state
    setState(() {
      var resBody = json.decode(res.body);
      posts = resBody;
    });

    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    this.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: posts == null ? 0 : posts.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(top: 10, bottom: 0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: InkWell(
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          new Container(
                            width: MediaQuery.of(context).size.width,
                            height: 250,
                            child: new CachedNetworkImage(imageUrl: posts[index]["featured_media"] == 0
                                ? 'images/placeholder.png'
                                : posts[index]["_embedded"]["wp:featuredmedia"][0]["source_url"],
                              fit: BoxFit.cover,
                            ),
                          ),
                          new Padding(
                            padding: EdgeInsets.all(5.0),
                            child: new ListTile(
                              title: new Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5.0),
                                  child: new Text(posts[index]["title"]["rendered"])),
                              subtitle: new Text(
                                  posts[index]["excerpt"]["rendered"].replaceAll(new RegExp(r'<[^>]*>'), '')
                              ),
                            ),
                          )
                        ],
                      ),

                    ),
                    onTap: () {
                      FlutterWebBrowser.openWebPage(url: posts[index]["link"], androidToolbarColor: new HexColor("#33668a"));
                    },
                  )
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
