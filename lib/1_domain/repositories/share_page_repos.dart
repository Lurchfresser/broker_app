import 'package:broker_app/1_domain/entities/share_entity.dart';

abstract class SharePageRepo {
  Future<ShareEntity> getDaily({required int numberOfDays});
}