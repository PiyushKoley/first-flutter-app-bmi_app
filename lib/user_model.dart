

class User{
  String name;
  String city;

  User({required this.name, required this.city});

  factory User.fromJson(Map<String, String> json) {
    return User(
      name: json['name'] as String, 
      city: json['city'] as String
    );
  }

  Map<String,String> toJson() {
    return {
      "name" : this.name,
      "city" : this.city
    };
  }
  
  User copyWith({
    String? name,
    String? city
  }) {
    return User(
      name: name ?? this.name, 
      city: city ?? this.city
    );
  }

}

void main() {
  User user = User.fromJson({
                "city" : "delhi",
                "name" : "pk"
              });

  print(user.toJson());

  user.name = "ram";
  print(user.toJson());
}