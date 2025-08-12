import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
      home: const AuthScreen(),
    );
  }
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // Переменные состояния
  bool _isLoginMode = true; // Режим входа/регистрации
  final _formKey = GlobalKey<FormState>(); // Ключ для формы
  final _emailController = TextEditingController(); // Контроллер email
  final _passwordController = TextEditingController(); // Контроллер пароля
  final _confirmPasswordController = TextEditingController(); // Контроллер подтверждения пароля

  // Метод отправки формы
  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Здесь обработка авторизации/регистрации
      print('Email: ${_emailController.text}');
      print('Password: ${_passwordController.text}');
      if (!_isLoginMode) {
        print('Confirm Password: ${_confirmPasswordController.text}');
      }
    }
  }

  // Переключение между режимами
  void _switchAuthMode() {
    setState(() {
      _isLoginMode = !_isLoginMode;
      // Очистка подтверждения пароля при переключении
      if (_isLoginMode) {
        _confirmPasswordController.clear();
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Адаптивные размеры
    final screenHeight = MediaQuery.of(context).size.height;
    final topPadding = MediaQuery.of(context).padding.top;
    final isSmallScreen = screenHeight < 600;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: isSmallScreen ? 20 : 40,
            vertical: 20,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: screenHeight - topPadding,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  // Круглая иконка (адаптивная)
                  CircleAvatar(
                    radius: isSmallScreen ? 50 : 70,
                    backgroundColor: Colors.blue.shade100,
                    child: Icon(
                      Icons.person,
                      size: isSmallScreen ? 50 : 70,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: isSmallScreen ? 20 : 40),

                  // Заголовок
                  Text(
                    _isLoginMode ? 'Вход в аккаунт' : 'Создать аккаунт',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 24 : 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: isSmallScreen ? 15 : 30),

                  // Форма
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Поле Email
                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Введите email';
                            }
                            if (!value.contains('@')) {
                              return 'Некорректный email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: isSmallScreen ? 15 : 20),

                        // Поле Пароль
                        TextFormField(
                          controller: _passwordController,
                          decoration: const InputDecoration(
                            labelText: 'Пароль',
                            prefixIcon: Icon(Icons.lock),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Введите пароль';
                            }
                            if (value.length < 6) {
                              return 'Пароль должен быть не менее 6 символов';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: isSmallScreen ? 15 : 20),

                        // Поле подтверждения пароля (только для регистрации)
                        if (!_isLoginMode)
                          Column(
                            children: [
                              TextFormField(
                                controller: _confirmPasswordController,
                                decoration: const InputDecoration(
                                  labelText: 'Подтвердите пароль',
                                  prefixIcon: Icon(Icons.lock_outline),
                                ),
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Подтвердите пароль';
                                  }
                                  if (value != _passwordController.text) {
                                    return 'Пароли не совпадают';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: isSmallScreen ? 15 : 20),
                            ],
                          ),

                        // Кнопка отправки
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                vertical: isSmallScreen ? 14 : 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ), onPressed: () {  }, child: null,
                          ),),
                      ],
                    ),
                  ),

                  // Ссылка для переключения режима
                  TextButton(
                    onPressed: _switchAuthMode,
                    child: Text(
                      _isLoginMode
                          ? 'Создать новый аккаунт'
                          : 'Уже есть аккаунт? Войти',
                      style: TextStyle(
                        fontSize: isSmallScreen ? 14 : 16,
                        color: Colors.blue,
                      ),
                    ),
                  ),

                  // Расширяем колонку до низа экрана
                  const Spacer(),

                  // Футер с информацией
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      '© 2025 MyApp. Все права защищены',
                      style: TextStyle(
                        fontSize: isSmallScreen ? 12 : 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}