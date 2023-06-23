// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';

// class FillFireStore with ChangeNotifier {
//   var kdata;
//   void retrievekData() {
//     var fireStoreInstance =
//         FirebaseFirestore.instance.collection("kids").doc("kidsProduct");
//     fireStoreInstance.get().then((DocumentSnapshot documentSnapshot) {
//       if (documentSnapshot.exists) {
//         kdata = documentSnapshot.data() as Map<String, dynamic>;
//       } else {
//         print('Document does not exist on the database');
//       }
//     });
//   }

//   var gdata;
//   void retrievegData() {
//     var fireStoreInstance =
//         FirebaseFirestore.instance.collection("glasses").doc("glassesProduct");
//     fireStoreInstance.get().then((DocumentSnapshot documentSnapshot) {
//       if (documentSnapshot.exists) {
//         gdata = documentSnapshot.data() as Map<String, dynamic>;
//       } else {
//         print('Document does not exist on the database');
//       }
//     });
//   }

//   var tsdata;
//   void retrievetsData() {
//     var fireStoreInstance = FirebaseFirestore.instance
//         .collection("t-shirts")
//         .doc("t-shirtsProduct");
//     fireStoreInstance.get().then((DocumentSnapshot documentSnapshot) {
//       if (documentSnapshot.exists) {
//         tsdata = documentSnapshot.data() as Map<String, dynamic>;
//       } else {
//         print('Document does not exist on the database');
//       }
//     });
//   }

//   var tdata;
//   void retrievetData() {
//     var fireStoreInstance = FirebaseFirestore.instance
//         .collection("trousers")
//         .doc("trousersProduct");
//     fireStoreInstance.get().then((DocumentSnapshot documentSnapshot) {
//       if (documentSnapshot.exists) {
//         tdata = documentSnapshot.data() as Map<String, dynamic>;
//       } else {
//         print('Document does not exist on the database');
//       }
//     });
//   }

//   var sdata;
//   void retrievesData() {
//     var fireStoreInstance =
//         FirebaseFirestore.instance.collection("shoes").doc("shoesProduct");
//     fireStoreInstance.get().then((DocumentSnapshot documentSnapshot) {
//       if (documentSnapshot.exists) {
//         sdata = documentSnapshot.data() as Map<String, dynamic>;
//       } else {
//         print('Document does not exist on the database');
//       }
//     });
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FillFireStore with ChangeNotifier {
  var kdata;
  Future<void> retrievekData() async {
    var fireStoreInstance =
        FirebaseFirestore.instance.collection("kids").doc("kidsProduct");
    var documentSnapshot = await fireStoreInstance.get();
    if (documentSnapshot.exists) {
      kdata = documentSnapshot.data() as Map<String, dynamic>;
    } else {
      print('Document does not exist on the database');
    }
  }

  var gdata;
  Future<void> retrievegData() async {
    var fireStoreInstance =
        FirebaseFirestore.instance.collection("glasses").doc("glassesProduct");
    var documentSnapshot = await fireStoreInstance.get();
    if (documentSnapshot.exists) {
      gdata = documentSnapshot.data() as Map<String, dynamic>;
    } else {
      print('Document does not exist on the database');
    }
  }

  var tsdata;
  Future<void> retrievetsData() async {
    var fireStoreInstance = FirebaseFirestore.instance
        .collection("t-shirts")
        .doc("t-shirtsProduct");
    var documentSnapshot = await fireStoreInstance.get();
    if (documentSnapshot.exists) {
      tsdata = documentSnapshot.data() as Map<String, dynamic>;
    } else {
      print('Document does not exist on the database');
    }
  }

  var tdata;
  Future<void> retrievetData() async {
    var fireStoreInstance = FirebaseFirestore.instance
        .collection("trousers")
        .doc("trousersProduct");
    var documentSnapshot = await fireStoreInstance.get();
    if (documentSnapshot.exists) {
      tdata = documentSnapshot.data() as Map<String, dynamic>;
    } else {
      print('Document does not exist on the database');
    }
  }

  var sdata;
  Future<void> retrievesData() async {
    var fireStoreInstance =
        FirebaseFirestore.instance.collection("shoes").doc("shoesProduct");
    var documentSnapshot = await fireStoreInstance.get();
    if (documentSnapshot.exists) {
      sdata = documentSnapshot.data() as Map<String, dynamic>;
    } else {
      print('Document does not exist on the database');
    }
  }
}
