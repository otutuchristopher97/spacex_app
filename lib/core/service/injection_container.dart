
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:spacex_app/src/spacex/data/datasources/spacex_remote_data_source.dart';
import 'package:spacex_app/src/spacex/data/repositories/spacex_repository_implementatio.dart';
import 'package:spacex_app/src/spacex/domain/repositories/spacex_repository.dart';
import 'package:spacex_app/src/spacex/domain/usecases/get_spacex_detail.dart';
import 'package:spacex_app/src/spacex/domain/usecases/spacex_list.dart';
import 'package:spacex_app/src/spacex/presentation/cubit/spacex/spacex_cubit.dart';
import 'package:spacex_app/src/spacex/presentation/cubit/spacexdetail/spacex_detail_cubit.dart';

part 'injection_container.main.dart';
