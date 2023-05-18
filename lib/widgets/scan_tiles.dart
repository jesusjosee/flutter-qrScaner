import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/utils/utils.dart';

import '../providers/scan_list_provider.dart';

class ScanTiles extends StatelessWidget {
  final String tipo;

  const ScanTiles({super.key,  required this.tipo});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, index) => Dismissible(
        key: Key(scans[index].id.toString()),
        onDismissed: (direction) {
          Provider.of<ScanListProvider>(context, listen: false).borrarScanById(scans[index].id!);
        },
        background: Container(
          color: Colors.red,
        ),
        child: ListTile(
          leading: Icon(
            tipo == 'http' ? Icons.map_outlined : Icons.home_outlined , 
            color: Colors.purple),
          title: Text(scans[index].valor),
          subtitle: Text(scans[index].id.toString()),
          trailing: const Icon(
            Icons.keyboard_arrow_right,
            color: Colors.grey,
          ),
          onTap: () => launchURL(context, scans[index]),
        ),
      ),
    );
  }
}
