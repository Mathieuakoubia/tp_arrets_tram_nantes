import 'package:flutter/material.dart';
import '../models/arret.dart';
import '../services/api_service.dart';

class ArretProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Arret> _arrets = [];
  bool _isLoading = false;

  List<Arret> get arrets => _arrets;
  bool get isLoading => _isLoading;

  Future<void> fetchArrets() async {
    _isLoading = true;
    notifyListeners();
    try {
      _arrets = await _apiService.fetchArrets();
    } catch (e) {
      // Handle error
    }
    _isLoading = false;
    notifyListeners();
  }
}
