import 'package:estudo/models/repository.dart';
import 'package:flutter/material.dart';

class ListItems extends StatelessWidget {
  final String? name;
  final String? description;
  final String icon;
  final String? additionalInfo;
  final int forksCount;

  ListItems(
      {required this.name,
      required this.description,
      required this.icon,
      required this.additionalInfo,
      required this.forksCount});

  final Map<String, IconData> iconMap = {
    'code': Icons.code,
    'star': Icons.star,
  };

  @override
  Widget build(BuildContext context) {
    final IconData iconList = iconMap[icon] ?? Icons.error;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${name}',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              if (description != null) SizedBox(height: 5),
              if (description != null)
                Text(
                  '${description}',
                  style: TextStyle(
                    color: Color(0xFF999999),
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                ),
              SizedBox(height: 10),
              if (additionalInfo != null)
                Row(
                  children: [
                    Icon(iconList, color: Colors.black),
                    SizedBox(width: 5),
                    Text(
                      '${additionalInfo}',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 20),
                    Icon(Icons.call_split, color: Color(0xFF586069)),
                    SizedBox(width: 5),
                    Text(
                      forksCount.toString(),
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
        Divider(color: Color(0xFFE1E4E8)),
      ],
    );
  }
}
