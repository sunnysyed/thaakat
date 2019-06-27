import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';



class FadingImageView extends StatefulWidget{
  var imageUrls;


  FadingImageView({Key key, this.imageUrls}): super(key: key);

  @override
  _FadingImageViewState createState() => _FadingImageViewState();

}

class _FadingImageViewState extends State<FadingImageView> {
  Timer _everySecond;
  String currentImage;
  String nextImage;
  var lastImage;
  bool _visible = false;


  @override
  void initState() {
    super.initState();

    currentImage = (widget.imageUrls..shuffle()).first;
    nextImage = (widget.imageUrls..shuffle()).first;
    _everySecond = Timer.periodic(Duration(seconds: 6), (Timer t) {
      setState(() {
        _visible = !_visible;
        if (!_visible){
          currentImage = (widget.imageUrls..shuffle()).first;
        }else{
          nextImage = (widget.imageUrls..shuffle()).first;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new CachedNetworkImage(imageUrl: currentImage),
        AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: Duration(seconds: 1),
          child: new CachedNetworkImage(imageUrl: nextImage)
        )
      ]
    );
  }

  @override
  void dispose() {
    _everySecond.cancel();
    super.dispose();
  }
}