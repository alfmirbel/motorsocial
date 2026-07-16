import 'package:flutter/material.dart';

class SocialMediaAsset {
  final String id;
  final String ownerId;
  final String assetType;
  final String url;
  final DateTime createdAt;

  const SocialMediaAsset({required this.id, required this.ownerId, required this.assetType, required this.url, required this.createdAt});
}

class MediaAssetBuilder extends StatelessWidget {
  final String assetId;
  const MediaAssetBuilder({super.key, required this.assetId});

  @override
  Widget build(BuildContext context) => const Placeholder();
}
