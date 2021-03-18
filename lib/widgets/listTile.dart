import 'package:flutter/material.dart';

ListTile  listTile({BuildContext context,Icon icon, String label, String link})
{
  return ListTile(
    onTap: (){
      Navigator.pushNamed(context, link);
    },
    leading: icon,
    title: Text(
      label,
      style: TextStyle(
        fontSize: 16,
        fontFamily: "Montserrat",
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}