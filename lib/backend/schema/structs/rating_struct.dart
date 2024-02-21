// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RatingStruct extends FFFirebaseStruct {
  RatingStruct({
    int? total,
    int? count,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _total = total,
        _count = count,
        super(firestoreUtilData);

  // "total" field.
  int? _total;
  int get total => _total ?? 0;
  set total(int? val) => _total = val;
  void incrementTotal(int amount) => _total = total + amount;
  bool hasTotal() => _total != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  set count(int? val) => _count = val;
  void incrementCount(int amount) => _count = count + amount;
  bool hasCount() => _count != null;

  static RatingStruct fromMap(Map<String, dynamic> data) => RatingStruct(
        total: castToType<int>(data['total']),
        count: castToType<int>(data['count']),
      );

  static RatingStruct? maybeFromMap(dynamic data) =>
      data is Map ? RatingStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'total': _total,
        'count': _count,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'total': serializeParam(
          _total,
          ParamType.int,
        ),
        'count': serializeParam(
          _count,
          ParamType.int,
        ),
      }.withoutNulls;

  static RatingStruct fromSerializableMap(Map<String, dynamic> data) =>
      RatingStruct(
        total: deserializeParam(
          data['total'],
          ParamType.int,
          false,
        ),
        count: deserializeParam(
          data['count'],
          ParamType.int,
          false,
        ),
      );

  static RatingStruct fromAlgoliaData(Map<String, dynamic> data) =>
      RatingStruct(
        total: convertAlgoliaParam(
          data['total'],
          ParamType.int,
          false,
        ),
        count: convertAlgoliaParam(
          data['count'],
          ParamType.int,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'RatingStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RatingStruct &&
        total == other.total &&
        count == other.count;
  }

  @override
  int get hashCode => const ListEquality().hash([total, count]);
}

RatingStruct createRatingStruct({
  int? total,
  int? count,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RatingStruct(
      total: total,
      count: count,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RatingStruct? updateRatingStruct(
  RatingStruct? rating, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    rating
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRatingStructData(
  Map<String, dynamic> firestoreData,
  RatingStruct? rating,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (rating == null) {
    return;
  }
  if (rating.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && rating.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final ratingData = getRatingFirestoreData(rating, forFieldValue);
  final nestedData = ratingData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = rating.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRatingFirestoreData(
  RatingStruct? rating, [
  bool forFieldValue = false,
]) {
  if (rating == null) {
    return {};
  }
  final firestoreData = mapToFirestore(rating.toMap());

  // Add any Firestore field values
  rating.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRatingListFirestoreData(
  List<RatingStruct>? ratings,
) =>
    ratings?.map((e) => getRatingFirestoreData(e, true)).toList() ?? [];
