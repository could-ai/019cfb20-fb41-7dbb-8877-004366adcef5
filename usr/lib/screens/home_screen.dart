import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'planning_screen.dart';
import 'audit_list_screen.dart';
import 'actions_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const PlanningScreen(),
    const AuditListScreen(),
    const ActionsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined), 
            selectedIcon: Icon(Icons.dashboard),
            label: 'Accueil'
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_month_outlined), 
            selectedIcon: Icon(Icons.calendar_month),
            label: 'Planning'
          ),
          NavigationDestination(
            icon: Icon(Icons.list_alt_outlined), 
            selectedIcon: Icon(Icons.list_alt),
            label: 'Audits'
          ),
          NavigationDestination(
            icon: Icon(Icons.task_alt_outlined), 
            selectedIcon: Icon(Icons.task_alt),
            label: 'Actions'
          ),
        ],
      ),
    );
  }
}
