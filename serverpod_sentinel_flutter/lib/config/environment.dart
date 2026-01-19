/// Environment configuration for different build modes.
enum Environment { dev, staging, prod }

class EnvConfig {
  final Environment environment;
  final String apiUrl;
  final String wsUrl;
  final bool enableLogging;

  const EnvConfig._({
    required this.environment,
    required this.apiUrl,
    required this.wsUrl,
    required this.enableLogging,
  });

  static const dev = EnvConfig._(
    environment: Environment.dev,
    apiUrl: 'http://localhost:8080/',
    wsUrl: 'ws://localhost:8080/',
    enableLogging: true,
  );

  static const staging = EnvConfig._(
    environment: Environment.staging,
    apiUrl: 'https://staging-api.sentinel.example.com/',
    wsUrl: 'wss://staging-api.sentinel.example.com/',
    enableLogging: true,
  );

  static const prod = EnvConfig._(
    environment: Environment.prod,
    apiUrl: 'https://api.sentinel.example.com/',
    wsUrl: 'wss://api.sentinel.example.com/',
    enableLogging: false,
  );

  static EnvConfig get current {
    const env = String.fromEnvironment('ENV', defaultValue: 'dev');
    switch (env) {
      case 'staging':
        return staging;
      case 'prod':
        return prod;
      default:
        return dev;
    }
  }
}
