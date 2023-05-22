import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/components/components.dart';
import 'package:notes/cubit/cubit.dart';
import 'package:notes/cubit/states.dart';
import 'package:notes/modules/home/home.dart';

class AddNotes extends StatelessWidget {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesStates>(
        builder: (context, state) {
          var cubit = NotesCubit.get(context);
          return Scaffold(
            body: SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  textField(
                      hint: "title", max: 1, textEditingController: title),
                  const SizedBox(
                    height: 15,
                  ),
                  textField(
                      hint: "description",
                      max: 10,
                      textEditingController: description),
                  const Spacer(),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(10)),
                    child: button(function: () {
                      cubit.insert(
                          important: true,
                          number: 1,
                          title: title.text,
                          description: description.text,
                          time: DateTime.now().toString().substring(0, 10));

                      navigator(context: context, widget: const Home());
                    }),
                  )
                ],
              ),
            )),
          );
        },
        listener: (context, state) {});
  }
}
