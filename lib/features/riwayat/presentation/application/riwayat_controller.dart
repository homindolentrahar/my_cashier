import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:my_cashier/data/local/cashier_database.dart';
import 'package:my_cashier/features/transaksi/domain/repository/i_transaksi_repository.dart';
import 'package:my_cashier/model/transaksi_with_menu.dart';
import 'package:my_cashier/util/helper/easy_dialog_helper.dart';

class RiwayatController extends GetxController {
  final ITransaksiRepository repository;

  RiwayatController(this.repository);

  List<TransaksiWithDetails>? transactions;

  @override
  void onInit() {
    listenAllTransactions();
    super.onInit();
  }

  void listenAllTransactions() {
    Get.find<CashierDatabase>().watchAllTransactions().listen(
          (either) => either.fold(
            (error) {
              EasyDialogHelper.showError(error);
            },
            (list) {
              Logger().w("Details: ${list.map((e) => e.details).toList()}");
              transactions = list;
              update();
            },
          ),
        );
  }
}
