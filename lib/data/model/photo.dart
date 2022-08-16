import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photo.g.dart';

@JsonSerializable()
class Photo extends Equatable {
  final String id;
  final String? description;
  final Urls urls;
  final Sponsorship? sponsorship;

  @override
  List<Object?> get props => [id, description, urls, sponsorship];

  const Photo({
    required this.id,
    required this.description,
    required this.urls,
    required this.sponsorship,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}

@JsonSerializable()
class Urls extends Equatable {
  final String full;
  final String thumb;

  @override
  List<Object> get props => [full, thumb];

  const Urls({
    required this.full,
    required this.thumb,
  });

  factory Urls.fromJson(Map<String, dynamic> json) => _$UrlsFromJson(json);

  Map<String, dynamic> toJson() => _$UrlsToJson(this);
}

@JsonSerializable()
class Sponsorship extends Equatable {
  final Sponsor? sponsor;

  @override
  List<Object?> get props => [sponsor];

  const Sponsorship({required this.sponsor});

  factory Sponsorship.fromJson(Map<String, dynamic> json) =>
      _$SponsorshipFromJson(json);

  Map<String, dynamic> toJson() => _$SponsorshipToJson(this);
}

@JsonSerializable()
class Sponsor extends Equatable {
  final String id;
  final String name;

  @override
  List<Object> get props => [id, name];

  const Sponsor({
    required this.id,
    required this.name,
  });

  factory Sponsor.fromJson(Map<String, dynamic> json) =>
      _$SponsorFromJson(json);

  Map<String, dynamic> toJson() => _$SponsorToJson(this);
}
