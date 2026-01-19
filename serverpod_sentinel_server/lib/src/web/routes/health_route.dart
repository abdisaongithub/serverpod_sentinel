import 'package:serverpod/serverpod.dart';

class HealthRoute extends Route {
  @override
  Future<Result> handleCall(Session session, Request request) async {
    return Response.ok(body: Body.fromString('OK'));
  }
}
