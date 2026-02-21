//
//  Generated code. Do not modify.
//  source: temperature.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class CelsiusToKelvinRequest extends $pb.GeneratedMessage {
  factory CelsiusToKelvinRequest({
    $core.double? celsius,
  }) {
    final $result = create();
    if (celsius != null) {
      $result.celsius = celsius;
    }
    return $result;
  }
  CelsiusToKelvinRequest._() : super();
  factory CelsiusToKelvinRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CelsiusToKelvinRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CelsiusToKelvinRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'temperature.v1'), createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'celsius', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CelsiusToKelvinRequest clone() => CelsiusToKelvinRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CelsiusToKelvinRequest copyWith(void Function(CelsiusToKelvinRequest) updates) => super.copyWith((message) => updates(message as CelsiusToKelvinRequest)) as CelsiusToKelvinRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CelsiusToKelvinRequest create() => CelsiusToKelvinRequest._();
  CelsiusToKelvinRequest createEmptyInstance() => create();
  static $pb.PbList<CelsiusToKelvinRequest> createRepeated() => $pb.PbList<CelsiusToKelvinRequest>();
  @$core.pragma('dart2js:noInline')
  static CelsiusToKelvinRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CelsiusToKelvinRequest>(create);
  static CelsiusToKelvinRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get celsius => $_getN(0);
  @$pb.TagNumber(1)
  set celsius($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCelsius() => $_has(0);
  @$pb.TagNumber(1)
  void clearCelsius() => clearField(1);
}

class CelsiusToKelvinResponse extends $pb.GeneratedMessage {
  factory CelsiusToKelvinResponse({
    $core.double? kelvin,
  }) {
    final $result = create();
    if (kelvin != null) {
      $result.kelvin = kelvin;
    }
    return $result;
  }
  CelsiusToKelvinResponse._() : super();
  factory CelsiusToKelvinResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CelsiusToKelvinResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CelsiusToKelvinResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'temperature.v1'), createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'kelvin', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CelsiusToKelvinResponse clone() => CelsiusToKelvinResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CelsiusToKelvinResponse copyWith(void Function(CelsiusToKelvinResponse) updates) => super.copyWith((message) => updates(message as CelsiusToKelvinResponse)) as CelsiusToKelvinResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CelsiusToKelvinResponse create() => CelsiusToKelvinResponse._();
  CelsiusToKelvinResponse createEmptyInstance() => create();
  static $pb.PbList<CelsiusToKelvinResponse> createRepeated() => $pb.PbList<CelsiusToKelvinResponse>();
  @$core.pragma('dart2js:noInline')
  static CelsiusToKelvinResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CelsiusToKelvinResponse>(create);
  static CelsiusToKelvinResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get kelvin => $_getN(0);
  @$pb.TagNumber(1)
  set kelvin($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKelvin() => $_has(0);
  @$pb.TagNumber(1)
  void clearKelvin() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
