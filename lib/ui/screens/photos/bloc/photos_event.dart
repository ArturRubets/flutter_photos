part of 'photos_bloc.dart';

abstract class PhotosEvent extends Equatable {
  @override
  List<Object> get props;

  const PhotosEvent();
}

class PhotoFetched extends PhotosEvent {
  @override
  List<Object> get props => [];

  const PhotoFetched();
}
