import 'package:flutter/material.dart';

class MeServiceCell extends StatelessWidget {

  final VoidCallback onPressed;
  final String iconName;
  final String title;

  MeServiceCell({this.title, this.iconName, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Image.asset(iconName,fit: BoxFit.fill,width: 32,),
            SizedBox(height: 10),
            Text(title, style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
