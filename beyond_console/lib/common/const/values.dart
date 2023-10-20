import 'package:intl/intl.dart';

class Values {
  /// Digital product home widget id
  static const headerInformationId = 'DP-HI01';
  static const headerMenuId = 'DP-HM01';
  static const categoryMenuId = 'DP-CM01';
  static const tagihanTersediaId = 'DP-TT01';
  static const multipleBannerId = 'DP-MB01';

  ///
  static const whatsapp = 'whatsapp';
  static const evermos = 'evermos';
  static const all = 'all';
  static const active = 'active';
  static const catalog = 'catalog';
  static const digital = 'digital';
  static const discount = 'discount';
  static const cashback = 'cashback';
  static const insurance = 'insurance';
  static const mobile = 'mobile';
  static const idLocale = 'id';
  static const idCurrency = 'Rp';
  static const squareMeterSymbol = 'm²';
  static const squareMeterSymbolAlternative = 'm2';
  static const cubicMeterSymbol = 'm³';
  @Deprecated('Use new newTimeFormat instead')
  static const timeFormat = 'HH:mm:ss';
  static final newTimeFormat = DateFormat('HH:mm');
  static final timeFormatCompact = DateFormat('HH:mm');
  static const cubicMeterSymbolAlternative = 'm3';
  static const durationShort = Duration(seconds: 3);
  static final idCurrencyFormat = NumberFormat('Rp#,##0', 'id_ID');
  static final thousandFormat = NumberFormat('#,##0', 'id_ID');
  static final dateFormat = DateFormat('dd MMM yyyy');
  static final longDateFormat = DateFormat('dd-MMM-yyyy HH:mm:ss');
  static final currentDate = DateTime.now();
  static const customAmountProductCode = 'DONATE-SDK-OTHER';
  static const customAmountCreditTopupProductCode = 'CREDIT-TOPUP-OTHER';
  static final onlyDigitalCharAllowed = RegExp(r'[^\d]');
  static final denyNonIndonesiaPhoneNumberPrefix = RegExp(r'^0+');
  static final inputFormatters = RegExp("[0-9]");

  /// TextFormField name (for remote config)
  static const customerNumber = 'customerNumber';

  /// Topup credit
  static const otherNominalDescription = 'Top Up Saldo Deposit Nominal Lainnya';
  static const topUpGroup = 'topup';
  static const topUpGroupName = 'Top Up';
  static const ewallet = 'ewallet-topup';
  static const credit = 'credit-topup';
  static const internetCableTv = 'internet-tvpostpaid';
  static const water = 'water';
  static const healthInsurance = 'bpjs-kesehatan';
  static const sedekahHarian = 'donation';

  static const bpjsCallCenter = '1500400';
  static const plnCallCenter = '123';
  static const indonesiaPhoneNumberPrefix = '+62';
  static const stringParamPlaceholder = '?';

  // Homepage
  static const transactionListConfigKey = 'transaction_history';
  static const priceGuideConfigKey = 'price_guide';
  static const String digitalProductGuidePath =
      'eldp/10000000477/cara-jual-dan-harga-produk-digital';

  // Transaction
  static const tab = 'tab';
  static const send = '/send';
  static const text = 'text';

  /// Tracker static
  static const digiproHomepageScreenRef = 'homepage-digital';
  static const digiproTransactionScreenRef = 'transaction-digital';
  static const digiproTransactionRepeatOrderSectionRef =
      'transaction-digital-repeat-order';

  /// Promotional banner
  static String tagihanTersediaTileImpression(int position) =>
      'tagihan_tersedia_tile_digipro_$position';

  /// Promotional banner
  static String promotionalBannerImpression(int position) =>
      'promotional_banner_digipro_$position';
}
