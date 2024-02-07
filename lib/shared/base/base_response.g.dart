// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse(
      id: json['id'] as String?,
      data: json['data'],
      type: $enumDecodeNullable(_$ConnectionTypeEnumMap, json['type']),
      subject: json['subject'] as String?,
    );

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'data': instance.data,
      'type': _$ConnectionTypeEnumMap[instance.type],
      'subject': instance.subject,
    };

const _$ConnectionTypeEnumMap = {
  ConnectionType.welcome: 'welcome',
  ConnectionType.subscribe: 'subscribe',
  ConnectionType.ack: 'ack',
  ConnectionType.message: 'message',
  ConnectionType.error: 'error',
};
