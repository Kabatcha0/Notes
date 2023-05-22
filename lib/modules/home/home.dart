import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/components/components.dart';
import 'package:notes/cubit/cubit.dart';
import 'package:notes/cubit/states.dart';
import 'package:notes/modules/add_note/add_note.dart';
import 'package:notes/modules/details/details.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesStates>(
      builder: (context, state) {
        var cubit = NotesCubit.get(context);

        return Scaffold(
          body: SafeArea(
            child: cubit.getModel.isEmpty
                ? Container()
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                        itemCount: cubit.getModel.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 9 / 9.4,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                        itemBuilder: (context, index) => note(
                            func: () {
                              cubit.deleteData(id: cubit.getModel[index]["id"]);
                            },
                            description: cubit.getModel[index]["description"],
                            title: cubit.getModel[index]["title"],
                            time: cubit.getModel[index]["time"],
                            function: () {
                              navigator(
                                  context: context,
                                  widget: Details(index: index));
                            }))),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              navigator(context: context, widget: AddNotes());
            },
            backgroundColor: Colors.cyan,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
