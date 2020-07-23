import 'package:firebase_database/firebase_database.dart';

class Restaurant{

String key, image, name, description;

Restaurant(this.key, this.image, this.name, this.description);

// Restaurant.fromSnapshot(DataSnapshot snapshot) :
//     key = snapshot.key,
//     name = snapshot.value["name"],
//     image = snapshot.value["image"],
//     description = snapshot.value["description"];

//   toJson() {
//     return {
//       "name": name,
//       "image": image,
//       "description": description,
//     };
//   }



}