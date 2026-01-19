import 'package:serverpod/serverpod.dart';

class RootRoute extends WidgetRoute {
  @override
  Future<WebWidget> build(Session session, Request request) async {
    return TemplateWidget(
      name: 'built_with_serverpod',
      values: {
        'served': DateTime.now().toIso8601String(),
        'runmode': session.serverpod.runMode,
      },
    );
  }
}
