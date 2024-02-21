import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _favourites = prefs
              .getStringList('ff_favourites')
              ?.map((path) => path.ref)
              .toList() ??
          _favourites;
    });
    _safeInit(() {
      _distance = prefs.getDouble('ff_distance') ?? _distance;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  double _nextPayout = 0.0;
  double get nextPayout => _nextPayout;
  set nextPayout(double _value) {
    _nextPayout = _value;
  }

  int _price = 0;
  int get price => _price;
  set price(int _value) {
    _price = _value;
  }

  List<DocumentReference> _favourites = [];
  List<DocumentReference> get favourites => _favourites;
  set favourites(List<DocumentReference> _value) {
    _favourites = _value;
    prefs.setStringList('ff_favourites', _value.map((x) => x.path).toList());
  }

  void addToFavourites(DocumentReference _value) {
    _favourites.add(_value);
    prefs.setStringList(
        'ff_favourites', _favourites.map((x) => x.path).toList());
  }

  void removeFromFavourites(DocumentReference _value) {
    _favourites.remove(_value);
    prefs.setStringList(
        'ff_favourites', _favourites.map((x) => x.path).toList());
  }

  void removeAtIndexFromFavourites(int _index) {
    _favourites.removeAt(_index);
    prefs.setStringList(
        'ff_favourites', _favourites.map((x) => x.path).toList());
  }

  void updateFavouritesAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _favourites[_index] = updateFn(_favourites[_index]);
    prefs.setStringList(
        'ff_favourites', _favourites.map((x) => x.path).toList());
  }

  void insertAtIndexInFavourites(int _index, DocumentReference _value) {
    _favourites.insert(_index, _value);
    prefs.setStringList(
        'ff_favourites', _favourites.map((x) => x.path).toList());
  }

  double _distance = 5.0;
  double get distance => _distance;
  set distance(double _value) {
    _distance = _value;
    prefs.setDouble('ff_distance', _value);
  }

  LatLng? _location = LatLng(3.1319197, 101.6840589);
  LatLng? get location => _location;
  set location(LatLng? _value) {
    _location = _value;
  }

  String _locationName = 'Kuala Lumpur';
  String get locationName => _locationName;
  set locationName(String _value) {
    _locationName = _value;
  }

  List<String> _chefCuisine = [
    'Chinese',
    'Thai',
    'Korean',
    'Italian',
    'Fine Dining',
    'BBQ',
    'Mexican',
    'Indian',
    'African',
    'Middle Eastern',
    'French',
    'Malaysian',
    'Spanish',
    'Japanese',
    'Greek',
    'Portugese',
    'Polish',
    'Peruvian',
    'Brazilian',
    'British',
    'Pan Asian',
    'Fusion',
    'Turkish',
    'Sri Lankan',
    'Mediterranean',
    'Modern European'
  ];
  List<String> get chefCuisine => _chefCuisine;
  set chefCuisine(List<String> _value) {
    _chefCuisine = _value;
  }

  void addToChefCuisine(String _value) {
    _chefCuisine.add(_value);
  }

  void removeFromChefCuisine(String _value) {
    _chefCuisine.remove(_value);
  }

  void removeAtIndexFromChefCuisine(int _index) {
    _chefCuisine.removeAt(_index);
  }

  void updateChefCuisineAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _chefCuisine[_index] = updateFn(_chefCuisine[_index]);
  }

  void insertAtIndexInChefCuisine(int _index, String _value) {
    _chefCuisine.insert(_index, _value);
  }

  int _pageState = 0;
  int get pageState => _pageState;
  set pageState(int _value) {
    _pageState = _value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
