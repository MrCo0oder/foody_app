import 'package:foody_app/domain/model/customer_model.dart';

import 'contacts_model.dart';

class AuthModel {
  AuthModel(
    this.status,
    this.message, {
    this.customer,
    this.contacts,
  });

  int status;
  String message;
  CustomerModel? customer;
  ContactsModel? contacts;
}
