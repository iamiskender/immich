//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CuratedObjectsResponseDto {
  /// Returns a new [CuratedObjectsResponseDto] instance.
  CuratedObjectsResponseDto({
    required this.id,
    required this.object,
    required this.resizePath,
    required this.deviceAssetId,
    required this.deviceId,
  });

  String id;

  String object;

  String resizePath;

  String deviceAssetId;

  String deviceId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CuratedObjectsResponseDto &&
     other.id == id &&
     other.object == object &&
     other.resizePath == resizePath &&
     other.deviceAssetId == deviceAssetId &&
     other.deviceId == deviceId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (object.hashCode) +
    (resizePath.hashCode) +
    (deviceAssetId.hashCode) +
    (deviceId.hashCode);

  @override
  String toString() => 'CuratedObjectsResponseDto[id=$id, object=$object, resizePath=$resizePath, deviceAssetId=$deviceAssetId, deviceId=$deviceId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'object'] = this.object;
      json[r'resizePath'] = this.resizePath;
      json[r'deviceAssetId'] = this.deviceAssetId;
      json[r'deviceId'] = this.deviceId;
    return json;
  }

  /// Returns a new [CuratedObjectsResponseDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CuratedObjectsResponseDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      return CuratedObjectsResponseDto(
        id: mapValueOfType<String>(json, r'id')!,
        object: mapValueOfType<String>(json, r'object')!,
        resizePath: mapValueOfType<String>(json, r'resizePath')!,
        deviceAssetId: mapValueOfType<String>(json, r'deviceAssetId')!,
        deviceId: mapValueOfType<String>(json, r'deviceId')!,
      );
    }
    return null;
  }

  static List<CuratedObjectsResponseDto> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CuratedObjectsResponseDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CuratedObjectsResponseDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CuratedObjectsResponseDto> mapFromJson(dynamic json) {
    final map = <String, CuratedObjectsResponseDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CuratedObjectsResponseDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CuratedObjectsResponseDto-objects as value to a dart map
  static Map<String, List<CuratedObjectsResponseDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CuratedObjectsResponseDto>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CuratedObjectsResponseDto.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'object',
    'resizePath',
    'deviceAssetId',
    'deviceId',
  };
}

