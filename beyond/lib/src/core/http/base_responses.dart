import 'base_messages.dart';
import 'extended_response.dart';

class BaseResponses {
  /// Information responses
  static ExtendedResponse get continues => ExtendedResponse(
        100,
        body: BaseMessages.continues,
      );
  static ExtendedResponse get siwtchingProtocols => ExtendedResponse(
        101,
        body: BaseMessages.siwtchingProtocols,
      );
  static ExtendedResponse get processing => ExtendedResponse(
        102,
        body: BaseMessages.processing,
      );
  static ExtendedResponse get earlyHints => ExtendedResponse(
        103,
        body: BaseMessages.earlyHints,
      );

  /// Successful responses
  static ExtendedResponse get ok => ExtendedResponse(
        200,
        body: BaseMessages.ok,
      );
  static ExtendedResponse get created => ExtendedResponse(
        201,
        body: BaseMessages.created,
      );
  static ExtendedResponse get accepted => ExtendedResponse(
        202,
        body: BaseMessages.accepted,
      );
  static ExtendedResponse get nonAuthoritativeInformation => ExtendedResponse(
        203,
        body: BaseMessages.nonAuthoritativeInformation,
      );
  static ExtendedResponse get noContent => ExtendedResponse(
        204,
        body: BaseMessages.noContent,
      );
  static ExtendedResponse get resetContent => ExtendedResponse(
        205,
        body: BaseMessages.resetContent,
      );
  static ExtendedResponse get multiStatus => ExtendedResponse(
        206,
        body: BaseMessages.partialContent,
      );
  static ExtendedResponse get alreadyReported => ExtendedResponse(
        207,
        body: BaseMessages.multiStatus,
      );
  static ExtendedResponse get imUsed => ExtendedResponse(
        226,
        body: BaseMessages.imUsed,
      );

  /// Redirection messages
  static ExtendedResponse get multipleChoices => ExtendedResponse(
        300,
        body: BaseMessages.multipleChoices,
      );
  static ExtendedResponse get movedPermantently => ExtendedResponse(
        301,
        body: BaseMessages.movedPermantently,
      );
  static ExtendedResponse get found => ExtendedResponse(
        302,
        body: BaseMessages.found,
      );
  static ExtendedResponse get seeOther => ExtendedResponse(
        303,
        body: BaseMessages.seeOther,
      );
  static ExtendedResponse get notModified => ExtendedResponse(
        304,
        body: BaseMessages.notModified,
      );
  static ExtendedResponse get useProxy => ExtendedResponse(
        305,
        body: BaseMessages.useProxy,
      );
  static ExtendedResponse get unused => ExtendedResponse(
        306,
        body: BaseMessages.unused,
      );
  static ExtendedResponse get temporaryRedirect => ExtendedResponse(
        307,
        body: BaseMessages.temporaryRedirect,
      );
  static ExtendedResponse get permanentRedirect => ExtendedResponse(
        308,
        body: BaseMessages.permanentRedirect,
      );

