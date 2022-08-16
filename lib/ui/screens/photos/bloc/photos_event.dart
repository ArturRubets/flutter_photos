part of 'photos_bloc.dart';

abstract class PhotosEvent extends Equatable {
  @override
  List<Object> get props;

  const PhotosEvent();
}

class PhotoFetchedFirstPage extends PhotosEvent {
  @override
  List<Object> get props => [];

  const PhotoFetchedFirstPage();
}

class PhotoFetchedNextPage extends PhotosEvent {
  @override
  List<Object> get props => [];

  const PhotoFetchedNextPage();
}
