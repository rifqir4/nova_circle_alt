enum Environment { dev, staging, production }

class FlavorConfig {
  const FlavorConfig({
    required this.serverType,
    required this.appTitle,
    required this.apiEndpoint,
    required this.flavorName,
    required this.bucketUrl,
    required this.appId,
    required this.dynamicUrl,
    required this.webUrl,
  }) : super();

  final Environment serverType;
  final String appTitle;
  final String apiEndpoint;
  final String flavorName;
  final String bucketUrl;
  final String appId;
  final String dynamicUrl;
  final String webUrl;
}
