import 'package:flutter/material.dart';
import '../models/employee.dart';
import 'employee_detail_screen.dart'; // Импортируйте экран деталей сотрудника

class EmployeeListScreen extends StatelessWidget {
  final List<Employee> employees; // Список сотрудников

  EmployeeListScreen({required this.employees}); // Конструктор принимает список сотрудников

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Список сотрудников'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              // Здесь можно добавить функциональность для обновления списка сотрудников
              // Например, можно вызвать метод для получения обновленных данных
              // setState(() {});
            },
          ),
        ],
      ),
      body: employees.isEmpty
          ? Center(
        child: Text(
          'Нет сотрудников для отображения.',
          style: TextStyle(fontSize: 18),
        ),
      )
          : ListView.builder(
        itemCount: employees.length,
        itemBuilder: (context, index) {
          final employee = employees[index];
          return ListTile(
            leading: employee.photoUrl.isNotEmpty
                ? Image.network(employee.photoUrl)
                : Icon(Icons.person), // Отображение иконки, если нет фото
            title: Text(employee.name),
            subtitle: Text(employee.position),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EmployeeDetailScreen(employee: employee),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
