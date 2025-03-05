part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _initSpacex();
}

Future<void> _initSpacex() async {
  
  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton<SpacexRemoteDataSource>(
    () => SpacexRemoteDataSrcImpl(sl()),
  );

  sl.registerLazySingleton<SpacexRepository>(
    () => SpacexRepositoryImplementation(sl()),
  );

  sl.registerLazySingleton(() => GetSpacexList(sl()));
  sl.registerLazySingleton(() => GetSpacexDetail(sl()));

  sl.registerFactory(
    () => SpaceXCubit(getSpacexList: sl()),
  );

  sl.registerFactory(
    () => SpacexDetailCubit(getSpacexDetail: sl()),
  );

}