import 'package:first_app/details_page.dart';
import 'package:flutter/material.dart';
import 'student.dart';

void main() {
  runApp(Main());
}

List<Student> students = [
  Student(name: 'Ahmad Tamimi',id: '03/0577', gpa: 85.6, year: 1984),
  Student(name: 'Tala Hamed',id: '20/1177', gpa: 90.7, year: 2001),
  Student(name: 'ٌRawan Ashour',id: '18/6039', gpa: 83.6, year: 2000),
  Student(name: 'Mutasem Alheeh',id: '03/0177', gpa: 91.1, year: 1984),
];

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MainPage()
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text('Student App'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          GestureDetector(
            child: StudentCard(std: students[0],action: 'Tap',),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => DetailsPage(students[0]),)
              );
            },
          ),
          GestureDetector(
            child: StudentCard(std: students[1],action: 'Double tap',),
            onDoubleTap: () {
              Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(students[1]),)
              );
            },
          ),
          GestureDetector(
            child: StudentCard(std: students[2],action: 'Long press',),
            onLongPress: () {
              Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(students[2]),)
              );
            },
          ),
          GestureDetector(
            child: StudentCard(std: students[3],action: 'Drag right/left',),
            onHorizontalDragEnd: (x) {
              Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(students[3]),)
              );
            },
          ),
        ],
      ),
    );
  }
}
class StudentCard extends StatefulWidget {
  final Student std;
  final String action;
  StudentCard({this.std,this.action});

  @override
  _StudentCardState createState() => _StudentCardState();
}

class _StudentCardState extends State<StudentCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 160.0,
        child: Card(
          elevation: 10.0,
          color: Colors.white70,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Name: ', style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
                            Text(this.widget.std.name, style: TextStyle(fontSize: 22,letterSpacing: 2.0),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Id: ', style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
                            Text(this.widget.std.id, style: TextStyle(fontSize: 22,letterSpacing: 2.0),),
                          ],
                        ),
                      ],
                    ),
                    //Image.asset('images/anonymous.jpg',width: 40,height: 40,),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/anonymous.jpg'),
                      radius: 40.0,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        icon: widget.std.fav
                            ? Icon(Icons.star,color: Colors.amber,)
                            : Icon(Icons.star_border,color: Colors.amber,),
                        onPressed: () {
                          widget.std.fav = !(widget.std.fav);
                          setState(() { });
                        }
                        ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('${this.widget.action} to show details'),
                        Icon(Icons.navigate_next,size: 30,)
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}