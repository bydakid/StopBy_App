// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EarningStruct extends FFFirebaseStruct {
  EarningStruct({
    int? itemsSold,
    double? totalSales,
    double? finalPayout,
    String? payoutDate,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _itemsSold = itemsSold,
        _totalSales = totalSales,
        _finalPayout = finalPayout,
        _payoutDate = payoutDate,
        super(firestoreUtilData);

  // "items_sold" field.
  int? _itemsSold;
  int get itemsSold => _itemsSold ?? 0;
  set itemsSold(int? val) => _itemsSold = val;
  void incrementItemsSold(int amount) => _itemsSold = itemsSold + amount;
  bool hasItemsSold() => _itemsSold != null;

  // "total_sales" field.
  double? _totalSales;
  double get totalSales => _totalSales ?? 0.0;
  set totalSales(double? val) => _totalSales = val;
  void incrementTotalSales(double amount) => _totalSales = totalSales + amount;
  bool hasTotalSales() => _totalSales != null;

  // "final_payout" field.
  double? _finalPayout;
  double get finalPayout => _finalPayout ?? 0.0;
  set finalPayout(double? val) => _finalPayout = val;
  void incrementFinalPayout(double amount) =>
      _finalPayout = finalPayout + amount;
  bool hasFinalPayout() => _finalPayout != null;

  // "payout_date" field.
  String? _payoutDate;
  String get payoutDate => _payoutDate ?? '';
  set payoutDate(String? val) => _payoutDate = val;
  bool hasPayoutDate() => _payoutDate != null;

  static EarningStruct fromMap(Map<String, dynamic> data) => EarningStruct(
        itemsSold: castToType<int>(data['items_sold']),
        totalSales: castToType<double>(data['total_sales']),
        finalPayout: castToType<double>(data['final_payout']),
        payoutDate: data['payout_date'] as String?,
      );

  static EarningStruct? maybeFromMap(dynamic data) =>
      data is Map ? EarningStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'items_sold': _itemsSold,
        'total_sales': _totalSales,
        'final_payout': _finalPayout,
        'payout_date': _payoutDate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'items_sold': serializeParam(
          _itemsSold,
          ParamType.int,
        ),
        'total_sales': serializeParam(
          _totalSales,
          ParamType.double,
        ),
        'final_payout': serializeParam(
          _finalPayout,
          ParamType.double,
        ),
        'payout_date': serializeParam(
          _payoutDate,
          ParamType.String,
        ),
      }.withoutNulls;

  static EarningStruct fromSerializableMap(Map<String, dynamic> data) =>
      EarningStruct(
        itemsSold: deserializeParam(
          data['items_sold'],
          ParamType.int,
          false,
        ),
        totalSales: deserializeParam(
          data['total_sales'],
          ParamType.double,
          false,
        ),
        finalPayout: deserializeParam(
          data['final_payout'],
          ParamType.double,
          false,
        ),
        payoutDate: deserializeParam(
          data['payout_date'],
          ParamType.String,
          false,
        ),
      );

  static EarningStruct fromAlgoliaData(Map<String, dynamic> data) =>
      EarningStruct(
        itemsSold: convertAlgoliaParam(
          data['items_sold'],
          ParamType.int,
          false,
        ),
        totalSales: convertAlgoliaParam(
          data['total_sales'],
          ParamType.double,
          false,
        ),
        finalPayout: convertAlgoliaParam(
          data['final_payout'],
          ParamType.double,
          false,
        ),
        payoutDate: convertAlgoliaParam(
          data['payout_date'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'EarningStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EarningStruct &&
        itemsSold == other.itemsSold &&
        totalSales == other.totalSales &&
        finalPayout == other.finalPayout &&
        payoutDate == other.payoutDate;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([itemsSold, totalSales, finalPayout, payoutDate]);
}

EarningStruct createEarningStruct({
  int? itemsSold,
  double? totalSales,
  double? finalPayout,
  String? payoutDate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EarningStruct(
      itemsSold: itemsSold,
      totalSales: totalSales,
      finalPayout: finalPayout,
      payoutDate: payoutDate,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EarningStruct? updateEarningStruct(
  EarningStruct? earning, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    earning
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEarningStructData(
  Map<String, dynamic> firestoreData,
  EarningStruct? earning,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (earning == null) {
    return;
  }
  if (earning.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && earning.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final earningData = getEarningFirestoreData(earning, forFieldValue);
  final nestedData = earningData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = earning.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEarningFirestoreData(
  EarningStruct? earning, [
  bool forFieldValue = false,
]) {
  if (earning == null) {
    return {};
  }
  final firestoreData = mapToFirestore(earning.toMap());

  // Add any Firestore field values
  earning.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEarningListFirestoreData(
  List<EarningStruct>? earnings,
) =>
    earnings?.map((e) => getEarningFirestoreData(e, true)).toList() ?? [];
