import 'dart:convert';
import 'dart:math' as math;

import 'package:broker_app/00_data/models/share_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class ShareLocalDataSource {
  Future<ShareModel> getDaily({required int numberOfDays});
}

class ShareLocalDataSourceImpl implements ShareLocalDataSource {
  @override
  Future<ShareModel> getDaily({required int numberOfDays}) async {
    final String response = await rootBundle.loadString('assets/sample.json');
    final data = await json.decode(response)['Time Series (Daily)'].values.toList().take(numberOfDays).toList();

    return ShareModel.fromJson(data);
  }
}