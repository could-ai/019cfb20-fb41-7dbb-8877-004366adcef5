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

class AuditTheme {
  final String id;
  final String name;
  final String description;

  AuditTheme({
    required this.id,
    required this.name,
    required this.description,
  });
}

class AgencyVisit {
  final String id;
  final String agencyName;
  final DateTime date;
  final String status; // Planifiée, Réalisée, Annulée

  AgencyVisit({
    required this.id,
    required this.agencyName,
    required this.date,
    required this.status,
  });
}

class CorrectiveAction {
  final String id;
  final String title;
  final String agencyOrDepartment;
  final String priority; // Haute, Moyenne, Basse
  final String status; // À faire, En cours, Résolue
  final DateTime deadline;

  CorrectiveAction({
    required this.id,
    required this.title,
    required this.agencyOrDepartment,
    required this.priority,
    required this.status,
    required this.deadline,
  });
}

// --- Données fictives pour la démonstration ---

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

List<AuditTheme> mockThemes = [
  AuditTheme(id: '1', name: 'Conformité RGPD', description: 'Vérification du traitement des données personnelles.'),
  AuditTheme(id: '2', name: 'Sécurité des Agences', description: 'Contrôle des accès physiques et des coffres.'),
  AuditTheme(id: '3', name: 'Processus de Vente', description: 'Évaluation du respect des procédures commerciales.'),
];

List<AgencyVisit> mockVisits = [
  AgencyVisit(id: '1', agencyName: 'Agence Paris Centre', date: DateTime.now().add(const Duration(days: 3)), status: 'Planifiée'),
  AgencyVisit(id: '2', agencyName: 'Agence Lyon Sud', date: DateTime.now().add(const Duration(days: 10)), status: 'Planifiée'),
  AgencyVisit(id: '3', agencyName: 'Agence Marseille Vieux-Port', date: DateTime.now().subtract(const Duration(days: 5)), status: 'Réalisée'),
];

List<CorrectiveAction> mockActions = [
  CorrectiveAction(
    id: '1', 
    title: 'Mettre à jour le registre des traitements', 
    agencyOrDepartment: 'IT / Siège', 
    priority: 'Haute', 
    status: 'À faire', 
    deadline: DateTime.now().add(const Duration(days: 7))
  ),
  CorrectiveAction(
    id: '2', 
    title: 'Réparer la caméra de l\'entrée principale', 
    agencyOrDepartment: 'Agence Marseille Vieux-Port', 
    priority: 'Moyenne', 
    status: 'En cours', 
    deadline: DateTime.now().add(const Duration(days: 2))
  ),
  CorrectiveAction(
    id: '3', 
    title: 'Formation de l\'équipe sur le nouveau logiciel', 
    agencyOrDepartment: 'Production', 
    priority: 'Basse', 
    status: 'Résolue', 
    deadline: DateTime.now().subtract(const Duration(days: 1))
  ),
];
