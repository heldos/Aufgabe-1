//
//  Generated code. Do not modify.
//  source: temperature.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'temperature.pb.dart' as $0;

export 'temperature.pb.dart';

@$pb.GrpcServiceName('temperature.v1.TemperatureService')
class TemperatureServiceClient extends $grpc.Client {
  static final _$celsiusToKelvin = $grpc.ClientMethod<$0.CelsiusToKelvinRequest, $0.CelsiusToKelvinResponse>(
      '/temperature.v1.TemperatureService/CelsiusToKelvin',
      ($0.CelsiusToKelvinRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CelsiusToKelvinResponse.fromBuffer(value));

  TemperatureServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.CelsiusToKelvinResponse> celsiusToKelvin($0.CelsiusToKelvinRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$celsiusToKelvin, request, options: options);
  }
}

@$pb.GrpcServiceName('temperature.v1.TemperatureService')
abstract class TemperatureServiceBase extends $grpc.Service {
  $core.String get $name => 'temperature.v1.TemperatureService';

  TemperatureServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CelsiusToKelvinRequest, $0.CelsiusToKelvinResponse>(
        'CelsiusToKelvin',
        celsiusToKelvin_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CelsiusToKelvinRequest.fromBuffer(value),
        ($0.CelsiusToKelvinResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.CelsiusToKelvinResponse> celsiusToKelvin_Pre($grpc.ServiceCall call, $async.Future<$0.CelsiusToKelvinRequest> request) async {
    return celsiusToKelvin(call, await request);
  }

  $async.Future<$0.CelsiusToKelvinResponse> celsiusToKelvin($grpc.ServiceCall call, $0.CelsiusToKelvinRequest request);
}
