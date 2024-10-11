import 'package:flutter/material.dart';
import 'package:travel_app/utils/enum/trip_tab_enum.dart';

class TripProvider with ChangeNotifier {
  String _tripName = '';
  String _country = '';
  DateTime? _fromDate;
  DateTime? _toDate;
  bool tripcreated = true;
  TripTabEnum _currentTripTab = TripTabEnum.calender;

  bool _isShowSaved = false;
  List<Map<String, dynamic>> _destinations = [
    {"country": null, "fromDate": null, "toDate": null}
  ];
  final List<Map<String, dynamic>> _itinereydata = flightdata;
  final List<Map<String, dynamic>> _flightAttendances = [
    {"flightDetails": null, "fromDate": null, "toTime": null}
  ];

  List<Map<String, dynamic>> get flightAttendances => _flightAttendances;
  List<Map<String, dynamic>> get itinereydata => _itinereydata;
  TripTabEnum get currentTripTab => _currentTripTab;

  bool get isShowSaved => _isShowSaved;

  void chnageTripTab(TripTabEnum value) {
    _currentTripTab = value;
    notifyListeners();
  }

  void chnageShowSaved() {
    _isShowSaved = !_isShowSaved;
    notifyListeners();
  }

  void addFlightAttendance(Map<String, dynamic> flightAttendance) {
    _flightAttendances.add(flightAttendance);
    notifyListeners();
  }

  void updateFlightAttendance(int index, String field, dynamic value) {
    if (index >= 0 && index < _flightAttendances.length) {
      _flightAttendances[index][field] = value;
      notifyListeners();
    }
  }

  void removeFlightAttendance(int index) {
    if (index >= 0 && index < _flightAttendances.length) {
      _flightAttendances.removeAt(index);
      notifyListeners();
    }
  }

  final List<Map<String, dynamic>> _accommodations = [
    {"accommodationDetails": null, "fromDate": null, "toDate": null}
  ];

  List<Map<String, dynamic>> get accommodations => _accommodations;

  void addAccommodation(Map<String, dynamic> accommodation) {
    _accommodations.add(accommodation);
    notifyListeners();
  }

  void updateAccommodation(int index, String field, dynamic value) {
    if (index >= 0 && index < _accommodations.length) {
      _accommodations[index][field] = value;
      notifyListeners();
    }
  }

  void removeAccommodation(int index) {
    if (index >= 0 && index < _accommodations.length) {
      _accommodations.removeAt(index);
      notifyListeners();
    }
  }

  // Optional: Clear All Data
  void clearAll() {
    _destinations.clear();
    _flightAttendances.clear();
    _accommodations.clear();
    notifyListeners();
  }

  // Getters
  String get tripName => _tripName;
  String get country => _country;
  DateTime? get fromDate => _fromDate;
  DateTime? get toDate => _toDate;

  List<Map<String, dynamic>> get destinations => _destinations;

  void addTripDestinations(List<Map<String, dynamic>> destinations) {
    _destinations = destinations;
    notifyListeners();
  }

  void updateDestination(int index, String field, dynamic value) {
    if (index >= 0 && index < _destinations.length) {
      _destinations[index][field] = value;
      notifyListeners();
    }
  }

  void removeDestination(int index) {
    if (index >= 0 && index < _destinations.length) {
      _destinations.removeAt(index);
      notifyListeners();
    }
  }

  void clearDestinations() {
    _destinations.clear();
    notifyListeners();
  }

  void setDestinations(List<Map<String, dynamic>> newDestinations) {
    _destinations = newDestinations;
    notifyListeners();
  }

  void addDestination(Map<String, dynamic> destination) {
    _destinations.add(destination);
    notifyListeners();
  }
}

final List<Map<String, dynamic>> flightdata = [
  {'title': 'Flights', "subtitle": "MEL"},
  {
    'icon': "assets/icons/plant.svg",
    'title': 'Reduce stress',
  },
  {
    'icon': 'assets/icons/smile.svg',
    'title': 'Stay young',
  },
  {
    'icon': "assets/icons/medical.svg",
    'title': 'Improve health',
  },
  {
    'icon': "assets/icons/bed.svg",
    'title': 'Sleep better',
  },
  {
    'icon': "assets/icons/handshake.svg",
    'title': 'Practice self-love',
  }
];
