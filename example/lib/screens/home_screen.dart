import 'package:flutter/material.dart';
import 'package:sam_textbox_flutter/sam_textbox_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _textEditingController = TextEditingController();
  IconData _suffixIcon;
  Color _borderColor;

  @override
  void initState() {
    super.initState();
    _suffixIcon = Icons.check_circle;
    _borderColor =
        _textEditingController.text.isEmpty ? Colors.red : Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('SAM Demo TextBox'),
      ),
      body: Center(
        child: SamTextBox(
          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          isEnabled: true,
          controller: _textEditingController,
          hintText: 'Enter some text',
          errorText: 'Error text',
          suffixIcon: _suffixIcon,
          borderColor: _borderColor,
          onChanged: (value) {
            setState(() {
              _borderColor = value.toString() == "" ? Colors.red : Colors.green;
              _suffixIcon =
                  value.toString() == "" ? Icons.cancel : Icons.check_circle;
            });
          },
          validator: (value) {
            if (value.isEmpty) {
              setState(() {
                _borderColor = Colors.red;
                _suffixIcon = Icons.cancel;
              });
              return 'Error text';
            }
            return null;
          },
        ),
      ),
    );
  }
}
