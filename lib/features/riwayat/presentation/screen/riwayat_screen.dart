import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_cashier/features/riwayat/presentation/application/riwayat_controller.dart';
import 'package:my_cashier/features/riwayat/presentation/widget/riwayat_list_item.dart';
import 'package:my_cashier/model/transaksi_with_menu.dart';

class RiwayatScreen extends StatelessWidget {
  const RiwayatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RiwayatController>(builder: (controller) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Riwayat Transaksi",
                style: Get.textTheme.bodyText1
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: controller.transactions?.length ?? 0,
              separatorBuilder: (ctx, index) => const SizedBox(height: 24),
              itemBuilder: (ctx, index) => RiwayatListItem(
                data: controller.transactions?[index] ?? TransaksiWithDetails(),
              ),
            ),
          ),
        ],
      );
    });
  }
}
