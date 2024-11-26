class EventListModel {
  EventListModel({
    required bool status,
    required List<Data> data,
    required String message,
  })  : _status = status,
        _data = data,
        _message = message;

  // Factory constructor for JSON deserialization
  EventListModel.fromJson(dynamic json)
      : _status = json['status'],
        _data = (json['data'] as List<dynamic>?)
            ?.map((v) => Data.fromJson(v))
            .toList() ??
            [],
        _message = json['message'];

  bool _status;
  List<Data> _data = []; // Initialized with an empty list
  String _message;

  // Getter methods
  bool get status => _status;
  List<Data> get data => _data;
  String get message => _message;

  // To JSON method
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['data'] = _data.map((v) => v.toJson()).toList();
    map['message'] = _message;
    return map;
  }

  // Copy with method
  EventListModel copyWith({
    bool? status,
    List<Data>? data,
    String? message,
  }) =>
      EventListModel(
        status: status ?? _status,
        data: data ?? _data,
        message: message ?? _message,
      );
}

class Data {
  Data({
    required num id,
    required String eventName,
  })  : _id = id,
        _eventName = eventName;

  Data.fromJson(dynamic json)
      : _id = json['id'],
        _eventName = json['event_name'];

  num _id;
  String _eventName;

  num get id => _id;
  String get eventName => _eventName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['event_name'] = _eventName;
    return map;
  }

  Data copyWith({
    num? id,
    String? eventName,
  }) =>
      Data(
        id: id ?? _id,
        eventName: eventName ?? _eventName,
      );
}
