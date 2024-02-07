import 'package:json_annotation/json_annotation.dart';

import 'connection_type.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse {

  String? id;
  dynamic data;
  ConnectionType? type;
  String? subject;

  BaseResponse({this.id, this.data, this.type, this.subject});

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);

  @override
  String toString() {
    return 'BaseResponse{id: $id, data: $data, type: $type, subject: $subject}';
  }
}