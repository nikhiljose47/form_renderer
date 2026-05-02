class FormStateStore {
  static final FormStateStore _instance = FormStateStore._internal();
  factory FormStateStore() => _instance;
  final Map<String, dynamic> _data = {};

  FormStateStore._internal();

  void setValue(String key, dynamic value) {
    _data[key] = value;
  }

  T? getValue<T>(String key) {
    return _data[key] as T?;
  }

  Map<String, dynamic> getAll() => _data;
}
