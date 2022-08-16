part of 'photos_bloc.dart';

abstract class PhotosState extends Equatable {
  final List<Photo> photos;

  @override
  List<Object> get props => [photos];

  const PhotosState({this.photos = const <Photo>[]});
}

class PhotosInitial extends PhotosState {}
