import 'package:get/get.dart';

class JerseyController extends GetxController {
  var jerseys = <String>[].obs;
  var isLoading = false.obs;
  var selectedJersey = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchJerseys();
  }

  void fetchJerseys() {
    isLoading.value = true;
    try {
      // Add your API call or data fetching logic here
      jerseys.value = ['Jersey 1', 'Jersey 2', 'Jersey 3'];
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch jerseys');
    } finally {
      isLoading.value = false;
    }
  }

  void selectJersey(String jersey) {
    selectedJersey.value = jersey;
  }

  void clearSelection() {
    selectedJersey.value = '';
  }
}
