import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubit/states.dart';
import 'package:notes/models/get_model.dart';
import 'package:sqflite/sqflite.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(NotesInitialState());
  static NotesCubit get(context) => BlocProvider.of(context);
  Database? db;
  void init() {
    openDatabase("notes.db", version: 1, onCreate: (database, version) {
      database
          .execute(
              "CREATE TABLE tasks (id INTEGER PRIMARY KEY , isImportant BOOL , number INTEGER , title TEXT , description TEXT  , time TEXT)")
          .then((value) {
        log("done create");
      }).catchError((e) {
        log(e.toString());
      });
    }, onOpen: (database) {
      log("done open");
      getData(database);
    }).then((value) {
      db = value;

      emit(NotesDataBaseExecuteState());
    }).catchError((e) {
      log(e.toString());
    });
  }

  void insert(
      {required bool important,
      required int number,
      required String title,
      required String description,
      required String time}) {
    db
        ?.transaction((txn) => txn
                .rawInsert(
                    'INSERT INTO tasks (isImportant,number,title,description,time)VALUES("$important","$number","$title","$description","$time")')
                .then((value) {})
                .catchError((e) {
              log(e.toString());
            }))
        .then((value) {
      emit(NotesInsertState());

      getData(db);
    }).catchError((e) {
      log(e.toString());
    });
  }

  List<Map> getModel = [];
  void getData(database) {
    getModel = [];
    database!.rawQuery("SELECT * FROM tasks").then((value) {
      value.forEach((e) {
        getModel.add(e);
        emit(NotesGetState());
      });
    }).catchError((e) {
      log(e.toString());
    });
  }

  void deleteData({required int id}) {
    db!.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      getData(db);
      emit(NotesDeleteState());
    });
  }
}
