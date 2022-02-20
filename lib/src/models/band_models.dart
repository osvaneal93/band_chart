class BandModels {
  String id;
  String name;
  int votes;

  BandModels({required this.id, required this.name, required this.votes});

  factory BandModels.fromMap(Map<String, dynamic> obj) =>
      BandModels(id: obj['id'], name: obj['name'], votes: obj['votes']);
}
