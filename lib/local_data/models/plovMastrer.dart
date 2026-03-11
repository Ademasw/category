// ignore_for_file: file_names

class PlovMasterModel {
  final String typePlovMasterName;
  final int timeFoCook;
  bool isSelected;

  PlovMasterModel(
      {required this.typePlovMasterName,
      required this.timeFoCook,
      required this.isSelected});

  static List<PlovMasterModel> getListDelivery() {
    List<PlovMasterModel> listDelivery = [
      PlovMasterModel(
          typePlovMasterName: 'Быстро приготовить',
          timeFoCook: 30,
          isSelected: true),
      PlovMasterModel(
          typePlovMasterName: 'Приготовить в течение дня',
          timeFoCook: 360,
          isSelected: false),
      PlovMasterModel(
          typePlovMasterName: 'старательно долого готовить',
          timeFoCook: 720,
          isSelected: false),
    ];
    return listDelivery;
  }
}
