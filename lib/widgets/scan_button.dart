import 'package:flutter/material.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        elevation: 0,
        child: const Icon(Icons.filter_center_focus),
        onPressed: () async {
          String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3D8BEF', 'Cancelar', false, ScanMode.QR );
          // const String barcodeScanRes = 'https://jesussuyon.pythonanywhere.com/';
          // const String barcodeScanRes = '-6.772109,-79.837215';
          // si el usuario cancelo la operacion no hace nada
          if (barcodeScanRes == '-1') return;

          final scanListProvider =   Provider.of<ScanListProvider>(context, listen: false);

          final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);

          // Navega ni bien termina de escanear
          // ignore: use_build_context_synchronously
          launchURL(context, nuevoScan);
        });
  }
}
