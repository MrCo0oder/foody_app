import 'package:foody_app/app/extentions.dart';
import 'package:foody_app/domain/model/auth_model.dart';
import 'package:foody_app/domain/model/contacts_model.dart';
import 'package:foody_app/domain/model/customer_model.dart';

import '../../data/responses/response.dart';

extension CustomerMapper on CustomerResponse?{
  CustomerModel toDomain() {
    return CustomerModel(this?.id.orEmpty ?? "", this?.name.orEmpty ?? "",
        this?.notificationCount.orZero ?? 0);
  }
}
extension ContactsMapper on ContactsResponse?{
  ContactsModel toDomain() {
    return ContactsModel(this?.phone.orEmpty ?? "", this?.email.orEmpty ?? "",
        this?.link.orEmpty ?? "");
  }
}
extension AuthenticationMapper on AuthenticationResponse?{
  AuthModel toDomain() {
    return AuthModel(this?.status.orZero ?? 0, this?.message.orEmpty ?? '',
        contacts: this?.contacts.toDomain(),
        customer: this?.customer.toDomain());
  }
}