part of 'spacex_cubit.dart';

abstract class SpaceXState extends Equatable {
  const SpaceXState();

  @override
  List<Object> get props => [];
}

class SpaceXInitial extends SpaceXState {
  const SpaceXInitial();
}

class LoadingSpaceX extends SpaceXState {
  const LoadingSpaceX();
}

class LoadedSpaceX extends SpaceXState {
  const LoadedSpaceX(this.spacexData);

  final List<SpaceXEntity> spacexData;

  @override
  List<Object> get props => [spacexData.map((post) => post.id).toList()];
}

class SpaceXError extends SpaceXState {
  const SpaceXError(this.message);

  final String message;

  @override
  List<String> get props => [message];
}
