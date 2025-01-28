import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

List<DateTime> getNext15Days(DateTime initialDateTime) {
  // je veux une fonction qui prend en paramètre une DateTime. La fonction va retourner la liste de 15 prochaines DateTime suivant la DateTime passée en paramètre.
  List<DateTime> next15Dates = [];
  next15Dates.add(DateTime(
      initialDateTime.year, initialDateTime.month, initialDateTime.day));

  for (int i = 1; i <= 14; i++) {
    DateTime nextDate = initialDateTime.add(Duration(days: i));
    next15Dates.add(DateTime(nextDate.year, nextDate.month, nextDate.day));
  }

  return next15Dates;
}

DateTime getDateWithoutTime(DateTime dateParameter) {
  return DateTime(dateParameter.year, dateParameter.month, dateParameter.day);
}

List<DateTime> getListHour(
  DateTime start,
  DateTime end,
  int interval,
) {
  // Je veux une fonction qui prend deux DateTime, une de début et une de fin et un Integer d'intervalle en paramètres. La fonction me retourne la liste des DateTime entre le début et fin en ajoutant l'intervalle.
  List<DateTime> listOfDateTime = [];
  DateTime currentDateTime = start;

  while (currentDateTime.isBefore(end)) {
    listOfDateTime.add(currentDateTime);
    currentDateTime = currentDateTime.add(Duration(minutes: interval));
  }

  return listOfDateTime;
}

JourSemaine getJourFromDateTime(DateTime dateTime) {
  switch (dateTime.weekday) {
    case 1:
      return JourSemaine.LUNDI;
    case 2:
      return JourSemaine.MARDI;
    case 3:
      return JourSemaine.MERCREDI;
    case 4:
      return JourSemaine.JEUDI;
    case 5:
      return JourSemaine.VENDREDI;
    case 6:
      return JourSemaine.SAMEDI;
    case 7:
      return JourSemaine.DIMANCHE;
  }
  return JourSemaine.DIMANCHE;
}

int differenceBetweenTwoDates(
  DateTime date1,
  DateTime date2,
) {
  Duration difference = date2.difference(date1);
  return difference.inMinutes;
}

DateTime getMaxHourDateTime(DateTime? dateParam) {
  return DateTime(
      dateParam!.year, dateParam!.month, dateParam!.day, 23, 59, 59);
}

DateTime getMinHourDateTime(DateTime? dateParam) {
  var dateMin =
      DateTime(dateParam!.year, dateParam!.month, dateParam!.day, 0, 0, 0);
  dateMin = dateMin.subtract(Duration(hours: 11));
  return dateMin;
}

double getTopPadding(
  DateTime dateDebutDispo,
  DateTime dateDebutReservation,
  int interval,
  int height,
) {
  // fonction qui retourne la différence entre deux dateTime en minutes
  int difference =
      differenceBetweenTwoDates(dateDebutDispo, dateDebutReservation);
  double topPadding = (difference / interval) * height;
  return topPadding;
}

DateTime mapHour(
  DateTime? dateDay,
  DateTime? dateHour,
) {
  return DateTime(dateDay?.year ?? 0, dateDay?.month ?? 0, dateDay?.day ?? 0,
      dateHour?.hour ?? 0, dateHour?.minute ?? 0);
}
