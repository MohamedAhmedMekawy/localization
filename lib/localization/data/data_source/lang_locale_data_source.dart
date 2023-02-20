import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled3/core/utils/app_strings.dart';

abstract class LangLocalDataSource {
  Future<bool> changeLang({required String langCode});
  Future<String> getSavedLang();
}

class LangLocalDataSourceImpl implements LangLocalDataSource {
  final SharedPreferences sharedPreferences;

  LangLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<bool> changeLang({required String langCode}) async =>
      await sharedPreferences.setString(AppString.locale, langCode);

  @override
  Future<String> getSavedLang() async =>
      sharedPreferences.containsKey(AppString.locale)
          ? sharedPreferences.getString(AppString.locale)!
          : AppString.englishCode;
}

