class Burc {
  String _adi;
  String _tarihi;
  String _detayi;
  String _kucukResim;
  String _buyukResim;

  Burc(this._adi, this._tarihi, this._detayi, this._kucukResim,
      this._buyukResim);

  String get adi => _adi;
  set adi(String value) {
    _adi = value;
  }

  String get tarihi => _tarihi;
  set tarihi(String value) {
    _tarihi = value;
  }

  String get detayi => _detayi;
  set detayi(String value) {
    _detayi = value;
  }

  String get kucukResim => _kucukResim;
  set kucukResim(String value) {
    _kucukResim = value;
  }

  String get buyukResim => _buyukResim;
  set buyukResim(String value) {
    _buyukResim = value;
  }
  
}
