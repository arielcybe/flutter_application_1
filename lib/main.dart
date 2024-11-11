import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador de Caracteres',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CharacterCounterPage(),
    );
  }
}

class CharacterCounterPage extends StatefulWidget {
  @override
  _CharacterCounterPageState createState() => _CharacterCounterPageState();
}

class _CharacterCounterPageState extends State<CharacterCounterPage> {
  final TextEditingController _controller = TextEditingController();
  String _processedText = "";

  // Función para procesar el texto ingresado
  void _processText() {
    String input = _controller.text;
    if (input.isEmpty) {
      setState(() {
        _processedText = "Ingrese texto para procesar";
      });
      return;
    }

    String result = "";
    int count = 1;

    for (int i = 0; i < input.length; i++) {
      // Verificamos si el carácter actual es igual al siguiente
      if (i < input.length - 1 && input[i] == input[i + 1]) {
        count++;
      } else {
        // Agregamos el carácter y su conteo al resultado
        result += "${input[i]}$count";
        count = 1;
      }
    }

    setState(() {
      _processedText = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador de Caracteres'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Ingrese texto',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _processText,
              child: Text('Procesar'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Texto Procesado:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              _processedText,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}