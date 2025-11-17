import 'package:flutter/material.dart';
import 'package:tp_liste_course/models/arret.dart';

class ArretDetailPage extends StatelessWidget {
  final Arret arret;

  const ArretDetailPage({super.key, required this.arret});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(arret.nom),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDetailRow(theme, Icons.info_outline, 'Nom de l\'arrêt', arret.nom),
                const Divider(height: 20),
                _buildDetailRow(theme, Icons.confirmation_number_outlined, 'Stop ID', arret.stopId),
                const Divider(height: 20),
                _buildDetailRow(theme, Icons.public, 'Longitude', arret.longitude.toString()),
                const Divider(height: 20),
                _buildDetailRow(theme, Icons.map_outlined, 'Latitude', arret.latitude.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(ThemeData theme, IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: theme.colorScheme.primary, size: 28),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: theme.textTheme.titleSmall?.copyWith(color: Colors.grey),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
