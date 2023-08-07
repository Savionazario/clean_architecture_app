import 'package:dartz/dartz.dart';

import '../entities/space_media_entity.dart';

abstract class GetSpaceMediaByDateRepository{
  Future<Either<Exception, SpaceMediaEntity>> call({required String date});
}