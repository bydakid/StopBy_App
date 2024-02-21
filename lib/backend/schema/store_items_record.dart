import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StoreItemsRecord extends FirestoreRecord {
  StoreItemsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "unit" field.
  int? _unit;
  int get unit => _unit ?? 0;
  bool hasUnit() => _unit != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "mystery_bag" field.
  bool? _mysteryBag;
  bool get mysteryBag => _mysteryBag ?? false;
  bool hasMysteryBag() => _mysteryBag != null;

  // "sale_menu" field.
  bool? _saleMenu;
  bool get saleMenu => _saleMenu ?? false;
  bool hasSaleMenu() => _saleMenu != null;

  // "earth_menu" field.
  bool? _earthMenu;
  bool get earthMenu => _earthMenu ?? false;
  bool hasEarthMenu() => _earthMenu != null;

  // "store_ref" field.
  DocumentReference? _storeRef;
  DocumentReference? get storeRef => _storeRef;
  bool hasStoreRef() => _storeRef != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _active = snapshotData['active'] as bool?;
    _unit = castToType<int>(snapshotData['unit']);
    _price = castToType<double>(snapshotData['price']);
    _image = snapshotData['image'] as String?;
    _description = snapshotData['description'] as String?;
    _mysteryBag = snapshotData['mystery_bag'] as bool?;
    _saleMenu = snapshotData['sale_menu'] as bool?;
    _earthMenu = snapshotData['earth_menu'] as bool?;
    _storeRef = snapshotData['store_ref'] as DocumentReference?;
    _category = snapshotData['category'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('store_items');

  static Stream<StoreItemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StoreItemsRecord.fromSnapshot(s));

  static Future<StoreItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StoreItemsRecord.fromSnapshot(s));

  static StoreItemsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StoreItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StoreItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StoreItemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StoreItemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StoreItemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStoreItemsRecordData({
  String? name,
  bool? active,
  int? unit,
  double? price,
  String? image,
  String? description,
  bool? mysteryBag,
  bool? saleMenu,
  bool? earthMenu,
  DocumentReference? storeRef,
  String? category,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'active': active,
      'unit': unit,
      'price': price,
      'image': image,
      'description': description,
      'mystery_bag': mysteryBag,
      'sale_menu': saleMenu,
      'earth_menu': earthMenu,
      'store_ref': storeRef,
      'category': category,
    }.withoutNulls,
  );

  return firestoreData;
}

class StoreItemsRecordDocumentEquality implements Equality<StoreItemsRecord> {
  const StoreItemsRecordDocumentEquality();

  @override
  bool equals(StoreItemsRecord? e1, StoreItemsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.active == e2?.active &&
        e1?.unit == e2?.unit &&
        e1?.price == e2?.price &&
        e1?.image == e2?.image &&
        e1?.description == e2?.description &&
        e1?.mysteryBag == e2?.mysteryBag &&
        e1?.saleMenu == e2?.saleMenu &&
        e1?.earthMenu == e2?.earthMenu &&
        e1?.storeRef == e2?.storeRef &&
        e1?.category == e2?.category;
  }

  @override
  int hash(StoreItemsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.active,
        e?.unit,
        e?.price,
        e?.image,
        e?.description,
        e?.mysteryBag,
        e?.saleMenu,
        e?.earthMenu,
        e?.storeRef,
        e?.category
      ]);

  @override
  bool isValidKey(Object? o) => o is StoreItemsRecord;
}
