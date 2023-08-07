import 'package:clean_architecture_app/layers/data/dto/space_media_dto.dart';
import 'package:dartz/dartz.dart';

abstract class getSpaceMediaByDateDataSource {
  Future<SpaceMediaDto> call({required String date});
}
