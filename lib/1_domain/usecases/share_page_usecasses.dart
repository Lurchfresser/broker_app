import 'package:broker_app/1_domain/entities/share_entity.dart';
import 'package:broker_app/1_domain/repositories/share_page_repos.dart';


import '../../0_data/repositories/share_page_repo_impl.dart';

class SharePageUsecases {
  final SharePageRepo _repository = SharePageRepoImpl();


  Future<ShareEntity> reqestDaily({required int numberOfDays, String symbol = 'IBM'}) async{
    return _repository.getDaily(numberOfDays: numberOfDays);
  }

  
}