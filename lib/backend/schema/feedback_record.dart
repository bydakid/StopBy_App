import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FeedbackRecord extends FirestoreRecord {
  FeedbackRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "sender" field.
  String? _sender;
  String get sender => _sender ?? '';
  bool hasSender() => _sender != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "store_name" field.
  String? _storeName;
  String get storeName => _storeName ?? '';
  bool hasStoreName() => _storeName != null;

  // "store_email" field.
  String? _storeEmail;
  String get storeEmail => _storeEmail ?? '';
  bool hasStoreEmail() => _storeEmail != null;

  // "store_phone" field.
  int? _storePhone;
  int get storePhone => _storePhone ?? 0;
  bool hasStorePhone() => _storePhone != null;

  // "store_country" field.
  String? _storeCountry;
  String get storeCountry => _storeCountry ?? '';
  bool hasStoreCountry() => _storeCountry != null;

  // "sender_email" field.
  String? _senderEmail;
  String get senderEmail => _senderEmail ?? '';
  bool hasSenderEmail() => _senderEmail != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "store_phone_code" field.
  int? _storePhoneCode;
  int get storePhoneCode => _storePhoneCode ?? 0;
  bool hasStorePhoneCode() => _storePhoneCode != null;

  // "responded" field.
  bool? _responded;
  bool get responded => _responded ?? false;
  bool hasResponded() => _responded != null;

  void _initializeFields() {
    _sender = snapshotData['sender'] as String?;
    _subject = snapshotData['subject'] as String?;
    _storeName = snapshotData['store_name'] as String?;
    _storeEmail = snapshotData['store_email'] as String?;
    _storePhone = castToType<int>(snapshotData['store_phone']);
    _storeCountry = snapshotData['store_country'] as String?;
    _senderEmail = snapshotData['sender_email'] as String?;
    _message = snapshotData['message'] as String?;
    _storePhoneCode = castToType<int>(snapshotData['store_phone_code']);
    _responded = snapshotData['responded'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('feedback');

  static Stream<FeedbackRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FeedbackRecord.fromSnapshot(s));

  static Future<FeedbackRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FeedbackRecord.fromSnapshot(s));

  static FeedbackRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FeedbackRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FeedbackRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FeedbackRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FeedbackRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FeedbackRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFeedbackRecordData({
  String? sender,
  String? subject,
  String? storeName,
  String? storeEmail,
  int? storePhone,
  String? storeCountry,
  String? senderEmail,
  String? message,
  int? storePhoneCode,
  bool? responded,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sender': sender,
      'subject': subject,
      'store_name': storeName,
      'store_email': storeEmail,
      'store_phone': storePhone,
      'store_country': storeCountry,
      'sender_email': senderEmail,
      'message': message,
      'store_phone_code': storePhoneCode,
      'responded': responded,
    }.withoutNulls,
  );

  return firestoreData;
}

class FeedbackRecordDocumentEquality implements Equality<FeedbackRecord> {
  const FeedbackRecordDocumentEquality();

  @override
  bool equals(FeedbackRecord? e1, FeedbackRecord? e2) {
    return e1?.sender == e2?.sender &&
        e1?.subject == e2?.subject &&
        e1?.storeName == e2?.storeName &&
        e1?.storeEmail == e2?.storeEmail &&
        e1?.storePhone == e2?.storePhone &&
        e1?.storeCountry == e2?.storeCountry &&
        e1?.senderEmail == e2?.senderEmail &&
        e1?.message == e2?.message &&
        e1?.storePhoneCode == e2?.storePhoneCode &&
        e1?.responded == e2?.responded;
  }

  @override
  int hash(FeedbackRecord? e) => const ListEquality().hash([
        e?.sender,
        e?.subject,
        e?.storeName,
        e?.storeEmail,
        e?.storePhone,
        e?.storeCountry,
        e?.senderEmail,
        e?.message,
        e?.storePhoneCode,
        e?.responded
      ]);

  @override
  bool isValidKey(Object? o) => o is FeedbackRecord;
}
