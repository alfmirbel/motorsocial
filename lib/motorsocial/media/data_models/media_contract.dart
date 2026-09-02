import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_contract.freezed.dart';

/// Contrato de configuración del módulo de media.
@freezed
abstract class MediaContract with _$MediaContract {
  const factory MediaContract() = _MediaContract;
}