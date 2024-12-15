class Employee {
  final String name;
  final String position;
  final String department;
  final String phone;
  final String email;
  final String photoUrl;
  final String username; // Поле для логина
  final String password; // Поле для пароля

  Employee({
    required this.name,
    required this.position,
    required this.department,
    required this.phone,
    required this.email,
    required this.photoUrl,
    required this.username, // Добавлено
    required this.password, // Добавлено
  });
}