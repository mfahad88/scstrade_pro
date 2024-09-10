
class ChangeOpacity{
  double? _opacity;
  bool? _isIncreased;

  double? get opacity => _opacity;

  set opacity(double? value) {
    _opacity = value;
  }

  bool? get isIncreased => _isIncreased;

  set isIncreased(bool? value) {
    _isIncreased = value;
  }

  ChangeOpacity(this._opacity, this._isIncreased);
}