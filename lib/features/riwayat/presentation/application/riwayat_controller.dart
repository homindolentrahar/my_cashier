import 'package:get/get.dart';
import 'package:my_cashier/features/transaksi/domain/model/transaksi.dart';
import 'package:my_cashier/features/transaksi/domain/repository/i_transaksi_repository.dart';
import 'package:my_cashier/util/helper/easy_dialog_helper.dart';

class RiwayatController extends GetxController {
  final ITransaksiRepository repository;

  RiwayatController(this.repository);

  List<Transaksi>? transactions;

  @override
  void onInit() {
    listenAllTransactions();
    super.onInit();
  }

  void listenAllTransactions() {
    repository.watchAllTransactions().listen(
          (either) => either.fold(
            (error) {
              EasyDialogHelper.showError(error);
            },
            (list) {
              transactions = list;
              update();
            },
          ),
        );
  }
}
