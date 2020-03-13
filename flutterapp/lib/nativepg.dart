import 'dart:async';
import 'package:flutter/services.dart';

class dynativepg {
    static const MethodChannel _channel = MethodChannel('flutterapp/fluttermethod');
    
    static Future<String> call(String methodName, Map args) async {
      var result = await _channel.invokeMethod(methodName);
      return result;
    }
}