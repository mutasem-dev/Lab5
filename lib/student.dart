class Student {
  String name,id;
  double gpa;
  int year;
  bool fav = false;
  Student({this.name, this.id, this.gpa, this.year});

  @override
  String toString() {
    return 'Student{name: $name, id: $id, gpa: $gpa, year: $year}';
  }
}