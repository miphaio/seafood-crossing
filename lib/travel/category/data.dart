import 'package:flutter/material.dart';
import 'package:seafood_crossing/travel/category/enum.dart';

const Map<DestinationCategory, String> destinationDestinationTitle = {
  DestinationCategory.TURNIP_BUY: 'turnip-buy-title',
  DestinationCategory.TURNIP_SELL: 'turnip-sell-title',
  DestinationCategory.TOUR: 'tour-title',
  DestinationCategory.MABEL: 'mabel-title',
  DestinationCategory.KICKS: 'kicks-title',
  DestinationCategory.SAHARAH: 'saharah-title',
  DestinationCategory.METEOR: 'meteor-title',
  DestinationCategory.OTHER: 'other-title',
};

const Map<DestinationCategory, String> destinationDestinationSubtitle = {
  DestinationCategory.TURNIP_BUY: 'turnip-buy-subtitle',
  DestinationCategory.TURNIP_SELL: 'turnip-sell-subtitle',
  DestinationCategory.TOUR: 'tour-subtitle',
  DestinationCategory.MABEL: 'mabel-subtitle',
  DestinationCategory.KICKS: 'kicks-subtitle',
  DestinationCategory.SAHARAH: 'saharah-subtitle',
  DestinationCategory.METEOR: 'meteor-subtitle',
  DestinationCategory.OTHER: 'other-subtitle',
};

const Map<DestinationCategory, String> destinationDestinationReceiverSubtitle =
    {
  DestinationCategory.TURNIP_BUY: 'turnip-buy-receiver-subtitle',
  DestinationCategory.TURNIP_SELL: 'turnip-sell-receiver-subtitle',
  DestinationCategory.TOUR: 'tour-receiver-subtitle',
  DestinationCategory.MABEL: 'mabel-receiver-subtitle',
  DestinationCategory.KICKS: 'kicks-receiver-subtitle',
  DestinationCategory.SAHARAH: 'saharah-receiver-subtitle',
  DestinationCategory.METEOR: 'meteor-receiver-subtitle',
  DestinationCategory.OTHER: 'other-receiver-subtitle',
};

const Map<DestinationCategory, IconData> destinationDestinationIcon = {
  DestinationCategory.TURNIP_BUY: Icons.attach_money,
  DestinationCategory.TURNIP_SELL: Icons.money_off,
  DestinationCategory.TOUR: Icons.airplanemode_active,
  DestinationCategory.MABEL: Icons.shopping_cart,
  DestinationCategory.KICKS: Icons.shopping_basket,
  DestinationCategory.SAHARAH: Icons.image_aspect_ratio,
  DestinationCategory.METEOR: Icons.stars,
  DestinationCategory.OTHER: Icons.more,
};
