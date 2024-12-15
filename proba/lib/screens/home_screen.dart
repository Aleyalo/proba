import 'package:flutter/material.dart';
import '../models/employee.dart';
import 'employee_list_screen.dart'; // Импортируйте экран списка сотрудников
import 'profile_screen.dart'; // Импортируйте экран профиля
import 'package:proba/widgets/bottom_navigation_bar.dart'; // Импортируйте виджет нижней навигационной панели

class HomeScreen extends StatefulWidget {
  final Employee currentUser ; // Текущий аутентифицированный пользователь
  final List<Employee> employees; // Список сотрудников

  HomeScreen({required this.currentUser , required this.employees}); // Конструктор принимает текущего пользователя и список сотрудников

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Индекс выбранного экрана

  // Список экранов для переключения
  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      _buildWelcomeScreen(), // Экран приветствия
      EmployeeListScreen(employees: widget.employees), // Экран списка сотрудников
      ProfileScreen(widget.currentUser ), // Экран профиля
    ];
  }
  Widget _buildWelcomeScreen() {
    return Center(
      child: Text(
        'Добро пожаловать, ${widget.currentUser .name}!',
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Обновляем индекс выбранного экрана
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex], // Отображаем выбранный экран
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: _selectedIndex, // Текущий индекс
        onTap: _onItemTapped, // Обрабатываем нажатие на элемент
      ),
    );
  }
}