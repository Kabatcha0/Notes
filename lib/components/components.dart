import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void navigator({required BuildContext context, required Widget widget}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

Widget button({required Function() function}) {
  return MaterialButton(
    onPressed: function,
    child: const Text(
      "Sumbit",
      style: TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
    ),
  );
}

Widget textField(
    {required String hint,
    required int max,
    required TextEditingController textEditingController}) {
  return TextFormField(
    decoration: InputDecoration(
        hintText: hint, hintStyle: const TextStyle(fontSize: 15)),
    maxLines: max,
    controller: textEditingController,
    style: const TextStyle(fontSize: 15),
  );
}

Widget note(
    {required String description,
    required String title,
    required String time,
    required Function() func,
    required Function() function}) {
  return InkWell(
    onTap: function,
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.cyan[300]),
      padding: const EdgeInsets.all(7),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ),
              InkWell(
                  onTap: func,
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ))
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.normal),
            ),
          ),
          const Spacer(),
          Text(
            time,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.normal),
          )
        ],
      ),
    ),
  );
}
