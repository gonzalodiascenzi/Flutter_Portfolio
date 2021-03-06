// ignore_for_file: unnecessary_this, avoid_print

import 'package:flutter/material.dart';

import '../api/CafeApi.dart';
import '../models/http/usuario.dart';

class UserFormProvider extends ChangeNotifier {

  Usuario? user;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // void updateListener() {
  //   notifyListeners();
  // }
  copyUserWith({
    String? rol,
    bool? estado,
    bool? google,
    String? nombre,
    String? correo,
    String? uid,
    String? img,
  }) {
    user = Usuario(
      rol: rol ?? this.user!.rol,
      estado: estado ?? this.user!.estado,
      google: google ?? this.user!.google,
      nombre: nombre ?? this.user!.nombre,
      correo: correo ?? this.user!.correo,
      uid: uid ?? this.user!.uid,
      img: img ?? this.user!.img,
    );
    notifyListeners();
  }



  bool _validForm() {
    return formKey.currentState!.validate();
  }

  Future updateUser() async {

    if ( !this._validForm() ) return false;

    final data = {
      'nombre': user!.nombre,
      'correo': user!.correo,
    };

    try {
      
      final resp = await CafeApi.put('/usuarios/${ user!.uid }', data);
      print( resp );
      return true;

    } catch (e) {
      print('error en updateUser: $e');
      return false;
    }


  }


}
