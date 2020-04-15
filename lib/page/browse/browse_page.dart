import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

/**
 * 大图浏览
 */
class BrowsePage extends StatefulWidget {

  List<String> images=[];
  int index=0;
  PageController controller;

  BrowsePage({@required this.images,this.index,this.controller}){
    controller=PageController(initialPage: index);
  }

  @override
  _BrowseState createState() => _BrowseState();
}

class _BrowseState extends State<BrowsePage> {
  int currentIndex=0;

  @override
  void initState() {
    super.initState();
    currentIndex=widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              child: PhotoViewGallery.builder(
                scrollPhysics: const BouncingScrollPhysics(),
                builder: (BuildContext context, int index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: NetworkImage(widget.images[index]),
                  );
                },
                itemCount: widget.images.length,
                loadingChild: Container(),
                backgroundDecoration: null,
                pageController: widget.controller,
                enableRotation: true,
                onPageChanged: (index){
                  setState(() {
                    currentIndex=index;
                  });
                },
              )
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top+15,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text("${currentIndex+1}/${widget.images.length}",style: TextStyle(color: Colors.white,fontSize: 16)),
            ),
          ),
          Positioned(
            left: 10,
            top: MediaQuery.of(context).padding.top,
            child: IconButton(
              icon: Icon(Icons.close,size: 30,color: Colors.white,),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}


