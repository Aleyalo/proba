import 'package:flutter/material.dart';
import '../models/employee.dart'; // Импортируйте модель работника

class EmployeeDetailScreen extends StatelessWidget {
  final Employee employee; // Текущий сотрудник

  EmployeeDetailScreen({required this.employee}); // Конструктор принимает текущего сотрудника

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(employee.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(employee.photoUrl),
            ),
            const SizedBox(height: 16),
            Text(
              'Должность: ${employee.position}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Отдел: ${employee.department}',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              'Телефон: ${employee.phone}',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              'Электронная почта: ${employee.email}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
