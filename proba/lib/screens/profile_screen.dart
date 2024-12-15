import 'package:flutter/material.dart';
import '../models/employee.dart'; // Импортируйте модель работника

class ProfileScreen extends StatelessWidget {
  final Employee employee;

  ProfileScreen(this.employee); // Конструктор принимает объект Employee

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(employee.name),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Здесь вы можете добавить функциональность для редактирования профиля
              // Например, переход на экран редактирования профиля
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: employee.photoUrl.isNotEmpty
                  ? NetworkImage(employee.photoUrl)
                  : AssetImage('assets/images/default_avatar.png') as ImageProvider, // Замените путь на ваш локальный путь к изображению по умолчанию
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
