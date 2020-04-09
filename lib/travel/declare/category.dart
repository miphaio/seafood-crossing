abstract class Enum<T> {
  final T value;

  const Enum(this.value);
}

class DestinationCategory extends Enum<String> {
  const DestinationCategory(String val) : super(val);

  static const DestinationCategory TURNIP_BUY =
      const DestinationCategory("TURNIP_BUY");
  static const DestinationCategory TURNIP_SELL =
      const DestinationCategory("TURNIP_SELL");
  static const DestinationCategory TOUR = const DestinationCategory("TOUR");
  static const DestinationCategory MABEL = const DestinationCategory("MABEL");
  static const DestinationCategory SAHARAH =
      const DestinationCategory("SAHARAH");
  static const DestinationCategory OTHER = const DestinationCategory("OTHER");

  static final List<DestinationCategory> list = [
    DestinationCategory.TURNIP_BUY,
    DestinationCategory.TURNIP_SELL,
    DestinationCategory.TOUR,
    DestinationCategory.MABEL,
    DestinationCategory.SAHARAH,
    DestinationCategory.OTHER,
  ];

  static includes(String value) {
    return value == DestinationCategory.TURNIP_BUY.value ||
        value == DestinationCategory.TURNIP_SELL.value ||
        value == DestinationCategory.TOUR.value ||
        value == DestinationCategory.MABEL.value ||
        value == DestinationCategory.SAHARAH.value ||
        value == DestinationCategory.OTHER.value;
  }

  static from(String value) {
    return DestinationCategory(value);
  }
}
