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
}
