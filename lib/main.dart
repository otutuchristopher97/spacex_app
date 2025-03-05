import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_app/core/resources/themes.dart';
import 'package:spacex_app/core/routing/router.dart';
import 'package:spacex_app/core/service/injection_container.dart';
import 'package:spacex_app/src/spacex/presentation/cubit/spacex/spacex_cubit.dart';
import 'package:spacex_app/src/spacex/presentation/cubit/spacexdetail/spacex_detail_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SpaceXCubit>(
          create: (context) => sl<SpaceXCubit>()..getSpacexListData(),
        ),
        BlocProvider<SpacexDetailCubit>(
          create: (context) => sl<SpacexDetailCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'Spacex App',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        onGenerateRoute: generateRoute,
        initialRoute: RouteConstants.splashScreen,
      ),
    );
  }
}