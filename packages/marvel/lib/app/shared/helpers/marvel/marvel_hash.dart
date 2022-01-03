import 'dart:convert';

import 'package:crypto/crypto.dart';

class MarvelHash {
  final String timestamp;
  final String public;
  final String private;

  MarvelHash({
    required this.timestamp,
    required this.public,
    required this.private,
  });

  String createHash() {
    return md5.convert(utf8.encode(timestamp + private + public)).toString();
  }
}