  /// Client error response
  static ExtendedResponse get badRequest => ExtendedResponse(
        400,
        body: BaseMessages.badRequest,
      );
  static ExtendedResponse get unauthorized => ExtendedResponse(
        401,
        body: BaseMessages.unauthorized,
      );
  static ExtendedResponse get paymentRequired => ExtendedResponse(
        402,
        body: BaseMessages.paymentRequired,
      );
  static ExtendedResponse get forbiden => ExtendedResponse(
        403,
        body: BaseMessages.forbiden,
      );
  static ExtendedResponse get notFound => ExtendedResponse(
        404,
        body: BaseMessages.notFound,
      );
  static ExtendedResponse get methodNotAllowed => ExtendedResponse(
        405,
        body: BaseMessages.methodNotAllowed,
      );
  static ExtendedResponse get notAcceptable => ExtendedResponse(
        406,
        body: BaseMessages.notAcceptable,
      );
  static ExtendedResponse get proxyAuthenticationRequired => ExtendedResponse(
        407,
        body: BaseMessages.proxyAuthenticationRequired,
      );
  static ExtendedResponse get requestTimeout => ExtendedResponse(
        408,
        body: BaseMessages.requestTimeout,
      );
  static ExtendedResponse get conflict => ExtendedResponse(
        409,
        body: BaseMessages.conflict,
      );
  static ExtendedResponse get gone => ExtendedResponse(
        410,
        body: BaseMessages.gone,
      );
  static ExtendedResponse get lengthRequired => ExtendedResponse(
        411,
        body: BaseMessages.lengthRequired,
      );
  static ExtendedResponse get preconditionFailed => ExtendedResponse(
        412,
        body: BaseMessages.preconditionFailed,
      );
  static ExtendedResponse get payloadTooLarge => ExtendedResponse(
        413,
        body: BaseMessages.payloadTooLarge,
      );
  static ExtendedResponse get uriTooLong => ExtendedResponse(
        414,
        body: BaseMessages.uriTooLong,
      );
  static ExtendedResponse get unsupportedMediaType => ExtendedResponse(
        415,
        body: BaseMessages.unsupportedMediaType,
      );
  static ExtendedResponse get rangeNotSatisfiable => ExtendedResponse(
        416,
        body: BaseMessages.rangeNotSatisfiable,
      );
  static ExtendedResponse get expectationFailed => ExtendedResponse(
        417,
        body: BaseMessages.expectationFailed,
      );
  static ExtendedResponse get imATeapot => ExtendedResponse(
        418,
        body: BaseMessages.imATeapot,
      );
  static ExtendedResponse get misdirectedRequest => ExtendedResponse(
        421,
        body: BaseMessages.misdirectedRequest,
      );
  static ExtendedResponse get unprocessableEntity => ExtendedResponse(
        422,
        body: BaseMessages.unprocessableEntity,
      );
  static ExtendedResponse get locked => ExtendedResponse(
        423,
        body: BaseMessages.locked,
      );
  static ExtendedResponse get failedDependency => ExtendedResponse(
        424,
        body: BaseMessages.failedDependency,
      );
  static ExtendedResponse get tooEarly => ExtendedResponse(
        425,
        body: BaseMessages.tooEarly,
      );
  static ExtendedResponse get upgradeRequired => ExtendedResponse(
        426,
        body: BaseMessages.upgradeRequired,
      );
  static ExtendedResponse get preConditionRequired => ExtendedResponse(
        428,
        body: BaseMessages.preConditionRequired,
      );
  static ExtendedResponse get tooManyRequest => ExtendedResponse(
        429,
        body: BaseMessages.tooManyRequest,
      );
  static ExtendedResponse get requestHeaderFieldsTooLarge => ExtendedResponse(
        431,
        body: BaseMessages.requestHeaderFieldsTooLarge,
      );
  static ExtendedResponse get unavailableForLegalReason => ExtendedResponse(
        451,
        body: BaseMessages.unavailableForLegalReason,
      );

  /// Server error response
  static ExtendedResponse get internalServerError => ExtendedResponse(
        500,
        body: BaseMessages.internalServerError,
      );
  static ExtendedResponse get notImplemented => ExtendedResponse(
        501,
        body: BaseMessages.notImplemented,
      );
  static ExtendedResponse get badGateway => ExtendedResponse(
        502,
        body: BaseMessages.badGateway,
      );
  static ExtendedResponse get serviceUnavailable => ExtendedResponse(
        503,
        body: BaseMessages.serviceUnavailable,
      );
  static ExtendedResponse get gatewayTimeout => ExtendedResponse(
        504,
        body: BaseMessages.gatewayTimeout,
      );
  static ExtendedResponse get httpVersionNotSupported => ExtendedResponse(
        505,
        body: BaseMessages.httpVersionNotSupported,
      );
  static ExtendedResponse get variantAlsoNegotiates => ExtendedResponse(
        506,
        body: BaseMessages.variantAlsoNegotiates,
      );
  static ExtendedResponse get insufficientStorage => ExtendedResponse(
        507,
        body: BaseMessages.insufficientStorage,
      );
  static ExtendedResponse get loopDetected => ExtendedResponse(
        508,
        body: BaseMessages.loopDetected,
      );
  static ExtendedResponse get notExtended => ExtendedResponse(
        510,
        body: BaseMessages.notExtended,
      );
  static ExtendedResponse get networkAuthenticationRequired => ExtendedResponse(
        511,
        body: BaseMessages.networkAuthenticationRequired,
      );
}
