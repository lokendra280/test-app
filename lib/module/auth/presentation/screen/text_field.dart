import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

class TextScreen extends StatefulWidget {
  @override
  _TextScreenState createState() => _TextScreenState();
}

class _TextScreenState extends State<TextScreen> {
  late AutoCompleteTextField textField;
  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();

  List<String> suggestions = [
    'Apple',
    'Banana',
    'Cherry',
    'Durian',
    'Elderberry',
    'Fig',
    'Grapes',
    'Honeydew',
    'Jackfruit',
  ];

  @override
  Widget build(BuildContext context) {
    textField = AutoCompleteTextField<String>(
      key: key,
      suggestions: suggestions,
      decoration: const InputDecoration(
        labelText: 'Enter a fruit',
        hintText: 'Start typing...',
      ),
      itemFilter: (item, query) => item.toLowerCase().startsWith(query.toLowerCase()),
      itemSorter: (a, b) => a.compareTo(b),
      itemSubmitted: (item) {
        setState(() {
          textField.textField?.controller?.text = item;
        });
      },
      itemBuilder: (context, item) => ListTile(title: Text(item)),
    );

    return Scaffold(
      appBar: AppBar(title: Text('AutoCompleteTextField')),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            textField,
            const SizedBox(height: 16.0),
            Text(
              'Suggestions: ${textField.suggestions.length}',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
