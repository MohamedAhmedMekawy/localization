import 'package:dartz/dartz.dart';
import 'package:untitled3/core/error/failure.dart';
import 'package:untitled3/core/use_case/base_use_case.dart';
import 'package:untitled3/localization/domain/repository/base_lang_repository.dart';

class ChangeLangUseCase implements BaseUseCase<bool, String> {
  final LangRepository langRepository;

  ChangeLangUseCase({required this.langRepository});

  @override
  Future<Either<Failure, bool>> call(String langCode) async =>
      await langRepository.changeLang(langCode: langCode);
}