class ChannelModel {
  final dynamic id;
  final dynamic name;
  
  ChannelModel({
    required this.id,
    required this.name,
  });

  factory ChannelModel.fromJson(Map<String, dynamic> json) {
    return ChannelModel(
      id: json['id'] as dynamic,
      name: json['name'] as dynamic,
    );
  }
}
