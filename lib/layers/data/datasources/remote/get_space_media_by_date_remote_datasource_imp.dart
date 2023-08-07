import 'package:clean_architecture_app/layers/data/dto/space_media_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../get_space_media_by_date_datasource.dart';

class GetSpaceMediaByDateRemoteDataSourceImp
    implements getSpaceMediaByDateDataSource {
  final Dio dio;
  GetSpaceMediaByDateRemoteDataSourceImp(this.dio);

  final _nasaUrl = "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY";
  @override
  Future<SpaceMediaDto> call({required String date}) async {
    print("Data: $date");
    final result = await dio.get(
      _nasaUrl,
      queryParameters: {'date': date},
    );

    print("Result: ${result.data}");

    SpaceMediaDto spaceMediaDto = SpaceMediaDto.fromJson(result.data as Map);

    return spaceMediaDto;
  }
}
