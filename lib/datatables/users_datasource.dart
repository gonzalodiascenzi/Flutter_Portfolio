import 'package:flutter/material.dart';


import '../models/http/usuario.dart';
import '../services/navigation_service.dart';

class UsersDataSource extends DataTableSource {

  final List<Usuario> users;

  UsersDataSource(this.users);


  @override
  DataRow getRow(int index) {
    
    final Usuario user = users[index];

    const image = Image( image: AssetImage('no-image.jpg'), width: 35, height: 35 );


    return DataRow.byIndex(
      index: index,
      cells: [
        const DataCell( 
          ClipOval( child: image )
        ),
        DataCell( Text( user.nombre ) ),
        DataCell( Text( user.correo ) ),
        DataCell( Text( user.uid ) ),
        DataCell(
          IconButton(
            icon: const Icon( Icons.edit_outlined ), 
            onPressed: () {
              NavigationService.replaceTo('/dashboard/users/${ user.uid }');
            }
          )
        ),
      ]
    );
  }

  @override
  
  bool get isRowCountApproximate => false;

  @override
  
  int get rowCount => this.users.length;

  @override
  
  int get selectedRowCount => 0;


}