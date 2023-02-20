import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/use_case/base_use_case.dart';
import 'package:untitled3/core/utils/app_strings.dart';
import 'package:untitled3/localization/domain/use_case/change_lang_use_case.dart';
import 'package:untitled3/localization/domain/use_case/save_lang.dart';

import 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  final GetSavedLangUseCase getSavedLangUseCase;
  final ChangeLangUseCase changeLangUseCase;
  LocaleCubit(
      {required this.getSavedLangUseCase, required this.changeLangUseCase})
      : super(const ChangeLocaleState(Locale(AppString.englishCode)));

  String currentLangCode = AppString.englishCode;

  Future<void> getSavedLang() async {
    final response = await getSavedLangUseCase.call(const NoParameters());
    response.fold((failure) => debugPrint('cacheFailure'), (value) {
      currentLangCode = value;
      emit(ChangeLocaleState(Locale(currentLangCode)));
    });
  }

  Future<void> _changeLang(String langCode) async {
    final response = await changeLangUseCase.call(langCode);
    response.fold((failure) => debugPrint('cacheFailure'), (value) {
      currentLangCode = langCode;
      emit(ChangeLocaleState(Locale(currentLangCode)));
    });
  }

  void toEnglish() => _changeLang(AppString.englishCode);

  void toArabic() => _changeLang(AppString.arabicCode);
}