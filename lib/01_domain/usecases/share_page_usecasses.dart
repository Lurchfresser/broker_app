import 'dart:convert';
import 'dart:math' as math;

import 'package:broker_app/01_domain/entities/share_entity.dart';
import 'package:flutter/services.dart';

class SharePageUsecases {
  //final SharePageRepository repository;

  SharePageUsecases();

  Future<ShareEntity> reqestDaily({required int numberOfDays, String symbol = 'IBM'}) async{
    final String response = await rootBundle.loadString('assets/sample.json');
    final data = await json.decode(response);
    int i = 0;
    List<double> positions = [];
    for (var item in data['Time Series (Daily)'].values) {
      if (i++ > numberOfDays) {
        break;
      }
      positions.add(double.parse(item['1. open']));
    }
    double min = positions.reduce(math.min) + 10.0;
    double max = positions.reduce(math.max) - 10.0;

    return ShareEntity(min: min, max: max, positions: positions);
  }

  
}