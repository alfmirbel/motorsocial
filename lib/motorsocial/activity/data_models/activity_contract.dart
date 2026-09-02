import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_contract.freezed.dart';

/// Contrato de configuración del motor de actividades.
@freezed
abstract class ActivityContract with _$ActivityContract {
  const factory ActivityContract() = _ActivityContract;
}