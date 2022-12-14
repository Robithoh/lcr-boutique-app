class TopupModel {
  final String Title, Poster, Count, Deskripsi;

  TopupModel({
    required this.Title,
    required this.Poster,
    required this.Count,
    required this.Deskripsi,
  });

  factory TopupModel.fromJSON(Map parsedJson) {
    return TopupModel(
      Title: parsedJson['Title'],
      Poster: parsedJson['Poster'],
      Count: parsedJson['Count'],
      Deskripsi: parsedJson['Deskripsi'],
    );
  }
}
