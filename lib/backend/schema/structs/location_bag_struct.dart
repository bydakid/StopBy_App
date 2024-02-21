// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocationBagStruct extends FFFirebaseStruct {
  LocationBagStruct({
    String? city,
    String? name,
    String? zipcode,
    String? address,
    String? country,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _city = city,
        _name = name,
        _zipcode = zipcode,
        _address = address,
        _country = country,
        super(firestoreUtilData);

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;
  bool hasCity() => _city != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "zipcode" field.
  String? _zipcode;
  String get zipcode => _zipcode ?? '';
  set zipcode(String? val) => _zipcode = val;
  bool hasZipcode() => _zipcode != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;
  bool hasAddress() => _address != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;
  bool hasCountry() => _country != null;

  static LocationBagStruct fromMap(Map<String, dynamic> data) =>
      LocationBagStruct(
        city: data['city'] as String?,
        name: data['name'] as String?,
        zipcode: data['zipcode'] as String?,
        address: data['address'] as String?,
        country: data['country'] as String?,
      );

  static LocationBagStruct? maybeFromMap(dynamic data) => data is Map
      ? LocationBagStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'city': _city,
        'name': _name,
        'zipcode': _zipcode,
        'address': _address,
        'country': _country,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'zipcode': serializeParam(
          _zipcode,
          ParamType.String,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'country': serializeParam(
          _country,
          ParamType.String,
        ),
      }.withoutNulls;

  static LocationBagStruct fromSerializableMap(Map<String, dynamic> data) =>
      LocationBagStruct(
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        zipcode: deserializeParam(
          data['zipcode'],
          ParamType.String,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        country: deserializeParam(
          data['country'],
          ParamType.String,
          false,
        ),
      );

  static LocationBagStruct fromAlgoliaData(Map<String, dynamic> data) =>
      LocationBagStruct(
        city: convertAlgoliaParam(
          data['city'],
          ParamType.String,
          false,
        ),
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        zipcode: convertAlgoliaParam(
          data['zipcode'],
          ParamType.String,
          false,
        ),
        address: convertAlgoliaParam(
          data['address'],
          ParamType.String,
          false,
        ),
        country: convertAlgoliaParam(
          data['country'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'LocationBagStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LocationBagStruct &&
        city == other.city &&
        name == other.name &&
        zipcode == other.zipcode &&
        address == other.address &&
        country == other.country;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([city, name, zipcode, address, country]);
}

LocationBagStruct createLocationBagStruct({
  String? city,
  String? name,
  String? zipcode,
  String? address,
  String? country,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LocationBagStruct(
      city: city,
      name: name,
      zipcode: zipcode,
      address: address,
      country: country,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LocationBagStruct? updateLocationBagStruct(
  LocationBagStruct? locationBag, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    locationBag
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLocationBagStructData(
  Map<String, dynamic> firestoreData,
  LocationBagStruct? locationBag,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (locationBag == null) {
    return;
  }
  if (locationBag.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && locationBag.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final locationBagData =
      getLocationBagFirestoreData(locationBag, forFieldValue);
  final nestedData =
      locationBagData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = locationBag.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLocationBagFirestoreData(
  LocationBagStruct? locationBag, [
  bool forFieldValue = false,
]) {
  if (locationBag == null) {
    return {};
  }
  final firestoreData = mapToFirestore(locationBag.toMap());

  // Add any Firestore field values
  locationBag.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLocationBagListFirestoreData(
  List<LocationBagStruct>? locationBags,
) =>
    locationBags?.map((e) => getLocationBagFirestoreData(e, true)).toList() ??
    [];
