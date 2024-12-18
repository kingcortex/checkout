import 'package:checkout/models/cart_item_model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SummaryController extends GetxController {
  List<CartItemModel> items = [
    CartItemModel(name: "Nike Stan Smith", color: "Apple Green", imagePath: 'assets/pngs/Rectangle 6.png'),
    CartItemModel(name: "Nike Stan Smith", color: "Apple Green", imagePath: 'assets/pngs/Rectangle 16.png'),
  ];
}
