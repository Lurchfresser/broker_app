part of 'share_page_cubit.dart';

@immutable
sealed class SharePageState {}

final class SharePageInitial extends SharePageState {}

final class SharePageLoading extends SharePageState {}

final class SharePageLoaded extends SharePageState {
  final List<(double, double)> positions;
  final double min;
  final double max;

  SharePageLoaded({required this.min, required this.max, required this.positions});
}

final class SharePageError extends SharePageState {}