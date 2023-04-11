import '../redemption_module.dart';

abstract class GetAvaliableVouchers {
  Future<List<Rescue>?> call();
}

class GetAvaliableVouchersImpl extends GetAvaliableVouchers {
  GetAllRescues getAllRescues;
  GetAvaliableVouchersImpl(
    this.getAllRescues,
  );

  @override
  Future<List<Rescue>?> call() async {
    var result = await getAllRescues();
    if (result == null) {
      return null;
    }

    return result
        .where((element) =>
            element.idStatus == 1 &&
            element.dataVencimento != null &&
            DateTime.parse(element.dataVencimento!).isAfter(DateTime.now()))
        .toList();
  }
}
