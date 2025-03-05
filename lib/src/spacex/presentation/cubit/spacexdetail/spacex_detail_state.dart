part of 'spacex_detail_cubit.dart';

abstract class SpaceXDetailState extends Equatable {
  const SpaceXDetailState();

  @override
  List<Object> get props => [];
}

class SpaceXDetailInitial extends SpaceXDetailState {
  const SpaceXDetailInitial();
}

class LoadingSpaceXDetail extends SpaceXDetailState {
  const LoadingSpaceXDetail();
}

class LoadedSpaceXDetail extends SpaceXDetailState {
  const LoadedSpaceXDetail(this.spacex);

  final SpaceXEntity spacex;

  @override
  List<Object> get props => [spacex];
}

class SpaceXDetailError extends SpaceXDetailState {
  const SpaceXDetailError(this.message);

  final String message;

  @override
  List<String> get props => [message];
}
