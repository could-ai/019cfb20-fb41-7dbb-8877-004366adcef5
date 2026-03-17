class Audit {
  final String id;
  final String title;
  final String department;
  final DateTime date;
  final String status;

  Audit({
    required this.id,
    required this.title,
    required this.department,
    required this.date,
    required this.status,
  });
}

// Données fictives pour la démonstration
List<Audit> mockAudits = [
  Audit(
    id: '1', 
    title: 'Audit de Sécurité Informatique', 
    department: 'IT', 
    date: DateTime.now().subtract(const Duration(days: 2)), 
    status: 'Terminé'
  ),
  Audit(
    id: '2', 
    title: 'Audit Qualité ISO 9001', 
    department: 'Production', 
    date: DateTime.now().add(const Duration(days: 5)), 
    status: 'En cours'
  ),
  Audit(
    id: '3', 
    title: 'Audit Financier Q3', 
    department: 'Finance', 
    date: DateTime.now().add(const Duration(days: 15)), 
    status: 'Planifié'
  ),
];
