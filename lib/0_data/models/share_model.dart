import 'dart:math' as math;

import 'package:broker_app/1_domain/entities/share_entity.dart';

class ShareModel extends ShareEntity{
  ShareModel({required super.min, required super.max, required super.positions});
  
  factory ShareModel.fromJson(List<dynamic> json) {
    List<double> positions = [];
    for (var item in json) {
      positions.add(double.parse(item['1. open']));
    }
    double min = positions.reduce(math.min) + 10.0;
    double max = positions.reduce(math.max) - 10.0;

    return ShareModel(min: min, max: max, positions: positions);
  }
}