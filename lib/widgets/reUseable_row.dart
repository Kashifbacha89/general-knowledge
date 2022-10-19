import 'package:flutter/material.dart';

class ReUseAbleRow extends StatelessWidget {
  const ReUseAbleRow(
      {Key? key, required this.value, required this.title, required this.icon})
      : super(key: key);
  final String value;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Icon(icon),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(width: MediaQuery.of(context).size.width* 0.15 ,),
              Container(
                child: Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
