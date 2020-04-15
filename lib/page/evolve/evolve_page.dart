import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 疫情进展
 */
class EvolvePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('最新进展'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('最新进展',style: TextStyle(
          fontSize: 24,
        )),
      ),
    );
  }
}


