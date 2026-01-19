import 'package:serverpod/serverpod.dart';

class AppConfigRoute extends Route {
  final ServerConfig apiConfig;

  AppConfigRoute({required this.apiConfig});

  @override
  Future<Result> handleCall(Session session, Request request) async {
    final config = {
      'apiServer': {
        'host': apiConfig.publicHost,
        'port': apiConfig.publicPort,
        'scheme': apiConfig.publicScheme,
      },
    };

    return Response.ok(
      body: Body.fromString(
        SerializationManager.encode(config),
        mimeType: MimeType.json,
      ),
    );
  }
}
