import 'package:broker_app/0_data/datasources/share_remote_datasource.dart';
import 'package:broker_app/0_data/models/share_model.dart';
import 'package:broker_app/1_domain/repositories/share_page_repos.dart';

class SharePageRepoImpl extends SharePageRepo {
  final ShareRemoteDataSource _dataSource = ShareRemoteDataSourceImpl();

  //SharePageRepoImpl(this._dataSource);

  @override
  Future<ShareModel> getDaily({required int numberOfDays}) async {
    return await _dataSource.getDaily(numberOfDays: numberOfDays, symbol: 'IBM');
  }
}
