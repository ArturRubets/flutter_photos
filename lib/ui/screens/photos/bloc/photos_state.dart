part of 'photos_bloc.dart';

abstract class PhotosState extends Equatable {
  static const int page = 1;

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
  final int page;

  @override
  List<Object> get props => [photos, page];

  const PhotosStateSuccess({required this.photos, required this.page});

  PhotosStateSuccess copyWith({
    List<Photo>? photos,
    int? page,
  }) {
    return PhotosStateSuccess(
      photos: photos ?? this.photos,
      page: page ?? this.page,
    );
  }
}

class PhotosStateFailure extends PhotosState {
  @override
  List<Object> get props => [];

  const PhotosStateFailure();
}
