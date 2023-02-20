import 'package:dartz/dartz.dart';
import 'package:untitled3/core/error/exceptions.dart';
import 'package:untitled3/core/error/failure.dart';
import 'package:untitled3/localization/data/data_source/lang_locale_data_source.dart';
import 'package:untitled3/localization/domain/repository/base_lang_repository.dart';


class LangRepositoryImpl implements LangRepository {
  final LangLocalDataSource langLocalDataSource;

  LangRepositoryImpl({required this.langLocalDataSource});
  @override
  Future<Either<Failure, bool>> changeLang({required String langCode}) async {
    try {
      final langIsChanged =
      await langLocalDataSource.changeLang(langCode: langCode);
      return Right(langIsChanged);
    } on ServiceExceptions catch(failure){
      return Left(ServiceFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, String>> getSavedLang() async {
    try {
      final langCode = await langLocalDataSource.getSavedLang();
      return Right(langCode);
    } on ServiceExceptions catch(failure){
      return Left(ServiceFailure(failure.errorMessageModel.statusMessage));
    }
  }
}