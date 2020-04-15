import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'application.dart';

class AppRoute {

  static _navigateTo(BuildContext context, String path,
      {bool replace = false,
        bool clearStack = false,
        Duration transitionDuration = const Duration(milliseconds: 0),
        RouteTransitionsBuilder transitionBuilder,
        TransitionType transitionType = TransitionType.material
      }) {
    Application.router.navigateTo(context, path,
        replace: replace,
        clearStack: clearStack,
        transitionDuration: transitionDuration,
        transitionBuilder: transitionBuilder,
        transition: transitionType);
  }

  static push(BuildContext context, String path,{Map<String, dynamic> params}) {
    String query =  "";
    if (params != null) {
      int index = 0;
      for (var key in params.keys) {
        var value = Uri.encodeComponent(params[key]);
        if (index == 0) {
          query = "?";
        } else {
          query = query + "\&";
        }
        query += "$key=$value";
        index++;
      }
    }
    path = path + query;
    _navigateTo(context, path,replace: false, transitionType: TransitionType.inFromRight);
  }

  static pushResult(BuildContext context, String path, Function(Object) function,
      {bool replace = false, bool clearStack = false}) {
    FocusScope.of(context).unfocus();
    Application.router.navigateTo(context, path, replace: replace, clearStack: clearStack, transition: TransitionType.native).then((result){
      if (result == null){
        return;
      }
      function(result);
    }).catchError((error) {
      print("$error");
    });
  }


  static pushAndRemoveT(BuildContext context, String path,{Map<String, dynamic> params}) {
    String query =  "";
    if (params != null) {
      int index = 0;
      for (var key in params.keys) {
        var value = Uri.encodeComponent(params[key]);
        if (index == 0) {
          query = "?";
        } else {
          query = query + "\&";
        }
        query += "$key=$value";
        index++;
      }
    }
    path = path + query;
    _navigateTo(context, path,replace: true, transitionType: TransitionType.fadeIn);
  }


  static  pushAndRemove(BuildContext context, String path) {
    _navigateTo(context, path, replace: true, transitionType: TransitionType.fadeIn);
  }

  static present(BuildContext context, String path) {
    _navigateTo(context, path, replace: false, transitionType: TransitionType.inFromBottom);
  }

  static pop(BuildContext context) {
    Application.router.pop(context);
  }



}