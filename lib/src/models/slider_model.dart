import 'package:flutter/cupertino.dart';

class SliderModel with ChangeNotifier {
  double _currentPage = 0;

  double get currentPage => this._currentPage;

  set currentPage(double pagina) {
    this._currentPage = pagina;
    print(pagina);
    notifyListeners();
  }
}