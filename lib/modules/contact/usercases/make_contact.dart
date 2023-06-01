import 'package:donuz_dart_sdk/modules/contact/models/contact_model.dart';
import 'package:donuz_dart_sdk/modules/contact/repositories/contact_repository.dart';

import '../../establishment/establishment_module.dart';

abstract class MakeContact {
  Future<bool> call({required ContactModel contact});
}

class MakeContactImpl implements MakeContact {
  final ContactRepository _repository;
  final FindEstablishmentById _findEstablishmentById;

  MakeContactImpl(this._repository, this._findEstablishmentById);
  @override
  Future<bool> call({required ContactModel contact}) async {
    var establisment = await _findEstablishmentById.currentId();
    if (establisment == null) return false;

    return await _repository.makeContact(contact: contact, appId: establisment);
  }
}
