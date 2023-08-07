import 'package:clean_architecture_app/layers/domain/entities/space_media_entity.dart';
import 'package:dartz/dartz.dart';

abstract class GetSpaceMediaByDateUseCase{
  Future<Either<Exception, SpaceMediaEntity>> call({required String date});
}