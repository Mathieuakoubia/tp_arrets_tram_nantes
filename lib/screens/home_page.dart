import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp_liste_course/providers/arret_provider.dart';
import 'package:tp_liste_course/screens/arret_detail_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ArretProvider>(context, listen: false).fetchArrets();
    });
  }

  @override
  Widget build(BuildContext context) {
    final arretProvider = Provider.of<ArretProvider>(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
      ),
      body: arretProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: arretProvider.arrets.length,
              itemBuilder: (context, index) {
                final arret = arretProvider.arrets[index];
                return Card(
                  elevation: 2.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.directions_bus,
                      color: theme.colorScheme.primary,
                    ),
                    title: Text(
                      arret.nom,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16.0),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ArretDetailPage(arret: arret),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
