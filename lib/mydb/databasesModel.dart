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

class Product {
  final int id;
  final String name;
  final String description;
  final int price;
  final String image;
  static final columns = ["id", "name", "description", "price", "image"];
  Product(this.id, this.name, this.description, this.price, this.image);
  factory Product.fromMap(Map<String, dynamic> data) {
    return Product(
      data['id'],
      data['name'],
      data['description'],
      data['price'],
      data['image'],
    );
  }
  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "image": image
      };
}
