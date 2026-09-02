import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_contract.freezed.dart';

/// Contrato de configuración del módulo de navegación.
@freezed
abstract class NavigationContract with _$NavigationContract {
  const factory NavigationContract() = _NavigationContract;
}