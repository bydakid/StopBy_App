// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VerifiedStruct extends FFFirebaseStruct {
  VerifiedStruct({
    bool? verified,
    bool? blacklist,
    bool? completeProfiel,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _verified = verified,
        _blacklist = blacklist,
        _completeProfiel = completeProfiel,
        super(firestoreUtilData);

  // "verified" field.
  bool? _verified;
  bool get verified => _verified ?? false;
  set verified(bool? val) => _verified = val;
  bool hasVerified() => _verified != null;

  // "blacklist" field.
  bool? _blacklist;
  bool get blacklist => _blacklist ?? false;
  set blacklist(bool? val) => _blacklist = val;
  bool hasBlacklist() => _blacklist != null;

  // "completeProfiel" field.
  bool? _completeProfiel;
  bool get completeProfiel => _completeProfiel ?? false;
  set completeProfiel(bool? val) => _completeProfiel = val;
  bool hasCompleteProfiel() => _completeProfiel != null;

  static VerifiedStruct fromMap(Map<String, dynamic> data) => VerifiedStruct(
        verified: data['verified'] as bool?,
        blacklist: data['blacklist'] as bool?,
        completeProfiel: data['completeProfiel'] as bool?,
      );

  static VerifiedStruct? maybeFromMap(dynamic data) =>
      data is Map ? VerifiedStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'verified': _verified,
        'blacklist': _blacklist,
        'completeProfiel': _completeProfiel,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'verified': serializeParam(
          _verified,
          ParamType.bool,
        ),
        'blacklist': serializeParam(
          _blacklist,
          ParamType.bool,
        ),
        'completeProfiel': serializeParam(
          _completeProfiel,
          ParamType.bool,
        ),
      }.withoutNulls;

  static VerifiedStruct fromSerializableMap(Map<String, dynamic> data) =>
      VerifiedStruct(
        verified: deserializeParam(
          data['verified'],
          ParamType.bool,
          false,
        ),
        blacklist: deserializeParam(
          data['blacklist'],
          ParamType.bool,
          false,
        ),
        completeProfiel: deserializeParam(
          data['completeProfiel'],
          ParamType.bool,
          false,
        ),
      );

  static VerifiedStruct fromAlgoliaData(Map<String, dynamic> data) =>
      VerifiedStruct(
        verified: convertAlgoliaParam(
          data['verified'],
          ParamType.bool,
          false,
        ),
        blacklist: convertAlgoliaParam(
          data['blacklist'],
          ParamType.bool,
          false,
        ),
        completeProfiel: convertAlgoliaParam(
          data['completeProfiel'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'VerifiedStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VerifiedStruct &&
        verified == other.verified &&
        blacklist == other.blacklist &&
        completeProfiel == other.completeProfiel;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([verified, blacklist, completeProfiel]);
}

VerifiedStruct createVerifiedStruct({
  bool? verified,
  bool? blacklist,
  bool? completeProfiel,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    VerifiedStruct(
      verified: verified,
      blacklist: blacklist,
      completeProfiel: completeProfiel,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

VerifiedStruct? updateVerifiedStruct(
  VerifiedStruct? verifiedStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    verifiedStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addVerifiedStructData(
  Map<String, dynamic> firestoreData,
  VerifiedStruct? verifiedStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (verifiedStruct == null) {
    return;
  }
  if (verifiedStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && verifiedStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final verifiedStructData =
      getVerifiedFirestoreData(verifiedStruct, forFieldValue);
  final nestedData =
      verifiedStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = verifiedStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getVerifiedFirestoreData(
  VerifiedStruct? verifiedStruct, [
  bool forFieldValue = false,
]) {
  if (verifiedStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(verifiedStruct.toMap());

  // Add any Firestore field values
  verifiedStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getVerifiedListFirestoreData(
  List<VerifiedStruct>? verifiedStructs,
) =>
    verifiedStructs?.map((e) => getVerifiedFirestoreData(e, true)).toList() ??
    [];
