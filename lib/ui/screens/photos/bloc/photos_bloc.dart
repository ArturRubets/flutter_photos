import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/api_client.dart';
import '../../../../data/model/photo.dart';

part 'photos_event.dart';
part 'photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  final PhotoApiClient photoApiClient;
  final String clientId;

  PhotosBloc(this.photoApiClient, this.clientId)
      : super(const PhotosStateInitial()) {
    on<PhotoFetchedFirstPage>(
      _onPhotoFetchedFirstPage,
      transformer: droppable(),
    );
    on<PhotoFetchedNextPage>(
      _onPhotoFetchedNextPage,
      transformer: droppable(),
    );
  }

  FutureOr<void> _onPhotoFetchedFirstPage(_, Emitter<PhotosState> emit) async {
    try {
      emit(const PhotosStateLoading());
      final photos = await photoApiClient.photos(clientId);
      emit(PhotosStateSuccess(photos: photos));
    } on Exception {
      emit(const PhotosStateFailure());
    }
  }

  FutureOr<void> _onPhotoFetchedNextPage(_, Emitter<PhotosState> emit) async {
    try {
      final stateLocal = state;
      if (stateLocal is PhotosStateSuccess) {
        await Future.delayed(Duration(seconds: 2));
        final photos = await photoApiClient.photos(clientId);
        final newPhotos = List<Photo>.from(stateLocal.photos)..addAll(photos);
        emit(PhotosStateSuccess(photos: newPhotos));
      }
    } on Exception {
      emit(const PhotosStateFailure());
    }
  }
}
