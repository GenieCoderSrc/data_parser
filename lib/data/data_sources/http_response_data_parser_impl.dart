import 'package:data_parser/data/data_sources/i_data_sources/i_http_response_data_parser.dart';
import 'package:flutter/foundation.dart';

class HttpResponseDataParserImpl extends IHttpResponseDataParser {
  @override
  Map<String, dynamic>? parseHttpResponse(Map<String, dynamic>? json) {
    debugPrint(
        'HttpResponseHandlerService | handleResponse | json: ${json.toString()}');
    // todo! return only json | not json?['data']
    // todo create model as json response to taking response data with status & message
    if (json?['status'] == true && json?['data'] != null) {
      return json?['data'] == true ? json : json?['data'];
    }
    return json;
  }
}
