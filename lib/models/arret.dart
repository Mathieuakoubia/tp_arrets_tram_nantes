class Arret {
  final String nom;
  final String stopId;
  final double? longitude;
  final double? latitude;

  Arret({required this.nom, required this.stopId, this.longitude, this.latitude});

  factory Arret.fromJson(Map<String, dynamic> json) {
    return Arret(
      nom: json['stop_name'] as String,
      stopId: json['stop_id'] as String,
      longitude: (json['stop_lon'] as num?)?.toDouble(),
      latitude: (json['stop_lat'] as num?)?.toDouble(),
    );
  }
}
