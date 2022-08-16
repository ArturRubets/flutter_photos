part of 'photos_bloc.dart';

abstract class PhotosState extends Equatable {
  @override
  List<Object> get props;

  const PhotosState();
}

class PhotosStateInitial extends PhotosState {
  final List<Photo> photos;

  @override
  List<Object> get props => [photos];

  const PhotosStateInitial({this.photos = const <Photo>[]});
}

class PhotosStateLoading extends PhotosState {
  @override
  List<Object> get props => [];

  const PhotosStateLoading();
}

class PhotosStateSuccess extends PhotosState {
  final List<Photo> photos;

  @override
  List<Object> get props => [photos];

  const PhotosStateSuccess({required this.photos});

  PhotosStateSuccess copyWith({
    List<Photo>? photos,
  }) {
    return PhotosStateSuccess(
      photos: photos ?? this.photos,
    );
  }
}

class PhotosStateFailure extends PhotosState {
  @override
  List<Object> get props => [];

  const PhotosStateFailure();
}
