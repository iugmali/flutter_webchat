import 'package:flutter/material.dart';
import 'package:flutter_webchat/screens/main/main_screen.dart';
import 'package:http/http.dart' as http;

Future<int> userCheck(String username) async {
  var url = Uri.https('webchat.iugmali.com', 'usercheck');
  var response = await http.post(url, body: {'username': username});
  return response.statusCode;
}

class UsernameForm extends StatefulWidget {
  final void Function(String) onSubmit;
  const UsernameForm({required this.onSubmit, super.key});

  @override
  State<UsernameForm> createState() => _UsernameFormState();
}

class _UsernameFormState extends State<UsernameForm> {
  final _usernameController = TextEditingController();

  void _submit() async {
    var username = _usernameController.text;
    if (username.isEmpty) {
      return;
    }
    switch (await userCheck(username)) {
      case 204:
        widget.onSubmit(username);
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const MainScreen()));
        return;
      case 400:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$username não é um nome válido'),
          ),
        );
        return;
      case 403:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$username já está na sala'),
          ),
        );
        return;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Erro ao checar username'),
          ),
        );
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              autofocus: true,
              onSubmitted: (_) {
                _submit();
              },
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Digite seu username',
                constraints: BoxConstraints(
                  maxWidth: 300,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submit,
              child: const Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}