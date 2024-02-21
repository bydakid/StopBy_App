import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "picked_up" field.
  bool? _pickedUp;
  bool get pickedUp => _pickedUp ?? false;
  bool hasPickedUp() => _pickedUp != null;

  // "store_refx" field.
  DocumentReference? _storeRefx;
  DocumentReference? get storeRefx => _storeRefx;
  bool hasStoreRefx() => _storeRefx != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "number_order" field.
  int? _numberOrder;
  int get numberOrder => _numberOrder ?? 0;
  bool hasNumberOrder() => _numberOrder != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "priceToPay" field.
  double? _priceToPay;
  double get priceToPay => _priceToPay ?? 0.0;
  bool hasPriceToPay() => _priceToPay != null;

  void _initializeFields() {
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _quantity = castToType<int>(snapshotData['quantity']);
    _pickedUp = snapshotData['picked_up'] as bool?;
    _storeRefx = snapshotData['store_refx'] as DocumentReference?;
    _time = snapshotData['time'] as DateTime?;
    _numberOrder = castToType<int>(snapshotData['number_order']);
    _userName = snapshotData['user_name'] as String?;
    _priceToPay = castToType<double>(snapshotData['priceToPay']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orders');

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  DocumentReference? userRef,
  int? quantity,
  bool? pickedUp,
  DocumentReference? storeRefx,
  DateTime? time,
  int? numberOrder,
  String? userName,
  double? priceToPay,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_ref': userRef,
      'quantity': quantity,
      'picked_up': pickedUp,
      'store_refx': storeRefx,
      'time': time,
      'number_order': numberOrder,
      'user_name': userName,
      'priceToPay': priceToPay,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.quantity == e2?.quantity &&
        e1?.pickedUp == e2?.pickedUp &&
        e1?.storeRefx == e2?.storeRefx &&
        e1?.time == e2?.time &&
        e1?.numberOrder == e2?.numberOrder &&
        e1?.userName == e2?.userName &&
        e1?.priceToPay == e2?.priceToPay;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.quantity,
        e?.pickedUp,
        e?.storeRefx,
        e?.time,
        e?.numberOrder,
        e?.userName,
        e?.priceToPay
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
