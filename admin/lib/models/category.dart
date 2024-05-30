
class CategoryModel {
  final String? id;
  final String? name;

  CategoryModel({this.id, this.name});

  // Method to convert JSON to CategoryModel
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
    );
  }

  // Method to convert CategoryModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}



















// class CategoryModel {
//   final String id;
//   final String name;
//   final String description;

//   CategoryModel({
//     required this.id,
//     required this.name,
//     required this.description,
//   });

//   // Factory constructor to create a CategoryModel from a map (e.g., from Firestore data)
//   factory CategoryModel.fromMap(Map<String, dynamic> data) {
//     return CategoryModel(
//       id: data['id'] ?? '',
//       name: data['name'] ?? '',
//       description: data['description'] ?? '',
//     );
//   }

//   // Method to convert CategoryModel to a map (e.g., for Firestore)
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'name': name,
//       'description': description,
//     };
//   }
// }
