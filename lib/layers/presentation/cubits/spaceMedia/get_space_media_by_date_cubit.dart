import 'package:clean_architecture_app/layers/presentation/cubits/spaceMedia/get_space_media_by_date_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/space_media_entity.dart';
import '../../../domain/usecases/get_space_media/get_space_media_by_date_usecase.dart';

class GetSpaceMediaByDateCubit extends Cubit<GetSpaceMediaByDateState> {
  final GetSpaceMediaByDateUseCase getSpaceMediaByDateUseCase;
  GetSpaceMediaByDateCubit({required this.getSpaceMediaByDateUseCase})
      : super(GetSpaceMediaByDateInitialState());

  late SpaceMediaEntity spaceMedia;

  void loadSpaceMediaByDate({required String date}) async {
    emit(GetSpaceMediaByDateLoadingState());

    var result = await getSpaceMediaByDateUseCase(date: date);

    //! Utilizado para tratar os retornos do Either do dartz, o primeiro é o Left(error) e o segundo o Right(sucess)
    result.fold(
      (error) {
        print("Erro: $error");
        emit(GetSpaceMediaByDateErrorState(
            errorMessage: "$error"));
      },
      (sucess) {
        spaceMedia = sucess;
        emit(GetSpaceMediaByDateSucessfulState(spaceMedia: sucess));
      },
    );
  }
}
