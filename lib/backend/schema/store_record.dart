import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StoreRecord extends FirestoreRecord {
  StoreRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "store_type" field.
  String? _storeType;
  String get storeType => _storeType ?? '';
  bool hasStoreType() => _storeType != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "location" field.
  LocationBagStruct? _location;
  LocationBagStruct get location => _location ?? LocationBagStruct();
  bool hasLocation() => _location != null;

  // "latLng" field.
  LatLng? _latLng;
  LatLng? get latLng => _latLng;
  bool hasLatLng() => _latLng != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  // "background_picture" field.
  String? _backgroundPicture;
  String get backgroundPicture => _backgroundPicture ?? '';
  bool hasBackgroundPicture() => _backgroundPicture != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "opening_time" field.
  DateTime? _openingTime;
  DateTime? get openingTime => _openingTime;
  bool hasOpeningTime() => _openingTime != null;

  // "closing_time" field.
  DateTime? _closingTime;
  DateTime? get closingTime => _closingTime;
  bool hasClosingTime() => _closingTime != null;

  // "rating" field.
  RatingStruct? _rating;
  RatingStruct get rating => _rating ?? RatingStruct();
  bool hasRating() => _rating != null;

  // "sustain" field.
  SustainStruct? _sustain;
  SustainStruct get sustain => _sustain ?? SustainStruct();
  bool hasSustain() => _sustain != null;

  // "earning" field.
  EarningStruct? _earning;
  EarningStruct get earning => _earning ?? EarningStruct();
  bool hasEarning() => _earning != null;

  // "verified" field.
  VerifiedStruct? _verified;
  VerifiedStruct get verified => _verified ?? VerifiedStruct();
  bool hasVerified() => _verified != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "features" field.
  FeaturesStruct? _features;
  FeaturesStruct get features => _features ?? FeaturesStruct();
  bool hasFeatures() => _features != null;

  // "bag" field.
  BagStruct? _bag;
  BagStruct get bag => _bag ?? BagStruct();
  bool hasBag() => _bag != null;

  // "openOrder" field.
  int? _openOrder;
  int get openOrder => _openOrder ?? 0;
  bool hasOpenOrder() => _openOrder != null;

  void _initializeFields() {
    _storeType = snapshotData['store_type'] as String?;
    _country = snapshotData['country'] as String?;
    _location = LocationBagStruct.maybeFromMap(snapshotData['location']);
    _latLng = snapshotData['latLng'] as LatLng?;
    _user = snapshotData['user'] as DocumentReference?;
    _logo = snapshotData['logo'] as String?;
    _backgroundPicture = snapshotData['background_picture'] as String?;
    _phone = snapshotData['phone'] as String?;
    _openingTime = snapshotData['opening_time'] as DateTime?;
    _closingTime = snapshotData['closing_time'] as DateTime?;
    _rating = RatingStruct.maybeFromMap(snapshotData['rating']);
    _sustain = SustainStruct.maybeFromMap(snapshotData['sustain']);
    _earning = EarningStruct.maybeFromMap(snapshotData['earning']);
    _verified = VerifiedStruct.maybeFromMap(snapshotData['verified']);
    _email = snapshotData['email'] as String?;
    _features = FeaturesStruct.maybeFromMap(snapshotData['features']);
    _bag = BagStruct.maybeFromMap(snapshotData['bag']);
    _openOrder = castToType<int>(snapshotData['openOrder']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('store');

  static Stream<StoreRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StoreRecord.fromSnapshot(s));

  static Future<StoreRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StoreRecord.fromSnapshot(s));

  static StoreRecord fromSnapshot(DocumentSnapshot snapshot) => StoreRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StoreRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StoreRecord._(reference, mapFromFirestore(data));

  static StoreRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      StoreRecord.getDocumentFromData(
        {
          'store_type': snapshot.data['store_type'],
          'country': snapshot.data['country'],
          'location':
              LocationBagStruct.fromAlgoliaData(snapshot.data['location'] ?? {})
                  .toMap(),
          'latLng': convertAlgoliaParam(
            snapshot.data,
            ParamType.LatLng,
            false,
          ),
          'user': convertAlgoliaParam(
            snapshot.data['user'],
            ParamType.DocumentReference,
            false,
          ),
          'logo': snapshot.data['logo'],
          'background_picture': snapshot.data['background_picture'],
          'phone': snapshot.data['phone'],
          'opening_time': convertAlgoliaParam(
            snapshot.data['opening_time'],
            ParamType.DateTime,
            false,
          ),
          'closing_time': convertAlgoliaParam(
            snapshot.data['closing_time'],
            ParamType.DateTime,
            false,
          ),
          'rating': RatingStruct.fromAlgoliaData(snapshot.data['rating'] ?? {})
              .toMap(),
          'sustain':
              SustainStruct.fromAlgoliaData(snapshot.data['sustain'] ?? {})
                  .toMap(),
          'earning':
              EarningStruct.fromAlgoliaData(snapshot.data['earning'] ?? {})
                  .toMap(),
          'verified':
              VerifiedStruct.fromAlgoliaData(snapshot.data['verified'] ?? {})
                  .toMap(),
          'email': snapshot.data['email'],
          'features':
              FeaturesStruct.fromAlgoliaData(snapshot.data['features'] ?? {})
                  .toMap(),
          'bag': BagStruct.fromAlgoliaData(snapshot.data['bag'] ?? {}).toMap(),
          'openOrder': convertAlgoliaParam(
            snapshot.data['openOrder'],
            ParamType.int,
            false,
          ),
        },
        StoreRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<StoreRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'store',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'StoreRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StoreRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStoreRecordData({
  String? storeType,
  String? country,
  LocationBagStruct? location,
  LatLng? latLng,
  DocumentReference? user,
  String? logo,
  String? backgroundPicture,
  String? phone,
  DateTime? openingTime,
  DateTime? closingTime,
  RatingStruct? rating,
  SustainStruct? sustain,
  EarningStruct? earning,
  VerifiedStruct? verified,
  String? email,
  FeaturesStruct? features,
  BagStruct? bag,
  int? openOrder,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'store_type': storeType,
      'country': country,
      'location': LocationBagStruct().toMap(),
      'latLng': latLng,
      'user': user,
      'logo': logo,
      'background_picture': backgroundPicture,
      'phone': phone,
      'opening_time': openingTime,
      'closing_time': closingTime,
      'rating': RatingStruct().toMap(),
      'sustain': SustainStruct().toMap(),
      'earning': EarningStruct().toMap(),
      'verified': VerifiedStruct().toMap(),
      'email': email,
      'features': FeaturesStruct().toMap(),
      'bag': BagStruct().toMap(),
      'openOrder': openOrder,
    }.withoutNulls,
  );

  // Handle nested data for "location" field.
  addLocationBagStructData(firestoreData, location, 'location');

  // Handle nested data for "rating" field.
  addRatingStructData(firestoreData, rating, 'rating');

  // Handle nested data for "sustain" field.
  addSustainStructData(firestoreData, sustain, 'sustain');

  // Handle nested data for "earning" field.
  addEarningStructData(firestoreData, earning, 'earning');

  // Handle nested data for "verified" field.
  addVerifiedStructData(firestoreData, verified, 'verified');

  // Handle nested data for "features" field.
  addFeaturesStructData(firestoreData, features, 'features');

  // Handle nested data for "bag" field.
  addBagStructData(firestoreData, bag, 'bag');

  return firestoreData;
}

