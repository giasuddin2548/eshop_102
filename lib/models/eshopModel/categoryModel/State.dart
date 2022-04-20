class State {
  State({
      this.opened,});

  State.fromJson(dynamic json) {
    opened = json['opened'];
  }
  bool? opened;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['opened'] = opened;
    return map;
  }

}