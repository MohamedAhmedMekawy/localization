import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled3/localization/data/data_source/lang_locale_data_source.dart';
import 'package:untitled3/localization/data/repository/lang_repository.dart';
import 'package:untitled3/localization/domain/repository/base_lang_repository.dart';
import 'package:untitled3/localization/domain/use_case/change_lang_use_case.dart';
import 'package:untitled3/localization/domain/use_case/save_lang.dart';
import 'package:untitled3/localization/presentation/controller/locale_cubit.dart';

final sl = GetIt.instance;

class ServiceLocator {
  Future<void> init() async {
    sl.registerFactory<LocaleCubit>(
        () => LocaleCubit(getSavedLangUseCase: sl(), changeLangUseCase: sl()));
    /// USE CASE
    sl.registerLazySingleton<GetSavedLangUseCase>(
        () => GetSavedLangUseCase(langRepository: sl()));
    sl.registerLazySingleton<ChangeLangUseCase>(
        () => ChangeLangUseCase(langRepository: sl()));
    /// REPOSITORY
    sl.registerLazySingleton<LangRepository>(
        () => LangRepositoryImpl(langLocalDataSource: sl()));
    ///REMOTE DATASOURCE
    sl.registerLazySingleton<LangLocalDataSource>(
        () => LangLocalDataSourceImpl(sharedPreferences: sl()));
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPreferences);
  }
}
