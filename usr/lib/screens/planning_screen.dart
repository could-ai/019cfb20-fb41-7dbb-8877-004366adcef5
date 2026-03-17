import 'package:flutter/material.dart';
import '../models/audit.dart';

class PlanningScreen extends StatelessWidget {
  const PlanningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Planification', style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.topic), text: 'Thématiques'),
              Tab(icon: Icon(Icons.store), text: 'Visites Agences'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Onglet Thématiques
            ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: mockThemes.length,
              itemBuilder: (context, index) {
                final theme = mockThemes[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.indigo,
                      child: Icon(Icons.lightbulb_outline, color: Colors.white),
                    ),
                    title: Text(theme.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(theme.description),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                );
              },
            ),
            // Onglet Visites Agences
            ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: mockVisits.length,
              itemBuilder: (context, index) {
                final visit = mockVisits[index];
                final isDone = visit.status == 'Réalisée';
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: isDone ? Colors.green : Colors.orange,
                      child: Icon(isDone ? Icons.check : Icons.calendar_month, color: Colors.white),
                    ),
                    title: Text(visit.agencyName, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('Date: ${_formatDate(visit.date)}'),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: (isDone ? Colors.green : Colors.orange).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        visit.status,
                        style: TextStyle(
                          color: isDone ? Colors.green : Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Action pour ajouter une thématique ou une visite
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }
}
