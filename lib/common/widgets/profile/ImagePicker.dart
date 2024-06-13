// ignore: file_names
import 'dart:io';
import 'dart:typed_data';
import 'package:ecommerce/user/user_model.dart';
import 'package:ecommerce/user/user_repo.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickers {
  static Future<Uint8List?> pickImage(
      ImageSource source, UserModel usermodel) async {
    try {
      String uniqueFilename = DateTime.now().microsecondsSinceEpoch.toString();

      final ImagePicker _imagePicker = ImagePicker();

      XFile? _file = await _imagePicker.pickImage(source: source);
      if (_file == null) return null;

      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceDirImage = referenceRoot.child("images");
      Reference referenceImageToUpload =
          referenceDirImage.child(uniqueFilename);

      // Upload the file and await the upload task
      await referenceImageToUpload.putFile(File(_file.path));

      // Get the download URL and await the result
      String imageUrl = await referenceImageToUpload.getDownloadURL();

      // Update user record with the image URL
      await UserRepository.updateUserRecord(usermodel, "Photo", imageUrl);
    } catch (e) {
      throw Exception("No Image Selected!");
    }
    return null;
  }
}