part of 'photos_bloc.dart';

class PhotosState extends Equatable {
  final List<Photo> photos;

  @override
  List<Object> get props => [photos];

  const PhotosState({this.photos = const <Photo>[]});

  PhotosState copyWith({
    List<Photo>? photos,
  }) {
    return PhotosState(
      photos: photos ?? this.photos,
    );
  }
}
