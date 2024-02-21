// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BagStruct extends FFFirebaseStruct {
  BagStruct({
    int? quantity,
    DateTime? timeStart,
    DateTime? timeEnd,
    String? name,
    String? description,
    double? price,
    bool? live,
    String? foodType,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _quantity = quantity,
        _timeStart = timeStart,
        _timeEnd = timeEnd,
        _name = name,
        _description = description,
        _price = price,
        _live = live,
        _foodType = foodType,
        super(firestoreUtilData);

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;
  void incrementQuantity(int amount) => _quantity = quantity + amount;
  bool hasQuantity() => _quantity != null;

  // "timeStart" field.
  DateTime? _timeStart;
  DateTime? get timeStart => _timeStart;
  set timeStart(DateTime? val) => _timeStart = val;
  bool hasTimeStart() => _timeStart != null;

  // "timeEnd" field.
  DateTime? _timeEnd;
  DateTime? get timeEnd => _timeEnd;
  set timeEnd(DateTime? val) => _timeEnd = val;
  bool hasTimeEnd() => _timeEnd != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;
  void incrementPrice(double amount) => _price = price + amount;
  bool hasPrice() => _price != null;

  // "live" field.
  bool? _live;
  bool get live => _live ?? false;
  set live(bool? val) => _live = val;
  bool hasLive() => _live != null;

  // "foodType" field.
  String? _foodType;
  String get foodType => _foodType ?? '';
  set foodType(String? val) => _foodType = val;
  bool hasFoodType() => _foodType != null;

  static BagStruct fromMap(Map<String, dynamic> data) => BagStruct(
        quantity: castToType<int>(data['quantity']),
        timeStart: data['timeStart'] as DateTime?,
        timeEnd: data['timeEnd'] as DateTime?,
        name: data['name'] as String?,
        description: data['description'] as String?,
        price: castToType<double>(data['price']),
        live: data['live'] as bool?,
        foodType: data['foodType'] as String?,
      );

  static BagStruct? maybeFromMap(dynamic data) =>
      data is Map ? BagStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'quantity': _quantity,
        'timeStart': _timeStart,
        'timeEnd': _timeEnd,
        'name': _name,
        'description': _description,
        'price': _price,
        'live': _live,
        'foodType': _foodType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
        'timeStart': serializeParam(
          _timeStart,
          ParamType.DateTime,
        ),
        'timeEnd': serializeParam(
          _timeEnd,
          ParamType.DateTime,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'live': serializeParam(
          _live,
          ParamType.bool,
        ),
        'foodType': serializeParam(
          _foodType,
          ParamType.String,
        ),
      }.withoutNulls;

  static BagStruct fromSerializableMap(Map<String, dynamic> data) => BagStruct(
        quantity: deserializeParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
        timeStart: deserializeParam(
          data['timeStart'],
          ParamType.DateTime,
          false,
        ),
        timeEnd: deserializeParam(
          data['timeEnd'],
          ParamType.DateTime,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        live: deserializeParam(
          data['live'],
          ParamType.bool,
          false,
        ),
        foodType: deserializeParam(
          data['foodType'],
          ParamType.String,
          false,
        ),
      );

  static BagStruct fromAlgoliaData(Map<String, dynamic> data) => BagStruct(
        quantity: convertAlgoliaParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
        timeStart: convertAlgoliaParam(
          data['timeStart'],
          ParamType.DateTime,
          false,
        ),
        timeEnd: convertAlgoliaParam(
          data['timeEnd'],
          ParamType.DateTime,
          false,
        ),
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        description: convertAlgoliaParam(
          data['description'],
          ParamType.String,
          false,
        ),
        price: convertAlgoliaParam(
          data['price'],
          ParamType.double,
          false,
        ),
        live: convertAlgoliaParam(
          data['live'],
          ParamType.bool,
          false,
        ),
        foodType: convertAlgoliaParam(
          data['foodType'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'BagStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BagStruct &&
        quantity == other.quantity &&
        timeStart == other.timeStart &&
        timeEnd == other.timeEnd &&
        name == other.name &&
        description == other.description &&
        price == other.price &&
        live == other.live &&
        foodType == other.foodType;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [quantity, timeStart, timeEnd, name, description, price, live, foodType]);
}

BagStruct createBagStruct({
  int? quantity,
  DateTime? timeStart,
  DateTime? timeEnd,
  String? name,
  String? description,
  double? price,
  bool? live,
  String? foodType,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BagStruct(
      quantity: quantity,
      timeStart: timeStart,
      timeEnd: timeEnd,
      name: name,
      description: description,
      price: price,
      live: live,
      foodType: foodType,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BagStruct? updateBagStruct(
  BagStruct? bag, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    bag
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBagStructData(
  Map<String, dynamic> firestoreData,
  BagStruct? bag,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (bag == null) {
    return;
  }
  if (bag.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && bag.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final bagData = getBagFirestoreData(bag, forFieldValue);
  final nestedData = bagData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = bag.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBagFirestoreData(
  BagStruct? bag, [
  bool forFieldValue = false,
]) {
  if (bag == null) {
    return {};
  }
  final firestoreData = mapToFirestore(bag.toMap());

  // Add any Firestore field values
  bag.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBagListFirestoreData(
  List<BagStruct>? bags,
) =>
    bags?.map((e) => getBagFirestoreData(e, true)).toList() ?? [];