class StoreRecordDocumentEquality implements Equality<StoreRecord> {
  const StoreRecordDocumentEquality();

  @override
  bool equals(StoreRecord? e1, StoreRecord? e2) {
    return e1?.storeType == e2?.storeType &&
        e1?.country == e2?.country &&
        e1?.location == e2?.location &&
        e1?.latLng == e2?.latLng &&
        e1?.user == e2?.user &&
        e1?.logo == e2?.logo &&
        e1?.backgroundPicture == e2?.backgroundPicture &&
        e1?.phone == e2?.phone &&
        e1?.openingTime == e2?.openingTime &&
        e1?.closingTime == e2?.closingTime &&
        e1?.rating == e2?.rating &&
        e1?.sustain == e2?.sustain &&
        e1?.earning == e2?.earning &&
        e1?.verified == e2?.verified &&
        e1?.email == e2?.email &&
        e1?.features == e2?.features &&
        e1?.bag == e2?.bag &&
        e1?.openOrder == e2?.openOrder;
  }

  @override
  int hash(StoreRecord? e) => const ListEquality().hash([
        e?.storeType,
        e?.country,
        e?.location,
        e?.latLng,
        e?.user,
        e?.logo,
        e?.backgroundPicture,
        e?.phone,
        e?.openingTime,
        e?.closingTime,
        e?.rating,
        e?.sustain,
        e?.earning,
        e?.verified,
        e?.email,
        e?.features,
        e?.bag,
        e?.openOrder
      ]);

  @override
  bool isValidKey(Object? o) => o is StoreRecord;
}
