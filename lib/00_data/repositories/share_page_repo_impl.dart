import 'package:broker_app/00_data/datasources/share_local_datasource.dart';
import 'package:broker_app/00_data/models/share_model.dart';
import 'package:broker_app/01_domain/repositories/share_page_repos.dart';

class SharePageRepoImpl extends SharePageRepo {
  final ShareLocalDataSource _dataSource = ShareLocalDataSourceImpl();

  //SharePageRepoImpl(this._dataSource);

  @override
  Future<ShareModel> getDaily({required int numberOfDays}) async {
    return await _dataSource.getDaily(numberOfDays: numberOfDays);
  }
}
