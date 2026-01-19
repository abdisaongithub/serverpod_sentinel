/// Custom exception classes for Serverpod Sentinel
///
/// These exceptions provide structured error handling with HTTP status codes
/// for consistent API error responses.

/// Base exception for all application errors
class AppException implements Exception {
  final String message;
  final String code;
  final int statusCode;

  AppException({
    required this.message,
    required this.code,
    this.statusCode = 500,
  });

  @override
  String toString() => 'AppException[$code]: $message';
}

/// Resource not found (404)
class NotFoundException extends AppException {
  NotFoundException(String resource, {int? id})
    : super(
        message: id != null
            ? '$resource with ID $id not found'
            : '$resource not found',
        code: 'NOT_FOUND',
        statusCode: 404,
      );
}

/// Validation error (400)
class ValidationException extends AppException {
  final Map<String, String>? fieldErrors;

  ValidationException(String message, {this.fieldErrors})
    : super(
        message: message,
        code: 'VALIDATION_ERROR',
        statusCode: 400,
      );
}

/// Unauthorized access (401)
class UnauthorizedException extends AppException {
  UnauthorizedException([String? message])
    : super(
        message: message ?? 'Authentication required',
        code: 'UNAUTHORIZED',
        statusCode: 401,
      );
}

/// Forbidden access (403)
class ForbiddenException extends AppException {
  ForbiddenException([String? message])
    : super(
        message: message ?? 'You do not have permission to perform this action',
        code: 'FORBIDDEN',
        statusCode: 403,
      );
}

/// Conflict (409)
class ConflictException extends AppException {
  ConflictException(String message)
    : super(
        message: message,
        code: 'CONFLICT',
        statusCode: 409,
      );
}
