import 'package:broker_app/01_domain/entities/share_entity.dart';
import 'package:broker_app/01_domain/repositories/share_page_repos.dart';


import '../../00_data/repositories/share_page_repo_impl.dart';

class SharePageUsecases {
  final SharePageRepo _repository = SharePageRepoImpl();


  Future<ShareEntity> reqestDaily({required int numberOfDays, String symbol = 'IBM'}) async{
    return _repository.getDaily(numberOfDays: numberOfDays);
  }

  
}