// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FeaturesStruct extends FFFirebaseStruct {
  FeaturesStruct({
    bool? mysteryBag,
    bool? worldMenu,
    bool? saleMenu,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _mysteryBag = mysteryBag,
        _worldMenu = worldMenu,
        _saleMenu = saleMenu,
        super(firestoreUtilData);

  // "MysteryBag" field.
  bool? _mysteryBag;
  bool get mysteryBag => _mysteryBag ?? false;
  set mysteryBag(bool? val) => _mysteryBag = val;
  bool hasMysteryBag() => _mysteryBag != null;

  // "WorldMenu" field.
  bool? _worldMenu;
  bool get worldMenu => _worldMenu ?? false;
  set worldMenu(bool? val) => _worldMenu = val;
  bool hasWorldMenu() => _worldMenu != null;

  // "SaleMenu" field.
  bool? _saleMenu;
  bool get saleMenu => _saleMenu ?? false;
  set saleMenu(bool? val) => _saleMenu = val;
  bool hasSaleMenu() => _saleMenu != null;

  static FeaturesStruct fromMap(Map<String, dynamic> data) => FeaturesStruct(
        mysteryBag: data['MysteryBag'] as bool?,
        worldMenu: data['WorldMenu'] as bool?,
        saleMenu: data['SaleMenu'] as bool?,
      );

  static FeaturesStruct? maybeFromMap(dynamic data) =>
      data is Map ? FeaturesStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'MysteryBag': _mysteryBag,
        'WorldMenu': _worldMenu,
        'SaleMenu': _saleMenu,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'MysteryBag': serializeParam(
          _mysteryBag,
          ParamType.bool,
        ),
        'WorldMenu': serializeParam(
          _worldMenu,
          ParamType.bool,
        ),
        'SaleMenu': serializeParam(
          _saleMenu,
          ParamType.bool,
        ),
      }.withoutNulls;

  static FeaturesStruct fromSerializableMap(Map<String, dynamic> data) =>
      FeaturesStruct(
        mysteryBag: deserializeParam(
          data['MysteryBag'],
          ParamType.bool,
          false,
        ),
        worldMenu: deserializeParam(
          data['WorldMenu'],
          ParamType.bool,
          false,
        ),
        saleMenu: deserializeParam(
          data['SaleMenu'],
          ParamType.bool,
          false,
        ),
      );

  static FeaturesStruct fromAlgoliaData(Map<String, dynamic> data) =>
      FeaturesStruct(
        mysteryBag: convertAlgoliaParam(
          data['MysteryBag'],
          ParamType.bool,
          false,
        ),
        worldMenu: convertAlgoliaParam(
          data['WorldMenu'],
          ParamType.bool,
          false,
        ),
        saleMenu: convertAlgoliaParam(
          data['SaleMenu'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'FeaturesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FeaturesStruct &&
        mysteryBag == other.mysteryBag &&
        worldMenu == other.worldMenu &&
        saleMenu == other.saleMenu;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([mysteryBag, worldMenu, saleMenu]);
}

FeaturesStruct createFeaturesStruct({
  bool? mysteryBag,
  bool? worldMenu,
  bool? saleMenu,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FeaturesStruct(
      mysteryBag: mysteryBag,
      worldMenu: worldMenu,
      saleMenu: saleMenu,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FeaturesStruct? updateFeaturesStruct(
  FeaturesStruct? features, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    features
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFeaturesStructData(
  Map<String, dynamic> firestoreData,
  FeaturesStruct? features,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (features == null) {
    return;
  }
  if (features.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && features.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final featuresData = getFeaturesFirestoreData(features, forFieldValue);
  final nestedData = featuresData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = features.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFeaturesFirestoreData(
  FeaturesStruct? features, [
  bool forFieldValue = false,
]) {
  if (features == null) {
    return {};
  }
  final firestoreData = mapToFirestore(features.toMap());

  // Add any Firestore field values
  features.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFeaturesListFirestoreData(
  List<FeaturesStruct>? featuress,
) =>
    featuress?.map((e) => getFeaturesFirestoreData(e, true)).toList() ?? [];
