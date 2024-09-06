import 'package:flutter/material.dart';

extension NavigatorContext on BuildContext {

  void pop<T extends Object?>([T? result]){
    return Navigator.of(this).pop();
  }

  Future<T?> push<T extends Object?>(Widget route){
    return Navigator.of(this).push(MaterialPageRoute(builder: (c)=> route));
  }

  Future<T?> pushNamed<T extends Object?>(String routeName, Object? arguments){
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<T?> pushReplacement<T extends Object?>(Route<T> newRoute){
    return Navigator.of(this).pushReplacement(newRoute);
  }

  Future<T?> pushAndRemoveUntil<T extends Object?>(Route<T> newRoute, bool Function(Route<dynamic>) predicate){
    return Navigator.of(this).pushAndRemoveUntil(newRoute, predicate);
  }

}