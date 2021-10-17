import 'package:first_app/student.dart';
import 'package:flutter/material.dart';
class DetailsPage extends StatelessWidget {
  final Student std;

  DetailsPage(this.std);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details:'),
      ),
      body: Text('Name: ${std.name}\n'
          'ID: ${std.id}\n'
          'GPA: ${std.gpa}\n'
          'Year of birth: ${std.year}\n',
      style: TextStyle(fontSize: 25.0),
      ),
    );
  }
}
