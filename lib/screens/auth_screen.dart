// Экран авторизации
import 'package:eqiup_client/models/auth_model.dart';
import 'package:eqiup_client/screens/base_screen.dart';
import 'package:flutter/material.dart';
import '../data/user.dart';
import '../models/http/ping_model.dart';
import '../widgets/round_icon.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key, required this.authNotifier});
  final AuthModel authNotifier;

  //создать объект состояния проекта. При изменении состояния перерисоыввется интерфейс
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  // Контроллерф для ввода полей
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  PingModel pingNotifier = PingModel();
  //переменные состояния
  bool _isLoginMode = true; //режим входа/регистрации - совместить с прошлым
  bool _obscurePassword = true;

  String? _selectedRole; //Выбранная роль

  // Доступные роли пользователей

  final List<String> _userRoles = ['Пользователь', 'Администратор'];

  @override
  Widget build(BuildContext context) {
    pingNotifier.addListener(listener);
    return  BaseScreen(title: "Регистрация",
        body: SafeArea(child: _getSingleChildScrollView(context).first)
    );
  }
  void listener(){
    print('ПИ пи пи');
  }

  Set<SingleChildScrollView> _getSingleChildScrollView(BuildContext context) =>
      {
        SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: _getConstrainedBox(context).first,
        ),
      };

  Set<ConstrainedBox> _getConstrainedBox(BuildContext context) => {
    ConstrainedBox(
      constraints: BoxConstraints(
        minHeight:
            MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top,
      ),
      child: _getColumn().first,
    ),
  };

  Set<Column> _getColumn() => {
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        //здесь распологаются виждеты
        buildRoundIcon(200, 200),
        const SizedBox(height: 32),
        // Поле имени пользователя
        TextFormField(
          controller: _usernameController,
          decoration: const InputDecoration(
            labelText: 'Имя пользователя',
            prefixIcon: Icon(Icons.person),
          ),
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: 20),

        // Поле пароля
        TextFormField(
          controller: _passwordController,
          decoration: InputDecoration(
            labelText: 'Пароль',
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: () {
                setState(() => _obscurePassword = !_obscurePassword);
              },
            ),
          ),
          obscureText: _obscurePassword,
          textInputAction: TextInputAction.done,
        ),
        const SizedBox(height: 20),
        //выбор роли (только в режиме регистрации)
        if (!_isLoginMode) ...[
          DropdownButtonFormField<String>(
            value: _selectedRole,
            decoration: const InputDecoration(
              labelText: 'Роль пользователя',
              prefixIcon: Icon(Icons.people_alt),
            ),
            items: _userRoles
                .map((role) => DropdownMenuItem(value: role, child: Text(role)))
                .toList(),

            onChanged: (value) => setState(() => _selectedRole = value),
            validator: (value) => value == null ? 'Выберите роль' : null,
          ),
        ],
        const SizedBox(height: 30),
        //кнопка входа/регистрации
        ElevatedButton(onPressed: _handleAuth, child:  Text(_isLoginMode ? 'Войти' : 'Зарегистрироваться')),
        const SizedBox(height: 16),
        // Переключение между режимами
        TextButton(
          onPressed: () => setState(() => _isLoginMode = !_isLoginMode),
          child: Text(
            _isLoginMode
                ? 'Создать новый аккаунт'
                : 'Уже есть аккаунт? Войти',
          ),
        ),
      ],
    ),
  };

  // Обработка авторизации/регистрации
  void _handleAuth() async{
  //  pingNotifier.fetchData();
    final username = _usernameController.text.trim();
    final password = _passwordController.text;

    // Валидация
    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Заполните все поля')),
      );
      return;
    }

    if (!_isLoginMode && _selectedRole == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Выберите роль пользователя')),
      );
      return;
    }

    //тут все пройдено

    final user = User(name: username, id: 1, role: 1, date: 232342);
    final success = await widget.authNotifier.login(user);

    // В реальном приложении здесь будет вызов API
    print('Username: $username');
    print('Password: $password');
    if (!_isLoginMode) print('Role: $_selectedRole');
  }
  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

}
