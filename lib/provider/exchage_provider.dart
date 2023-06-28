import 'package:flutter/cupertino.dart';

class ExchangeProvider with ChangeNotifier {
  TextEditingController _colonesTxt = TextEditingController();
  TextEditingController _dolaresTxt = TextEditingController();

  TextEditingController get colonesTxt => _colonesTxt;
  TextEditingController get dolaresTxt => _dolaresTxt;
}
