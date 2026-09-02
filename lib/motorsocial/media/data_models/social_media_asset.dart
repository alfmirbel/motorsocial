import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_media_asset.freezed.dart';
part 'social_media_asset.g.dart';

/// Activo multimedia subido por un usuario. Metadatos persistidos en
/// `motorsocial_media`; el binario se almacena en MinIO/S3.
///
/// Doc CouchDB con prefijo `media:<uuid>`.
@freezed
abstract class SocialMediaAsset with _$SocialMediaAsset {
  const factory SocialMediaAsset({
    required String id,
    required String ownerId,
    @Default('image') String assetType,
    required String url,
    required DateTime createdAt,
  }) = _SocialMediaAsset;

  factory SocialMediaAsset.fromJson(Map<String, dynamic> json) =>
      _$SocialMediaAssetFromJson(json);
}