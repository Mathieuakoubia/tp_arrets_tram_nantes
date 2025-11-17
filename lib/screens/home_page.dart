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

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: arretProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: arretProvider.arrets.length,
              itemBuilder: (context, index) {
                final arret = arretProvider.arrets[index];
                return ListTile(
                  title: Text(arret.nom),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArretDetailPage(arret: arret),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
