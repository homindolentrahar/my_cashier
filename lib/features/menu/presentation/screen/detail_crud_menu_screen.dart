import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:my_cashier/features/menu/presentation/application/detail_crud_menu_controller.dart';
import 'package:my_cashier/presentation/widget/app_text_field.dart';

class DetailCrudMenuScreen extends StatelessWidget {
  const DetailCrudMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailCrudMenuController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              LineIcons.arrowLeft,
              color: Colors.black,
            ),
          ),
          title: Text(
            controller.isCreate ? "Tambah Menu" : "Perbarui Menu",
            style: Get.textTheme.headline5,
          ),
          actions: controller.isCreate
              ? null
              : [
                  IconButton(
                    icon: const Icon(LineIcons.trash, color: Colors.red),
                    onPressed: () {
                      Get.defaultDialog(
                        title: "Hapus Menu",
                        titleStyle: Get.textTheme.headline5
                            ?.copyWith(color: Colors.red),
                        titlePadding: const EdgeInsets.all(16),
                        radius: 8,
                        content: Text(
                          "Data menu tidak dapat dikembalikan jika anda menghapusnya",
                          textAlign: TextAlign.center,
                          style: Get.textTheme.bodyText1
                              ?.copyWith(color: Colors.grey),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        actions: [
                          TextButton(
                            child: Text(
                              "Batal",
                              style: Get.textTheme.headline6
                                  ?.copyWith(color: Colors.grey),
                            ),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                          const SizedBox(width: 16),
                          TextButton(
                            child: Text(
                              "Hapus",
                              style: Get.textTheme.headline6
                                  ?.copyWith(color: Colors.red),
                            ),
                            onPressed: () {
                              controller.deleteMenu();
                              Get.back();
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: FormBuilder(
              key: controller.formKey,
              child: Column(
                children: [
                  AppTextField(
                    initialValue: controller.initialData?.nama,
                    name: 'name',
                    hint: "Nama Menu",
                    action: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(3),
                    ]),
                  ),
                  const SizedBox(height: 16),
                  AppTextField(
                    initialValue: controller.initialData?.description,
                    name: 'description',
                    hint: "Deskripsi Menu",
                    maxLines: 5,
                    action: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                  const SizedBox(height: 16),
                  AppTextField(
                    initialValue: controller.initialData?.harga?.toString(),
                    name: 'price',
                    hint: "Harga Menu",
                    action: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.numeric(),
                    ]),
                  ),
                  const SizedBox(height: 16),
                  AppTextField(
                    initialValue: controller.initialData?.stock?.toString(),
                    name: 'stock',
                    hint: "Jumlah Stok",
                    action: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.numeric(),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16),
          child: MaterialButton(
            elevation: 0,
            highlightElevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.all(16),
            color: Get.theme.primaryColor,
            child: Text(
              controller.isCreate ? "Simpan" : "Perbarui",
              style: Get.textTheme.headline5?.copyWith(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              if (controller.formKey.currentState!.saveAndValidate()) {
                controller.isCreate
                    ? controller.createMenu()
                    : controller.updateMenu();
              }
            },
          ),
        ),
      );
    });
  }
}
