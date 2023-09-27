class HomePageDetailsModel {
  final dynamic source;
  final dynamic title;
  final dynamic description;
  final dynamic urlToImage;
  
  HomePageDetailsModel({
    required this.source,
    required this.title,
    required this.description,
    required this.urlToImage,
  });

  factory HomePageDetailsModel.fromJson(Map<String, dynamic> json) {
    return HomePageDetailsModel(
      source: json['source'] as dynamic,
      title: json['title'] as dynamic,
      description: json['description'] as dynamic,
      urlToImage: json['urlToImage'] as dynamic,
    );
  }
}
