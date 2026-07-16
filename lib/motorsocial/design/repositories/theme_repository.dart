import '../data_models/design_token.dart';

abstract class ThemeRepository {
  ThemeTokenSet loadTheme(String themeId);
}

class ThemeTokenSet {
  final Map<String, DesignToken> tokens;
  const ThemeTokenSet(this.tokens);
}
