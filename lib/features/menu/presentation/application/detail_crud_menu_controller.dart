import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:my_cashier/features/menu/domain/model/menu.dart';
import 'package:my_cashier/features/menu/domain/repository/i_menu_repository.dart';
import 'package:my_cashier/util/helper/easy_dialog_helper.dart';

class DetailCrudMenuController extends GetxController {
  final IMenuRepository repository;

  DetailCrudMenuController(this.repository);

  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  Menu? initialData;

  @override
  void onInit() {
    initialData = Get.arguments;
    super.onInit();
  }

  bool get isCreate => initialData == null;

  Future<void> createMenu() async {
    EasyDialogHelper.showLoading();

    final formData = formKey.currentState!.value;
    final data = Menu(
      nama: formData['name'],
      description: formData['description'],
      harga: double.parse(formData['price']),
      stock: int.parse(formData['stock']),
    );
    final result = await repository.createMenu(data);

    EasyDialogHelper.hideDialog();

    result.fold(
      (error) {
        EasyDialogHelper.showError(error);
      },
      (_) {
        Get.back();
        EasyDialogHelper.showSuccess("Berhasill menambahkan data");
      },
    );
  }

  Future<void> updateMenu() async {
    EasyDialogHelper.showLoading();

    final formData = formKey.currentState!.value;
    final data = Menu(
      id: initialData?.id ?? 0,
      idAdmin: initialData?.idAdmin ?? 0,
      nama: formData['name'],
      description: formData['description'],
      harga: double.parse(formData['price']),
      stock: int.parse(formData['stock']),
    );
    final result = await repository.updateMenu(
      id: initialData?.id ?? 0,
      data: data,
    );

    EasyDialogHelper.hideDialog();

    result.fold(
      (error) {
        EasyDialogHelper.showError(error);
      },
      (_) {
        Get.back();
        EasyDialogHelper.showSuccess("Berhasill memperbarui data");
      },
    );
  }

  Future<void> deleteMenu() async {
    EasyDialogHelper.showLoading();

    final result = await repository.deleteMenu(initialData?.id ?? 0);

    EasyDialogHelper.hideDialog();

    result.fold(
      (error) {
        EasyDialogHelper.showError(error);
      },
      (_) {
        Get.back();
        EasyDialogHelper.showSuccess("Berhasill menghapus data");
      },
    );
  }
}
