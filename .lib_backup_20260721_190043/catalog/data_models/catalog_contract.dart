class CatalogContract {
  final String providerName;
  final List<String> supportedTypes;
  final int defaultPageSize;
  final bool enableSearch;
  final bool enablePdfExport;
  final String primaryCtaLabel;

  const CatalogContract({
    required this.providerName,
    this.supportedTypes = const <String>[],
    this.defaultPageSize = 20,
    this.enableSearch = true,
    this.enablePdfExport = false,
    this.primaryCtaLabel = 'Contactar',
  });

  factory CatalogContract.fromJson(Map<String, dynamic> json) => CatalogContract(
        providerName: json['providerName'] as String? ?? '',
        supportedTypes: (json['supportedTypes'] as List<dynamic>? ?? const []).whereType<String>().toList(),
        defaultPageSize: (json['defaultPageSize'] as int?) ?? 20,
        enableSearch: json['enableSearch'] as bool? ?? true,
        enablePdfExport: json['enablePdfExport'] as bool? ?? false,
        primaryCtaLabel: json['primaryCtaLabel'] as String? ?? 'Contactar',
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'providerName': providerName,
        'supportedTypes': supportedTypes,
        'defaultPageSize': defaultPageSize,
        'enableSearch': enableSearch,
        'enablePdfExport': enablePdfExport,
        'primaryCtaLabel': primaryCtaLabel,
      };
}
