// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SustainStruct extends FFFirebaseStruct {
  SustainStruct({
    double? co2,
    double? moneySaved,
    double? foodWeight,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _co2 = co2,
        _moneySaved = moneySaved,
        _foodWeight = foodWeight,
        super(firestoreUtilData);

  // "co2" field.
  double? _co2;
  double get co2 => _co2 ?? 0.0;
  set co2(double? val) => _co2 = val;
  void incrementCo2(double amount) => _co2 = co2 + amount;
  bool hasCo2() => _co2 != null;

  // "money_saved" field.
  double? _moneySaved;
  double get moneySaved => _moneySaved ?? 0.0;
  set moneySaved(double? val) => _moneySaved = val;
  void incrementMoneySaved(double amount) => _moneySaved = moneySaved + amount;
  bool hasMoneySaved() => _moneySaved != null;

  // "food_weight" field.
  double? _foodWeight;
  double get foodWeight => _foodWeight ?? 0.0;
  set foodWeight(double? val) => _foodWeight = val;
  void incrementFoodWeight(double amount) => _foodWeight = foodWeight + amount;
  bool hasFoodWeight() => _foodWeight != null;

  static SustainStruct fromMap(Map<String, dynamic> data) => SustainStruct(
        co2: castToType<double>(data['co2']),
        moneySaved: castToType<double>(data['money_saved']),
        foodWeight: castToType<double>(data['food_weight']),
      );

  static SustainStruct? maybeFromMap(dynamic data) =>
      data is Map ? SustainStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'co2': _co2,
        'money_saved': _moneySaved,
        'food_weight': _foodWeight,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'co2': serializeParam(
          _co2,
          ParamType.double,
        ),
        'money_saved': serializeParam(
          _moneySaved,
          ParamType.double,
        ),
        'food_weight': serializeParam(
          _foodWeight,
          ParamType.double,
        ),
      }.withoutNulls;

  static SustainStruct fromSerializableMap(Map<String, dynamic> data) =>
      SustainStruct(
        co2: deserializeParam(
          data['co2'],
          ParamType.double,
          false,
        ),
        moneySaved: deserializeParam(
          data['money_saved'],
          ParamType.double,
          false,
        ),
        foodWeight: deserializeParam(
          data['food_weight'],
          ParamType.double,
          false,
        ),
      );

  static SustainStruct fromAlgoliaData(Map<String, dynamic> data) =>
      SustainStruct(
        co2: convertAlgoliaParam(
          data['co2'],
          ParamType.double,
          false,
        ),
        moneySaved: convertAlgoliaParam(
          data['money_saved'],
          ParamType.double,
          false,
        ),
        foodWeight: convertAlgoliaParam(
          data['food_weight'],
          ParamType.double,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'SustainStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SustainStruct &&
        co2 == other.co2 &&
        moneySaved == other.moneySaved &&
        foodWeight == other.foodWeight;
  }

  @override
  int get hashCode => const ListEquality().hash([co2, moneySaved, foodWeight]);
}

SustainStruct createSustainStruct({
  double? co2,
  double? moneySaved,
  double? foodWeight,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SustainStruct(
      co2: co2,
      moneySaved: moneySaved,
      foodWeight: foodWeight,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SustainStruct? updateSustainStruct(
  SustainStruct? sustain, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    sustain
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSustainStructData(
  Map<String, dynamic> firestoreData,
  SustainStruct? sustain,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (sustain == null) {
    return;
  }
  if (sustain.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && sustain.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final sustainData = getSustainFirestoreData(sustain, forFieldValue);
  final nestedData = sustainData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = sustain.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSustainFirestoreData(
  SustainStruct? sustain, [
  bool forFieldValue = false,
]) {
  if (sustain == null) {
    return {};
  }
  final firestoreData = mapToFirestore(sustain.toMap());

  // Add any Firestore field values
  sustain.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSustainListFirestoreData(
  List<SustainStruct>? sustains,
) =>
    sustains?.map((e) => getSustainFirestoreData(e, true)).toList() ?? [];
