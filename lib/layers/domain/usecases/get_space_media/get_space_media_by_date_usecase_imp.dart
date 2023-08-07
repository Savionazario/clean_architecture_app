import 'package:clean_architecture_app/layers/domain/entities/space_media_entity.dart';
import 'package:clean_architecture_app/layers/domain/repositories/get_space_media_by_date_repository.dart';
import 'package:clean_architecture_app/layers/domain/usecases/get_space_media/get_space_media_by_date_usecase.dart';
import 'package:dartz/dartz.dart';

class GetSpaceMediaByDateUseCaseImp implements GetSpaceMediaByDateUseCase {
  // O usecase não deve conhecer o repositório, logo criamos uma interface e quem criar o usecase será responsável por passar a instância
  final GetSpaceMediaByDateRepository _getSpaceMediaByDateRepository;
  GetSpaceMediaByDateUseCaseImp(this._getSpaceMediaByDateRepository);

  @override
  Future<Either<Exception, SpaceMediaEntity>> call({required String date}) async{
    return await _getSpaceMediaByDateRepository(date: date);
  }
}
