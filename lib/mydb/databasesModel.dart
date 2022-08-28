class Employee {
  final int Id;
  final String Name;
  final int Age;
  final int Basic;
  static final columns = ["Id", "Name", "Age", "Basic"];

  Employee(
      {required this.Id,
      required this.Name,
      required this.Age,
      required this.Basic});

  factory Employee.fromMap(Map<String, dynamic> map) {
    return Employee(
        Id: map['Id'], Name: map['Name'], Age: map['Age'], Basic: map['Basic']);
  }
  Map<String, dynamic> toMap() => {
        'Name': Name,
        'Id': Id,
        'Age': Age,
        'Basic': Basic,
      };
}

class Project {
  final int id;
  final String name;
  final String location;
  static final columns = ["id", "name", "location"];
  Project(this.id, this.name, this.location);
  factory Project.fromMap(Map<String, dynamic> data) {
    return Project(
      data['id'],
      data['name'],
      data['location'],


    );
  }
  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "location": location,
      };
}
