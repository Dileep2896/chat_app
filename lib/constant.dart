import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.purple,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(
    vertical: 10.0,
    horizontal: 20.0,
  ),
  hintText: 'Type your message here...',
  hintStyle: TextStyle(color: Colors.purple),
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.purple, width: 2.0),
  ),
);

var kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(
    color: Colors.purple.shade300,
  ),
  contentPadding: const EdgeInsets.symmetric(
    vertical: 10.0,
    horizontal: 20.0,
  ),
  border: const OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(32.0),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.purple.shade300,
      width: 1.0,
    ),
    borderRadius: const BorderRadius.all(
      Radius.circular(32.0),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.purple.shade500,
      width: 2.0,
    ),
    borderRadius: const BorderRadius.all(
      Radius.circular(32.0),
    ),
  ),
);
