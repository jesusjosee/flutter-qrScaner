import 'package:flutter/material.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';


Future<void> launchURL(BuildContext context, ScanModel scan) async {
  final url = scan.valor;
  // ignore: no_leading_underscores_for_local_identifiers
  final Uri _url = Uri.parse(url);

  if (scan.tipo == 'http') {
    // abrir el sitio web
    if ( !await launchUrl(_url) ) throw Exception('Could not launch $_url');

  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }

}
