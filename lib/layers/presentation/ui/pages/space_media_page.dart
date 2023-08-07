import 'package:clean_architecture_app/layers/data/datasources/remote/get_space_media_by_date_remote_datasource_imp.dart';
import 'package:clean_architecture_app/layers/data/repositories/get_space_media_by_date_repository_imp.dart';
import 'package:clean_architecture_app/layers/domain/usecases/get_space_media/get_space_media_by_date_usecase_imp.dart';
import 'package:clean_architecture_app/layers/presentation/controllers/space_media_controller.dart';
import 'package:clean_architecture_app/layers/presentation/cubits/spaceMedia/get_space_media_by_date_cubit.dart';
import 'package:clean_architecture_app/layers/presentation/cubits/spaceMedia/get_space_media_by_date_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpaceMediaPage extends StatefulWidget {
  final String data;
  const SpaceMediaPage({Key? key, required this.data}) : super(key: key);

  @override
  _SpaceMediaPageState createState() => _SpaceMediaPageState();
}

class _SpaceMediaPageState extends State<SpaceMediaPage> {
  // late SpaceMediaController spaceMediaController;
  late GetSpaceMediaByDateCubit getSpaceMediaByDateCubit;

  // SpaceMediaController spaceMediaController = SpaceMediaController(
  //     getSpaceMediaByDateUseCase: GetSpaceMediaByDateUseCaseImp(
  //       getSpaceMediaByDateRepositoryImp(
  //         GetSpaceMediaByDateRemoteDataSourceImp(
  //           Dio(),
  //         ),
  //       ),
  //     ),
  //   );

  initialize() {
    // spaceMediaController = SpaceMediaController(
    //   getSpaceMediaByDateUseCase: GetSpaceMediaByDateUseCaseImp(
    //     getSpaceMediaByDateRepositoryImp(
    //       GetSpaceMediaByDateRemoteDataSourceImp(
    //         Dio(),
    //       ),
    //     ),
    //   ),
    // );

    getSpaceMediaByDateCubit = GetSpaceMediaByDateCubit(
      getSpaceMediaByDateUseCase: GetSpaceMediaByDateUseCaseImp(
        getSpaceMediaByDateRepositoryImp(
          GetSpaceMediaByDateRemoteDataSourceImp(
            Dio(),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    initialize();
    // spaceMediaController.getSPaceMediaByDate(date: "2023-06-29");
    getSpaceMediaByDateCubit.loadSpaceMediaByDate(date: widget.data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0,),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BlocBuilder<GetSpaceMediaByDateCubit, GetSpaceMediaByDateState>(
                    bloc: getSpaceMediaByDateCubit,
                    builder: (context, state) {
                      if (state is GetSpaceMediaByDateInitialState) {
                        return SizedBox.shrink();
                      }
                      if (state is GetSpaceMediaByDateErrorState) {
                        return Center(
                          child: Text(state.errorMessage),
                        );
                      }
                      if (state is GetSpaceMediaByDateLoadingState) {
                        return Center(child: CircularProgressIndicator());
                      }
                    
                      state = state as GetSpaceMediaByDateSucessfulState;
                      return Column(
                        children: [
                          Text(
                            state.spaceMedia.title!,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            height: 300,
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(state.spaceMedia.url!),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 0.0),
                            child: Text(
                              state.spaceMedia.explanation!,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  // FutureBuilder(
                  //   future: spaceMediaController.getSPaceMediaByDate(
                  //       date: "2023-06-29"),
                  //   builder: (context, snapshot) {
                  //     if (snapshot.hasError) {
                  //       return Text(
                  //         "Deu errado!",
                  //         style: TextStyle(
                  //           fontSize: 18,
                  //           fontWeight: FontWeight.w500,
                  //         ),
                  //       );
                  //     }
                  //     else if (snapshot.hasData) {
                  //       return Column(
                  //         children: [
                  //           Text(
                  //             spaceMediaController.spaceMedia.title!,
                  //             style: TextStyle(
                  //               fontSize: 18,
                  //               fontWeight: FontWeight.w500,
                  //             ),
                  //           ),
                  //           Container(
                  //             height: 300,
                  //             width: MediaQuery.of(context).size.width - 40,
                  //             child: Image.network(
                  //                 spaceMediaController.spaceMedia.url!),
                  //           ),
                  //         ],
                  //       );
                  //     }else{
                  //       print("Snapshot: ${snapshot.data}");
                  //       return Container(
                  //       height: 50,
                  //       width: 50,
                  //       child: CircularProgressIndicator(),
                  //     );
                  //     }
                    
                  //   },
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
