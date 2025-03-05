import 'package:equatable/equatable.dart';
import 'package:spacex_app/core/utils/typedef.dart';

abstract class UsecaseWithParams<Type, Params> {
  const UsecaseWithParams();
  ResultFuture<Type> call(Params params);
}

abstract class UsecaseWithoutParams<Type> {
  const UsecaseWithoutParams();

  ResultFuture<Type> call();
}

class SearchParams extends Equatable {
  const SearchParams ({
    required this.search,
  });

  const SearchParams.empty(): search = '';

  final String search;

  @override
  List<String> get props => [search];
}