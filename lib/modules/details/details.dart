import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubit/cubit.dart';
import 'package:notes/cubit/states.dart';

class Details extends StatelessWidget {
  int index;
  Details({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesStates>(
        builder: (context, state) {
          var cubit = NotesCubit.get(context);

          return Scaffold(
            backgroundColor: Colors.cyan,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.cyan,
            ),
            body: SafeArea(
                child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    cubit.getModel[index]["title"],
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    cubit.getModel[index]["description"],
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            )),
          );
        },
        listener: (context, state) {});
  }
}
