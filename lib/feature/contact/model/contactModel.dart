import 'dart:io';

class Contact {
  final bool isEdit;
  final File? imagefile;
  final String name;
  final String phone;
  Contact(
      {this.isEdit = false,
      this.imagefile,
      required this.name,
      required this.phone});

  Contact copyWith({File? image, String? name, String? phone}) {
    return Contact(
        imagefile: image ?? this.imagefile,
        name: name ?? this.name,
        phone: phone ?? this.phone);
  }
}
