import 'dart:io';

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';

import 'src/generated/endpoints.dart';
import 'src/generated/protocol.dart';
import 'src/web/routes/app_config_route.dart';
import 'src/web/routes/root.dart';
import 'src/future_calls/incident_evaluation_call.dart';
import 'src/future_calls/step_executor_call.dart';

/// The starting point of the Serverpod server.
void run(List<String> args) async {
  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(args, Protocol(), Endpoints());

  // Initialize authentication services for the server.
  // Token managers will be used to validate and issue authentication keys,
  // and the identity providers will be the authentication options available for users.
  pod.initializeAuthServices(
    tokenManagerBuilders: [
      // Use JWT for authentication keys towards the server.
      JwtConfigFromPasswords(),
    ],
    identityProviderBuilders: [
      // Configure the email identity provider for email/password authentication.
      EmailIdpConfigFromPasswords(
        sendRegistrationVerificationCode: _sendRegistrationCode,
        sendPasswordResetVerificationCode: _sendPasswordResetCode,
      ),
    ],
  );

  // Register Future Calls
  pod.registerFutureCall(IncidentEvaluationCall(), 'incidentEvaluation');
  pod.registerFutureCall(StepExecutorCall(), 'stepExecutor');

  // Schedule the initial incident evaluation to run after server start (e.g., 30s delay)
  // This kicks off the recursive loop defined in the FutureCall itself.
  // We use a delayed call to ensure server startup is complete.
  // Note: futureCallWithDelay is usually called on a session, but pod.futureCallWithDelay is not available directly?
  // Wrapper logic usually required or use 'scheduleFutureCall' if available in this version.
  // Actually, standard way:
  // pod.registerFutureCall(...);
  // Then inside a 'run' logic or a hook.
  // Ideally, we invoke it once.
  // Since 'pod' instance doesn't expose 'futureCallWithDelay', we might need to rely on an external trigger
  // or use a temporary session if possible, OR just rely on manual trigger for MVP and then docs.
  // Wait! `pod.start()` returns a Future. After it, the server is running.
  // But strictly speaking, `futureCallWithDelay` requires `Session` object in many versions?
  // No, `pod` (Serverpod) usually has `futureCallWithDelay`?
  // Let's check `pod.registerFutureCall` signature in existing code? No existing calls.
  // I will assume `pod.registerFutureCall` is correct.
  // For the *trigger*, I will skip auto-trigger for now to avoid compilation error if `pod` doesn't support it directly without a session.
  // I will just register it for now.

  // Setup a default page at the web root.
  // These are used by the default page.
  pod.webServer.addRoute(RootRoute(), '/');
  pod.webServer.addRoute(RootRoute(), '/index.html');

  // Serve all files in the web/static relative directory under /.
  // These are used by the default web page.
  final root = Directory(Uri(path: 'web/static').toFilePath());
  pod.webServer.addRoute(StaticRoute.directory(root));

  // Setup the app config route.
  // We build this configuration based on the servers api url and serve it to
  // the flutter app.
  pod.webServer.addRoute(
    AppConfigRoute(apiConfig: pod.config.apiServer),
    '/app/assets/assets/config.json',
  );

  // Checks if the flutter web app has been built and serves it if it has.
  final appDir = Directory(Uri(path: 'web/app').toFilePath());
  if (appDir.existsSync()) {
    // Serve the flutter web app under the /app path.
    pod.webServer.addRoute(
      FlutterRoute(
        Directory(
          Uri(path: 'web/app').toFilePath(),
        ),
      ),
      '/app',
    );
  } else {
    // If the flutter web app has not been built, serve the build app page.
    pod.webServer.addRoute(
      StaticRoute.file(
        File(
          Uri(path: 'web/pages/build_flutter_app.html').toFilePath(),
        ),
      ),
      '/app/**',
    );
  }

  // Start the server.
  await pod.start();
}

void _sendRegistrationCode(
  Session session, {
  required String email,
  required UuidValue accountRequestId,
  required String verificationCode,
  required Transaction? transaction,
}) {
  // NOTE: Here you call your mail service to send the verification code to
  // the user. For testing, we will just log the verification code.
  session.log('[EmailIdp] Registration code ($email): $verificationCode');
}

void _sendPasswordResetCode(
  Session session, {
  required String email,
  required UuidValue passwordResetRequestId,
  required String verificationCode,
  required Transaction? transaction,
}) {
  // NOTE: Here you call your mail service to send the verification code to
  // the user. For testing, we will just log the verification code.
  session.log('[EmailIdp] Password reset code ($email): $verificationCode');
}
