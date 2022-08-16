// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Photo _$PhotoFromJson(Map<String, dynamic> json) => Photo(
      id: json['id'] as String,
      description: json['description'] as String?,
      urls: Urls.fromJson(json['urls'] as Map<String, dynamic>),
      sponsor: json['sponsor'] == null
          ? null
          : Sponsor.fromJson(json['sponsor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'urls': instance.urls,
      'sponsor': instance.sponsor,
    };

Urls _$UrlsFromJson(Map<String, dynamic> json) => Urls(
      full: json['full'] as String,
      thumb: json['thumb'] as String,
    );

Map<String, dynamic> _$UrlsToJson(Urls instance) => <String, dynamic>{
      'full': instance.full,
      'thumb': instance.thumb,
    };

Sponsor _$SponsorFromJson(Map<String, dynamic> json) => Sponsor(
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$SponsorToJson(Sponsor instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
