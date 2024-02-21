import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

double centStripe00(double cent) {
  return (cent * 100).toDouble();
}

double rating(
  int amounth,
  int person,
) {
  return (amounth / person).toDouble();
}

double finalValue(double value) {
  return (value * 2);
}

int? returnDistanceBetweenTwoPointsCopy(
  LatLng? positionOne,
  LatLng? positionTwo,
) {
  // calculate the distance between two points on a spheroid and return distance as double
  var p = 0.017453292519943295;
  var a = 0.5 -
      math.cos((positionTwo!.latitude - positionOne!.latitude) * p) / 2 +
      math.cos(positionOne.latitude * p) *
          math.cos(positionTwo.latitude * p) *
          (1 - math.cos((positionTwo.longitude - positionOne.longitude) * p)) /
          2;
  double result = 12742 * math.asin(math.sqrt(a));
  // uncomment the line below if you want the result to be rounded
  //double finalResult = result.roundToDouble();
  // if you uncommented the line above, you have to replace result in the line below with finalResult
  //return (result * 1000).toInt();
  int roundedDistance = (result * 1000).toInt();
  int roundedToNearestTen = (roundedDistance ~/ 10) * 10;
  return roundedToNearestTen;
}

double finalPatSGD(double pay) {
  return ((pay / 10) * 8 - 0.5);
}

List<StoreRecord> getPlacesMaximumDistanceCopy(
  List<StoreRecord> places,
  LatLng userGeo,
  double maxDistance,
) {
  // First create some emptyList
  List<StoreRecord> placesList = [];
  List<double> listKm = [];
  double lat1 = userGeo.latitude;
  double lon1 = userGeo.longitude;
  // This iterates through the single documents "places" in the List
  for (StoreRecord place in places) {
    double lat2 = place.latLng!.latitude;
    double lon2 = place.latLng!.longitude;
    // This is doing math for distance calculations on the surface of a spheroid
    var c = math.cos;
    var p = 0.017453292519943295;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    // This is getting us the distance
    var d = (12742 * math.asin(math.sqrt(a)));
    String inString = d.toStringAsFixed(2); // '2.35'
    double inDouble = double.parse(inString);
    listKm.add(inDouble);
    // Sort the documents that will be returned by distance
    listKm.sort();
    int listKmIndex = listKm.indexWhere((dist) => dist == inDouble);
    // Check if the document we are currently processing is no farther away from userGeo than we defined as max.
    if (inDouble <= maxDistance) {
      // If its within our radius, add it to the list of places documents that will be returned
      placesList.insert(listKmIndex, place);
    }
  }
  return placesList;
}

double emission(double co2) {
  return (co2 / 1000).toDouble();
}
