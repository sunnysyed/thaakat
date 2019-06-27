import 'package:flutter/material.dart';
import 'package:thaakat_foundation/screens/thaakat/widgets/FadingImageView.dart';

class ThaakatScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold( // 1
      body: new Container(
      // decoration: new BoxDecoration(color: Colors.white),
        child: new SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              new Stack(
                children: <Widget>[
                  new FadingImageView(
                    imageUrls: [
                      "http://www.thaakatfoundation.org/wp-content/uploads/2017/06/homeslide1.jpg",
                      "http://www.thaakatfoundation.org/wp-content/uploads/2017/06/homeslide2.jpg",
                      "http://www.thaakatfoundation.org/wp-content/uploads/2017/06/homeslide3.jpg"
                    ],
                  ),
              Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                          "THAAKAT FOUNDATION",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: new Text(
                              "We believe in restoring hope to those who have been outcast from society.  We work to progress global communities through sustainable education and healthcare development projects.",
                              textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white
                                )
                            ),
                          )
                        ],
                      ),
                    ),

                  )
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}