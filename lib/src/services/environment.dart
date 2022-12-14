class Environments {
  static const String PRODUCTION = '';
  static const String DEV = 'Development';
}

class ConfigEnvironments {
  static const String _currentEnvironments = Environments.DEV;
  static const List<Map<String, String>> _availableEnvironments = [
    {
      'env': Environments.DEV,
      'url': 'http://103.185.38.180:8080',
    },
    {
      'env': Environments.PRODUCTION,
      'url': '',
    },
  ];

  static String? getEnvironments() {
    return _availableEnvironments
        .firstWhere(
          (d) => d['env'] == _currentEnvironments,
        )
        .values
        .last
        .toString();
  }
}
