import 'package:clean_architecture_app/layers/domain/entities/space_media_entity.dart';
import 'package:clean_architecture_app/layers/domain/usecases/get_space_media/get_space_media_by_date_usecase.dart';

class SpaceMediaController {
  final GetSpaceMediaByDateUseCase getSpaceMediaByDateUseCase;
  SpaceMediaController({required this.getSpaceMediaByDateUseCase}) {
    // getSPaceMediaByDate("today");
  }

  late SpaceMediaEntity spaceMedia;

  getSPaceMediaByDate({required String date}) async {
    var result = await getSpaceMediaByDateUseCase(date: date);

    //! Utilizado para tratar os retornos do Either do dartz, o primeiro é o Left(error) e o segundo o Right(sucess)
    result.fold(
      (error) {
        print("Deu foi erro!");
      },
      (sucess) {
        return sucess;
      },
    );
  }
}
