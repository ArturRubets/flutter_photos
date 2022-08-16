import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/model/photo.dart';

part 'photos_event.dart';
part 'photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  PhotosBloc() : super(PhotosInitial()) {
    on<PhotosEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
