import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Storage with ChangeNotifier {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  late List<String> adsImagesUrl = List.filled(4, '0');
  late List<String> tImagesUrl = List.filled(6, '0');
  late List<String> tsImagesUrl = List.filled(6, '0');
  late List<String> sImages = List.filled(6, '0');
  late List<String> gImages = List.filled(5, '0');
  late List<String> kImages = List.filled(5, '0');
  Future<void> listFile(String folderName, List<String> array) async {
    firebase_storage.ListResult results = await storage.ref(folderName).list();

    results.items.forEach(
      (firebase_storage.Reference ref) async {
        String downloadUrl = await storage.ref(ref.fullPath).getDownloadURL();
        String ix = ref.fullPath;
        var index = int.parse(ix[3]);
        array[index] = downloadUrl;
      },
    );
  }

  Future<void> loadImages() async {
    await Future.delayed(Duration(seconds: 5));
    notifyListeners();
  }
}
