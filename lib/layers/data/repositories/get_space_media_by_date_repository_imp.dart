import 'package:clean_architecture_app/layers/data/datasources/get_space_media_by_date_datasource.dart';
import 'package:clean_architecture_app/layers/domain/entities/space_media_entity.dart';
import 'package:clean_architecture_app/layers/domain/repositories/get_space_media_by_date_repository.dart';
import 'package:dartz/dartz.dart';

class getSpaceMediaByDateRepositoryImp implements GetSpaceMediaByDateRepository {
  final getSpaceMediaByDateDataSource _getSpaceMediaDataSource;
  getSpaceMediaByDateRepositoryImp(this._getSpaceMediaDataSource);

  @override
  Future<Either<Exception, SpaceMediaEntity>> call({required String date}) async{
    try {
      //! Verificar esse as SpaceMediaEntity
      final result = await _getSpaceMediaDataSource(date: date);
      return Right(result);
    } catch (e) {
      // throw Exception("Algo deu errado no try catch do repository!");
      return Left(Exception("Algo deu errado no try catch do repository"));
    }
    
  }
}
