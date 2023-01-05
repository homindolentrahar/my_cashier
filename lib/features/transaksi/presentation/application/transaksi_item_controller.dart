import 'package:get/get.dart';
import 'package:my_cashier/features/menu/domain/model/menu.dart';
import 'package:my_cashier/features/transaksi/domain/model/transaksi.dart';
import 'package:my_cashier/features/transaksi/domain/model/transaksi_item_with_transaksi_menu.dart';
import 'package:my_cashier/util/helper/secure_storage_helper.dart';

class TransaksiItemController extends GetxController {
  int quantity = 0;
  double subtotal = 0;

  Menu? menu;
  TransaksiDetail? order;

  TransaksiItemController({this.menu, this.order}) {
    quantity = order?.quantity ?? 1;
    subtotal = order?.subtotal ?? 1 * (menu?.harga ?? 0.0);
  }

  void amountChanged(int value) {
    if (quantity == 1 && value == -1) {
      return;
    }

    quantity += value;
    subtotal += value * (menu?.harga ?? 0);

    update();
  }

  Future<TransaksiDetail> getOrder() async {
    final savedCredential =
        await SecureStorageHelper.instance.getUserCredential();
    return TransaksiDetail(
      menu: menu,
      quantity: quantity,
      subtotal: subtotal,
      transaksi: Transaksi(
        idAdmin: savedCredential?['id'] ?? 0,
        tanggal: DateTime.now(),
      ),
    );
  }
}
