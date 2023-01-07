import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_cashier/features/menu/domain/model/menu.dart';
import 'package:my_cashier/util/extension/number_extensions.dart';

class MenuListItem extends StatelessWidget {
  const MenuListItem({super.key, required this.data, required this.onTap});

  final Menu data;
  final ValueChanged<Menu> onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () => onTap(data),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.grey.withOpacity(0.25),
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.nama ?? "",
                    style:
                        Get.textTheme.headline5?.copyWith(color: Colors.black),
                  ),
                  Visibility(
                    visible: data.description != null,
                    child: Column(
                      children: [
                        const SizedBox(height: 2),
                        Text(
                          data.description ?? "",
                          style: Get.textTheme.bodyText2
                              ?.copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  RichText(
                    text: TextSpan(
                      style: Get.textTheme.bodyText2
                          ?.copyWith(color: Colors.black),
                      children: [
                        const TextSpan(text: "Stock: "),
                        TextSpan(
                            text: data.stock.toString(),
                            style: Get.textTheme.bodyText2?.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Text(
              data.harga?.toCurrency() ?? "-",
              style: Get.textTheme.headline6?.copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
