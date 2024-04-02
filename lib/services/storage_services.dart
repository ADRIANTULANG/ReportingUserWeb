import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageServices extends GetxController {
  final storage = GetStorage();

  saveCredentials({
    required String id,
    required String email,
    required String contactnumber,
    required String address,
  }) {
    storage.write("id", id);
    storage.write("email", email);
    storage.write("contactnumber", contactnumber);
    storage.write("address", address);
  }

  removeStorageCredentials() {
    storage.remove("id");
    storage.remove("email");
    storage.remove("screen");
    storage.remove("report");
    storage.remove("contactnumber");
    storage.remove("address");
  }

  saveRoute({required String screen}) {
    storage.write("screen", screen);
  }

  saveModel({required String model}) {
    storage.write('report', model);
  }
}
