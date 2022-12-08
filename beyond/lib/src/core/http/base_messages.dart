class BaseMessages {
  /// Information responses
  /// 100
  static const continues = 'Continue';

  /// 101
  static const siwtchingProtocols = 'Switching Protocols';

  /// 102
  static const processing = 'Processing';

  /// 103
  static const earlyHints = 'Early Hints';

  /// Successful responses
  /// 200
  static const ok = 'OK';

  /// 201
  static const created = 'Created';

  /// 202
  static const accepted = 'Accepted';

  /// 203
  static const nonAuthoritativeInformation = 'Non-Authoritative Information';

  /// 204
  static const noContent = 'No Content';

  /// 205
  static const resetContent = 'Reset Content';

  /// 206
  static const partialContent = 'Partial Content';

  /// 207
  static const multiStatus = 'Multi-Status';

  /// 226
  static const imUsed = 'IM Used';

  /// Redirection messages
  /// 300
  static const multipleChoices = 'Multiple Choices';

  /// 301
  static const movedPermantently = 'Moved Permanently';

  /// 302
  static const found = 'Found';

  /// 303
  static const seeOther = 'See Other';

  /// 304
  static const notModified = 'Not Modified';

  /// 305
  static const useProxy = 'Use Proxy';

  /// 306
  static const unused = 'Unused';

  /// 307
  static const temporaryRedirect = 'Temporary Redirect';

  /// 308
  static const permanentRedirect = 'Permanent Redirect';

  /// Client error response
  /// 400
  static const badRequest = 'Bad Request';

  /// 401
  static const unauthorized = 'Unauthorized';

  /// 402
  static const paymentRequired = 'Payment Required';

  /// 403
  static const forbiden = 'Forbiden';

  /// 404
  static const notFound = 'Not Found';

  /// 405
  static const methodNotAllowed = 'Method Not Allowed';

  /// 406
  static const notAcceptable = 'Not Acceptable';

  /// 407
  static const proxyAuthenticationRequired = 'Proxy Authentication Required';

  /// 408
  static const requestTimeout = 'Request Timeout';

  /// 409
  static const conflict = 'Conflict';

  /// 410
  static const gone = 'Gone';

  /// 411
  static const lengthRequired = 'Length Required';

  /// 412
  static const preconditionFailed = 'Precondtion Failed';

  /// 413
  static const payloadTooLarge = 'Payload Too Large';

  /// 414
  static const uriTooLong = 'Uri Too Long';

  /// 415
  static const unsupportedMediaType = 'Unsupported Media Type';

  /// 416
  static const rangeNotSatisfiable = 'Range Not Satisfiable';

  /// 417
  static const expectationFailed = 'Expectation Failed';

  /// 418
  static const imATeapot = 'Im a teapot';

  /// 421
  static const misdirectedRequest = 'Misdirected Request';

  /// 422
  static const unprocessableEntity = 'Unprocessable Entity';

  /// 423
  static const locked = 'Locked';

  /// 424
  static const failedDependency = 'Failed Dependency';

  /// 425
  static const tooEarly = 'Too Early';

  /// 426
  static const upgradeRequired = 'Upgrade Required';

  /// 428
  static const preConditionRequired = 'Precondition Required';

  /// 429
  static const tooManyRequest = 'Too Many Request';

  /// 431
  static const requestHeaderFieldsTooLarge = 'Request Header Fields Too Large';

  /// 451
  static const unavailableForLegalReason = 'Unavailable For Legal Response';

  /// Server error response
  /// 500
  static const internalServerError = 'Internal Server Error';

  /// 501
  static const notImplemented = 'Not Implemented';

  /// 502
  static const badGateway = 'Bad Gateway';

  /// 503
  static const serviceUnavailable = 'Service Unavailable';

  /// 504
  static const gatewayTimeout = 'Gateway Timeout';

  /// 505
  static const httpVersionNotSupported = 'Http Version Not Supported';

  /// 506
  static const variantAlsoNegotiates = 'Variant Also Negotiates';

  /// 507
  static const insufficientStorage = 'Insufficient Storage';

  /// 508
  static const loopDetected = 'Loop Detected';

  /// 510
  static const notExtended = 'Not Extended';

  /// 511
  static const networkAuthenticationRequired =
      'Network Authentication Required';
}
