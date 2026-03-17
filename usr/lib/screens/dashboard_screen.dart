import 'package:flutter/material.dart';
import '../models/audit.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Calculs rapides pour les statistiques
    final actionsAFaire = mockActions.where((a) => a.status != 'Résolue').length;
    final visitesPlanifiees = mockVisits.where((v) => v.status == 'Planifiée').length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tableau de bord', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Vue d\'ensemble',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: _buildStatCard(context, 'Audits en cours', '1', Icons.sync, Colors.blue)),
                const SizedBox(width: 16),
                Expanded(child: _buildStatCard(context, 'Visites prévues', visitesPlanifiees.toString(), Icons.store, Colors.purple)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: _buildStatCard(context, 'Actions à faire', actionsAFaire.toString(), Icons.warning_amber_rounded, Colors.orange)),
                const SizedBox(width: 16),
                Expanded(child: _buildStatCard(context, 'Thématiques', mockThemes.length.toString(), Icons.topic, Colors.green)),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Actions rapides',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      child: Icon(Icons.add_chart, color: Colors.white),
                    ),
                    title: const Text('Planifier une visite'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.orangeAccent,
                      child: Icon(Icons.add_task, color: Colors.white),
                    ),
                    title: const Text('Nouvelle action corrective'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Icon(Icons.picture_as_pdf, color: Colors.white),
                    ),
                    title: const Text('Générer un rapport global'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, String title, String count, IconData icon, Color color) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 32, color: color),
            ),
            const SizedBox(height: 12),
            Text(count, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(
              title, 
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[700], fontSize: 13, fontWeight: FontWeight.w500)
            ),
          ],
        ),
      ),
    );
  }
}
