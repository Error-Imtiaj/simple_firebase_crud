class people {
  String? id;
  String? firstName;
  String? lastName;
  int? age;
  String? email;

  people({this.firstName, this.lastName, this.age, this.email, this.id});

  // convert to map
  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
      'email': email
    };
  }

  // from map to model
  factory people.fromMap(Map<String, dynamic> map) {
    return people(
      firstName: map['firstName'],
      lastName: map['lastName'],
      age: map['age'],
      email: map['email'],
      id: map['id'],
    );
  }
}
