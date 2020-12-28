import 'dart:io' as Io;
import 'dart:convert';

main() {
  ///======= ENCODING =======
  final bytes = Io.File('file.pdf').readAsBytesSync();
  var file64 = base64Encode(bytes);
  print(file64);

  ///======== DECODING =======
  final decodedBytes = base64Decode(file64);
  var file = Io.File("decoded_file.pdf");
  file.writeAsBytesSync(decodedBytes);
}
