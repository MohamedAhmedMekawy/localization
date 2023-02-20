import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/config/locale/app_localizations.dart';
import 'package:untitled3/config/locale/app_localizations_setup.dart';
import 'package:untitled3/core/services/service_locator.dart';
import 'package:untitled3/localization/presentation/controller/locale_cubit.dart';
import 'package:untitled3/localization/presentation/controller/locale_state.dart';
import 'package:untitled3/localization/presentation/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<LocaleCubit>(),)
      ],
      child: BlocBuilder<LocaleCubit,LocaleState>(
          buildWhen: (previousState, currentState) {
          return previousState != currentState;
           },
        builder: (context, state) {
          return  MaterialApp(
            locale: state.locale,
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localeResolutionCallback:
            AppLocalizationsSetup.localeResolutionCallback,
            localizationsDelegates:
            AppLocalizationsSetup.localizationsDelegates,
            debugShowCheckedModeBanner: false,
            home: MyHomePage(),
          );
        },

      ),
    );
  }
}

