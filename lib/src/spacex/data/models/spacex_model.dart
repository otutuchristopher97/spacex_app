import 'dart:convert';
import 'package:spacex_app/core/utils/typedef.dart';
import 'package:spacex_app/src/spacex/domain/entities/spacex.dart';

class LinksModel extends LinksEntity {
  const LinksModel({
    required super.smallPatch,
    required super.largePatch,
    required super.webcast,
    required super.youtubeId,
    required super.article,
    required super.wikipedia,
  });

  factory LinksModel.fromMap(Map<String, dynamic> map) {
    return LinksModel(
      smallPatch: map['patch']?['small'] ?? '',
      largePatch: map['patch']?['large'] ?? '',
      webcast: map['webcast'] ?? '',
      youtubeId: map['youtube_id'] ?? '',
      article: map['article'] ?? '',
      wikipedia: map['wikipedia'] ?? '',
    );
  }

  Map<String, dynamic> toMap() => {
        'patch': {
          'small': smallPatch,
          'large': largePatch,
        },
        'webcast': webcast,
        'youtube_id': youtubeId,
        'article': article,
        'wikipedia': wikipedia,
      };
}

class SpaceXModel extends SpaceXEntity {
  const SpaceXModel({
    required super.id,
    required super.name,
    required super.flightNumber,
    required super.success,
    required super.details,
    required super.dateUtc,
    required super.dateUnix,
    required super.rocket,
    required super.payloads,
    required super.launchpad,
    required LinksModel super.links,
  });

  const SpaceXModel.empty()
      : this(
          id: '',
          name: 'Unknown',
          flightNumber: 0,
          success: false,
          details: '',
          dateUtc: '',
          dateUnix: 0,
          rocket: '',
          payloads: const [],
          launchpad: '',
          links: const LinksModel(
            smallPatch: '',
            largePatch: '',
            webcast: '',
            youtubeId: '',
            article: '',
            wikipedia: '',
          ),
        );

  factory SpaceXModel.fromJson(String source) => SpaceXModel.fromMap(jsonDecode(source));

  factory SpaceXModel.fromMap(DataMap map) {
    return SpaceXModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      flightNumber: map['flight_number'] ?? 0,
      success: map['success'] ?? false,
      details: map['details'] ?? '',
      dateUtc: map['date_utc'] ?? '',
      dateUnix: map['date_unix'] ?? 0,
      rocket: map['rocket'] ?? '',
      payloads: List<String>.from(map['payloads'] ?? []),
      launchpad: map['launchpad'] ?? '',
      links: LinksModel.fromMap(map['links'] ?? {}),
    );
  }

  SpaceXModel copyWith({
    String? id,
    String? name,
    int? flightNumber,
    bool? success,
    String? details,
    String? dateUtc,
    int? dateUnix,
    String? rocket,
    List<String>? payloads,
    String? launchpad,
    LinksModel? links,
  }) {
    return SpaceXModel(
      id: id ?? this.id,
      name: name ?? this.name,
      flightNumber: flightNumber ?? this.flightNumber,
      success: success ?? this.success,
      details: details ?? this.details,
      dateUtc: dateUtc ?? this.dateUtc,
      dateUnix: dateUnix ?? this.dateUnix,
      rocket: rocket ?? this.rocket,
      payloads: payloads ?? this.payloads,
      launchpad: launchpad ?? this.launchpad,
      links: links ?? LinksModel.fromMap((this.links as LinksModel).toMap()),
    );
  }

  DataMap toMap() => {
        'id': id,
        'name': name,
        'flight_number': flightNumber,
        'success': success,
        'details': details,
        'date_utc': dateUtc,
        'date_unix': dateUnix,
        'rocket': rocket,
        'payloads': payloads,
        'launchpad': launchpad,
        'links': (links as LinksModel).toMap(),
      };

  String toJson() => jsonEncode(toMap());
}