import 'package:equatable/equatable.dart';

class LinksEntity extends Equatable {
  final String? smallPatch;
  final String? largePatch;
  final String? webcast;
  final String? youtubeId;
  final String? article;
  final String? wikipedia;

  const LinksEntity({
    required this.smallPatch,
    required this.largePatch,
    required this.webcast,
    required this.youtubeId,
    required this.article,
    required this.wikipedia,
  });

  const LinksEntity.empty()
      : this(
          smallPatch: '',
          largePatch: '',
          webcast: '',
          youtubeId: '',
          article: '',
          wikipedia: '',
        );

  @override
  List<Object?> get props => [smallPatch, largePatch, webcast, youtubeId, article, wikipedia];
}

class SpaceXEntity extends Equatable {
  final String id;
  final String name;
  final int flightNumber;
  final bool success;
  final String details;
  final String dateUtc;
  final int dateUnix;
  final String rocket;
  final List<String> payloads;
  final String launchpad;
  final LinksEntity links;

  const SpaceXEntity({
    required this.id,
    required this.name,
    required this.flightNumber,
    required this.success,
    required this.details,
    required this.dateUtc,
    required this.dateUnix,
    required this.rocket,
    required this.payloads,
    required this.launchpad,
    required this.links,
  });

  const SpaceXEntity.empty()
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
          links: const LinksEntity.empty(),
        );

  @override
  List<Object?> get props => [
        id,
        name,
        flightNumber,
        success,
        details,
        dateUtc,
        dateUnix,
        rocket,
        payloads,
        launchpad,
        links,
      ];
}