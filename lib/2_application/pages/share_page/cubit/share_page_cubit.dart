
import 'package:bloc/bloc.dart';
import 'package:broker_app/1_domain/usecases/share_page_usecasses.dart';
import 'package:meta/meta.dart';

part 'share_page_state.dart';

class SharePageCubit extends Cubit<SharePageState> {
  final SharePageUsecases _usecases = SharePageUsecases();

  SharePageCubit() : super(SharePageInitial());

  /// Request daily data for a given number of days
  /// emits [SharePageLoading] while loading and [SharePageLoaded] when done
  void reqestDaily({required int numberOfDays, String symbol = 'IBM'}) async{
    emit(SharePageLoading());
    var shareEntity = await _usecases.reqestDaily(numberOfDays: numberOfDays, symbol: symbol);
    List<(double, double)> positions = [
      for (int i = 0; i < shareEntity.positions.length; i++)
        (i.toDouble(), shareEntity.positions[i])
    ];
    emit(SharePageLoaded(positions: positions, min: shareEntity.min, max: shareEntity.max));
  }
}