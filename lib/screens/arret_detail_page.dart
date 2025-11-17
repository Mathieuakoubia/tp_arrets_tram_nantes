import 'package:flutter/material.dart';
import 'package:tp_liste_course/models/arret.dart';

class ArretDetailPage extends StatelessWidget {
  final Arret arret;

  const ArretDetailPage({super.key, required this.arret});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(arret.nom),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nom de l\'arrêt: ${arret.nom}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Stop ID: ${arret.stopId}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text('Longitude: ${arret.longitude ?? 'Non disponible'}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text('Latitude: ${arret.latitude ?? 'Non disponible'}', style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
