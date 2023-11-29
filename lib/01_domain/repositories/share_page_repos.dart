import 'package:broker_app/01_domain/entities/share_entity.dart';

abstract class SharePageRepo {
  Future<ShareEntity> getDaily({required int numberOfDays});
}