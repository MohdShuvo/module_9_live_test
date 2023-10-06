import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Size Selector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedSize = '';
  Color selectedColor = Colors.transparent;

  void _changeButtonColor(String size, Color color) {
    setState(() {
      selectedSize = size;
      selectedColor = color;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Selected Size: $size'),
      ),
    );
  }

  Widget _buildButton(String size, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: () {
          _changeButtonColor(size, color);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            color == selectedColor ? Colors.orange : color,
          ),
        ),
        child: Text(size),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Size Selector'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildButton('S', Colors.grey),
                _buildButton('M', Colors.red),
                _buildButton('L', Colors.blue),
                _buildButton('XL', Colors.purple),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildButton('XXL', Colors.pink),
                _buildButton('XXXL', Colors.green),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
