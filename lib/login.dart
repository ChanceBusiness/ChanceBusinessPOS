import 'package:flutter/material.dart';
import 'main_page.dart';

class LoginPage extends StatefulWidget {
  final Function(bool) onThemeChanged;
  final bool isDark;

  const LoginPage({
    super.key,
    required this.onThemeChanged,
    required this.isDark,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _login() {
    if (_formKey.currentState!.validate()) {
      if (_usernameController.text == "admin" &&
          _passwordController.text == "1234") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainPage(
              onThemeChanged: widget.onThemeChanged,
              isDark: widget.isDark,
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Invalid credentials")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/logo.webp", height: 120),
              const SizedBox(height: 20),

              const Text(
                "Chance Business POS Login",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(labelText: "Username"),
                      validator: (value) =>
                          value!.isEmpty ? "Enter username" : null,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: "Password"),
                      validator: (value) =>
                          value!.isEmpty ? "Enter password" : null,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text("Login"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
