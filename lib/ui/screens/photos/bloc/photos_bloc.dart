import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/api_client.dart';
import '../../../../data/model/photo.dart';

part 'photos_event.dart';
part 'photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  final PhotoApiClient photoApiClient;
  final String clientId;

  PhotosBloc(this.photoApiClient, this.clientId) : super(const PhotosState()) {
    on<PhotoFetched>(_onPhotoFetched);
  }

  FutureOr<void> _onPhotoFetched(_, Emitter<PhotosState> emit) async {
    final photos = await photoApiClient.photos(clientId);
    emit(state.copyWith(photos: photos));
  }
}
