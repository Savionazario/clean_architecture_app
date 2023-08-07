import 'package:clean_architecture_app/layers/domain/entities/space_media_entity.dart';

abstract class GetSpaceMediaByDateState{}

class GetSpaceMediaByDateInitialState extends GetSpaceMediaByDateState{}

class GetSpaceMediaByDateLoadingState extends GetSpaceMediaByDateState{}

class GetSpaceMediaByDateSucessfulState extends GetSpaceMediaByDateState{
  final SpaceMediaEntity spaceMedia;

  GetSpaceMediaByDateSucessfulState({required this.spaceMedia});
}

class GetSpaceMediaByDateErrorState extends GetSpaceMediaByDateState{
  final String errorMessage;

  GetSpaceMediaByDateErrorState({required this.errorMessage});
}