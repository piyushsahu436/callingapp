import 'package:flutter/material.dart';

class Contact {
  final String? id;
  final String name;
  final String phone;

  Contact({
    this.id,
    required this.name,
    required this.phone});

  toJson() {
    return {
      "name": name,
      "Phone":  phone,
    };
  }
}
