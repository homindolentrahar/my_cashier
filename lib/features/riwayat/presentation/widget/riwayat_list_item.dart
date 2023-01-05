import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_cashier/features/transaksi/domain/model/transaksi.dart';

class RiwayatListItem extends StatelessWidget {
  const RiwayatListItem({super.key, required this.data});

  final Transaksi data;

  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      header: Text(
        DateFormat.yMMMd().format(data.tanggal ?? DateTime.now()),
        style: Get.textTheme.headline6?.copyWith(
          color: Colors.black,
        ),
      ),
      collapsed: Container(),
      expanded: Container(),
    );
  }
}
