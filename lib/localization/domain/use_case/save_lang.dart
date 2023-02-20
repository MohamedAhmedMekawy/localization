import 'package:dartz/dartz.dart';
import 'package:untitled3/core/error/failure.dart';
import 'package:untitled3/core/use_case/base_use_case.dart';
import 'package:untitled3/localization/domain/repository/base_lang_repository.dart';

class GetSavedLangUseCase implements BaseUseCase<String, NoParameters> {
  final LangRepository langRepository;

  GetSavedLangUseCase({required this.langRepository});

  @override
  Future<Either<Failure, String>> call(NoParameters params) async =>
      await langRepository.getSavedLang();
}