import 'package:flutter/material.dart';
import '../models/employee.dart';
import '../models/mock_users.dart'; // Импортируйте список сотрудников
import 'home_screen.dart'; // Импортируйте экран домашней страницы

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _errorMessage;

  void _login() {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    // Проверяем, есть ли пользователь с такими логином и паролем
    final employee = mockEmployees.firstWhere(
          (employee) => employee.username == username && employee.password == password,
      orElse: () => Employee(
        name: '', // Пустое имя
        position: '',
        department: '',
        phone: '',
        email: '',
        photoUrl: '',
        username: '', // Пустой логин
        password: '', // Пустой пароль
      ), // Возвращаем пустого сотрудника, если не найден
    );

    if (employee.username.isNotEmpty) { // Проверяем, найден ли сотрудник
      // Если пользователь найден, переходим на экран HomeScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            employees: mockEmployees, // Передаем список сотрудников
            currentUser : employee, // Передаем текущего пользователя
          ),
        ),
      );
    } else {
      // Если пользователь не найден, отображаем сообщение об ошибке
      setState(() {
        _errorMessage = 'Неверный логин или пароль';
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Вход')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Логин',
              ),
            ),
            SizedBox(height: 16), // Отступ между полями
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Пароль',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Войти'),
            ),
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  _errorMessage!,
                  style: TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
