import 'package:crud_regmal/models/regmal.dart';
import 'package:crud_regmal/utils/database_helper.dart';
import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';

class RegmalNotifier extends ChangeNotifier {
  List<RegmalSatu> _regmal = [];
  List<RegmalSatu> get regmal => _regmal;

  late DatabaseHelper _databaseHelper;
  Logger _logger = Logger();

  RegmalNotifier() {
    _databaseHelper = DatabaseHelper();
    _getAllRegmalSatu();
  }

  Future<void> addRegmalSatu(RegmalSatu regmalSatu) async {
    try {
      await _databaseHelper.insertRegmalSatu(regmalSatu);
      _getAllRegmalSatu();
    } catch (e) {
      _logger.w(e);
    }
  }

  void _getAllRegmalSatu() async {
    try {
      _regmal = await _databaseHelper.getAllRegmal();
      notifyListeners();
    } catch (e) {
      _logger.w(e);
    }
  }

  Future<RegmalSatu> getRegmalSatuById(int ktp) async {
    try {
      return await _databaseHelper.getRegmalByKtp(ktp);
    } catch (e) {
      _logger.w(e);
      throw Exception(e);
    }
  }

  Future<void> updateRegmalSatu(RegmalSatu regmalSatu) async {
    try {
      await _databaseHelper.updateRegmal(regmalSatu);
      _getAllRegmalSatu();
    } catch (e) {
      _logger.w(e);
    }
  }

  Future<void> deleteRegmalSatu(int ktp) async {
    try {
      await _databaseHelper.deleteRegmalSatu(ktp);
      _getAllRegmalSatu();
    } catch (e) {
      _logger.w(e);
    }
  }
}
