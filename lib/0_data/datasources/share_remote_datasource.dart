import 'dart:convert';

import 'package:broker_app/0_data/models/share_model.dart';
import "package:http/http.dart" as http;


abstract class ShareRemoteDataSource {
  Future<ShareModel> getDaily({required int numberOfDays, required String symbol});
}

class ShareRemoteDataSourceImpl implements ShareRemoteDataSource {
    final http.Client client = http.Client();


  @override
  Future<ShareModel> getDaily({required int numberOfDays, required String symbol}) async {

    final params = {
      'function': 'TIME_SERIES_DAILY',
      'symbol': symbol,
      'apikey': 'Q2EX7JOT9NUIH63K',
      'outputsize': 'full',
    };

    final uri = Uri.https('www.alphavantage.co', '/query', params);

    final response = await client.get(uri);

    final data = json.decode(response.body)['Time Series (Daily)'].values.toList().take(numberOfDays).toList();

    return ShareModel.fromJson(data);
  }
  }