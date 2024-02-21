import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ms', 'zh_Hans', 'hi'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? msText = '',
    String? zh_HansText = '',
    String? hiText = '',
  }) =>
      [enText, msText, zh_HansText, hiText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Sale
  {
    'kfjs2rj1': {
      'en': 'Takeaway ',
      'hi': 'ले लेना',
      'ms': 'Bawa pulang',
      'zh_Hans': '带走',
    },
    'p356muyj': {
      'en': 'within ',
      'hi': 'अंदर',
      'ms': 'dalam',
      'zh_Hans': '之内',
    },
    'snofuvel': {
      'en': ' km',
      'hi': 'किमी',
      'ms': 'km',
      'zh_Hans': '公里',
    },
    '9nkedcoy': {
      'en': 'Meals',
      'hi': 'भोजन',
      'ms': 'Makanan',
      'zh_Hans': '膳食',
    },
    's18c5nk0': {
      'en': 'Groceries',
      'hi': 'किराने का सामान',
      'ms': 'Barangan runcit',
      'zh_Hans': '杂货',
    },
    'jv42adsw': {
      'en': 'Bread & Pastries',
      'hi': 'ब्रेड और पेस्ट्री',
      'ms': 'Roti & Pastri',
      'zh_Hans': '面包和糕点',
    },
    'u9bxubau': {
      'en': 'Drinks',
      'hi': 'पेय',
      'ms': 'minuman',
      'zh_Hans': '饮料',
    },
    'l5s0a8t7': {
      'en': 'Pick up ',
      'hi': 'उठाना',
      'ms': 'Angkat',
      'zh_Hans': '捡起',
    },
    'qcsfpmjy': {
      'en': ' - ',
      'hi': '-',
      'ms': '-',
      'zh_Hans': '-',
    },
    'knz0ubmn': {
      'en': 'Pick up ',
      'hi': 'उठाना',
      'ms': 'Angkat',
      'zh_Hans': '捡起',
    },
    '1c7tqhx9': {
      'en': ' - ',
      'hi': '-',
      'ms': '-',
      'zh_Hans': '-',
    },
    'drbgj8ss': {
      'en': 'Browse',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
  },
  // Profiel
  {
    'om1lggaq': {
      'en': 'YOUR IMPACT',
      'hi': '',
      'ms': 'IMPAK ANDA',
      'zh_Hans': '',
    },
    '5p1xmdo1': {
      'en': ' RM',
      'hi': 'पीएचपी',
      'ms': 'PHP',
      'zh_Hans': 'PHP',
    },
    '5udopg9s': {
      'en': 'saved',
      'hi': 'बचाया',
      'ms': 'disimpan',
      'zh_Hans': '已保存',
    },
    '593b5cm5': {
      'en': ' kg',
      'hi': 'किलोग्राम',
      'ms': 'kg',
      'zh_Hans': '公斤',
    },
    '20gzjs5b': {
      'en': 'food saved',
      'hi': 'खाना बच गया',
      'ms': 'makanan disimpan',
      'zh_Hans': '节省食物',
    },
    'pvfgtb33': {
      'en': ' kg',
      'hi': 'किलोग्राम',
      'ms': 'kg',
      'zh_Hans': '公斤',
    },
    'sjma6d07': {
      'en': 'CO2e saved',
      'hi': 'CO2e बचा लिया गया',
      'ms': 'CO2e disimpan',
      'zh_Hans': '节省二氧化碳当量',
    },
    'l6z2fg0i': {
      'en': 'Orders',
      'hi': 'खाता विवरण',
      'ms': 'Butiran Akaun',
      'zh_Hans': '帐户详细资料',
    },
    '91c3vs51': {
      'en': 'Recommend a store',
      'hi': 'खाता विवरण',
      'ms': 'Butiran Akaun',
      'zh_Hans': '帐户详细资料',
    },
    'g31pwpjl': {
      'en': 'Settings',
      'hi': 'खाता विवरण',
      'ms': 'Butiran Akaun',
      'zh_Hans': '帐户详细资料',
    },
    'ywp19594': {
      'en': 'Go to MyStore',
      'hi': 'खाता विवरण',
      'ms': 'Butiran Akaun',
      'zh_Hans': '帐户详细资料',
    },
    'annok6we': {
      'en': 'Dashboard',
      'hi': 'खाता विवरण',
      'ms': 'Butiran Akaun',
      'zh_Hans': '帐户详细资料',
    },
    'vujn1g3j': {
      'en': 'Profiel',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
  },
  // Map
  {
    '8hwexvzf': {
      'en': 'Meals',
      'hi': 'भोजन',
      'ms': 'Makanan',
      'zh_Hans': '膳食',
    },
    '9ir1vry2': {
      'en': 'Bread & Pastries',
      'hi': 'ब्रेड और पेस्ट्री',
      'ms': 'Roti & Pastri',
      'zh_Hans': '面包和糕点',
    },
    '4ahyxfqt': {
      'en': 'Groceries',
      'hi': 'किराने का सामान',
      'ms': 'Barangan runcit',
      'zh_Hans': '杂货',
    },
    'bcji2lfq': {
      'en': 'Other',
      'hi': 'पेय',
      'ms': 'minuman',
      'zh_Hans': '饮料',
    },
  },
  // Login
  {
    'paeaeh47': {
      'en': 'Welcome to ',
      'hi': 'ऐप में भुगतान करें और उठाएं',
      'ms': 'Bayar dalam apl & ambil',
      'zh_Hans': '在应用程序中付款并领取',
    },
    '2o4q4xlv': {
      'en': 'StopBy',
      'hi': 'ऐप में भुगतान करें और उठाएं',
      'ms': 'Bayar dalam apl & ambil',
      'zh_Hans': '在应用程序中付款并领取',
    },
    'z1xbxps3': {
      'en': 'A simple way to do good for the environment, and your wallet!',
      'hi': 'ऐप में भुगतान करें और अपना मोबाइल ऑर्डर दिखाकर अपना भोजन ले जाएं।',
      'ms':
          'Bayar dalam apl dan ambil makanan anda untuk dibawa pulang dengan menunjukkan pesanan mudah alih anda.',
      'zh_Hans': '在应用程序中付款，然后出示您的手机订单即可领取外卖食品。',
    },
    'kdb4tmh5': {
      'en': 'Save food at a discount',
      'hi': 'ऐप में भुगतान करें और उठाएं',
      'ms': 'Bayar dalam apl & ambil',
      'zh_Hans': '在应用程序中付款并领取',
    },
    't8ogxyyl': {
      'en': 'Order directly in the app and pick up the food as take away.',
      'hi': 'ऐप में भुगतान करें और अपना मोबाइल ऑर्डर दिखाकर अपना भोजन ले जाएं।',
      'ms':
          'Bayar dalam apl dan ambil makanan anda untuk dibawa pulang dengan menunjukkan pesanan mudah alih anda.',
      'zh_Hans': '在应用程序中付款，然后出示您的手机订单即可领取外卖食品。',
    },
    '2iu7i9gn': {
      'en': 'Sign with Apple',
      'hi': 'एप्पल के साथ साइन इन करें',
      'ms': 'Tandatangan dengan Apple',
      'zh_Hans': '与苹果签约',
    },
    '6bnq2c2j': {
      'en': 'Sign with Google',
      'hi': 'एप्पल के साथ साइन इन करें',
      'ms': 'Tandatangan dengan Apple',
      'zh_Hans': '与苹果签约',
    },
    'ndhdxjq2': {
      'en': 'Or continue with',
      'hi': 'ऐप में भुगतान करें और अपना मोबाइल ऑर्डर दिखाकर अपना भोजन ले जाएं।',
      'ms':
          'Bayar dalam apl dan ambil makanan anda untuk dibawa pulang dengan menunjukkan pesanan mudah alih anda.',
      'zh_Hans': '在应用程序中付款，然后出示您的手机订单即可领取外卖食品。',
    },
    '089cpxy7': {
      'en': 'Home',
      'hi': 'घर',
      'ms': 'Rumah',
      'zh_Hans': '家',
    },
  },
  // Login_Country
  {
    'wvug2ezt': {
      'en': 'Let\'s get started',
      'hi': '',
      'ms': 'IMPAK ANDA',
      'zh_Hans': '',
    },
    'rpkld5si': {
      'en': 'Username',
      'hi': 'उपयोगकर्ता नाम',
      'ms': 'Nama pengguna',
      'zh_Hans': '用户名',
    },
    'he3vr91m': {
      'en': '',
      'hi': '',
      'ms': 'E-mel',
      'zh_Hans': '',
    },
    'nq0zveq6': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '9ujlikme': {
      'en': 'Country',
      'hi': 'देश',
      'ms': 'Negara',
      'zh_Hans': '国家',
    },
    'fxn2w140': {
      'en': 'Malaysia',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'ixmwbb68': {
      'en': 'Malaysia',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '447z0bxi': {
      'en': 'Select Country',
      'hi': 'देश चुनें',
      'ms': 'Pilih negara',
      'zh_Hans': '选择国家',
    },
    'zdyrvrii': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
      'ms': 'Cari item...',
      'zh_Hans': '搜索一个项目...',
    },
    'sjqpqaxx': {
      'en': 'Language',
      'hi': 'भाषा',
      'ms': 'Bahasa',
      'zh_Hans': '语言',
    },
    'rwundztx': {
      'en': 'Continue',
      'hi': 'जारी रखना',
      'ms': 'teruskan',
      'zh_Hans': '继续',
    },
    'qhgfpdiq': {
      'en': 'Home',
      'hi': 'घर',
      'ms': 'Rumah',
      'zh_Hans': '家',
    },
  },
  // Support
  {
    'tbz5qoqg': {
      'en': 'Got a question or an issue?',
      'hi': 'कोई प्रश्न या मुद्दा है?',
      'ms': 'Ada soalan atau isu?',
      'zh_Hans': '有疑问或问题吗？',
    },
    'aa0dax0o': {
      'en':
          'If you are having an issue or a question, fill out the message tab below to contact us. We will reply as soon as possible.',
      'hi':
          'यदि आपके पास कोई समस्या या प्रश्न है, तो हमसे संपर्क करने के लिए नीचे दिए गए संदेश टैब को भरें। हम यथासंभव शीघ्र ही उत्तर देंगे।',
      'ms':
          'Jika anda menghadapi masalah atau soalan, isi tab mesej di bawah untuk menghubungi kami. Kami akan membalas secepat mungkin.',
      'zh_Hans': '如果您有问题或疑问，请填写下面的消息选项卡与我们联系。我们会尽快回复。',
    },
    '3t0945fm': {
      'en': 'Email address',
      'hi': 'मेल पता',
      'ms': 'Alamat emel',
      'zh_Hans': '电子邮件地址',
    },
    'ugh5rf56': {
      'en': '',
      'hi': '',
      'ms': 'E-mel',
      'zh_Hans': '',
    },
    'm64g3u5i': {
      'en': 'Add email address',
      'hi': 'ईमेल पता जोड़ें',
      'ms': 'Tambah alamat e-mel',
      'zh_Hans': '添加电子邮件地址',
    },
    'xv1kr9mh': {
      'en': 'Message',
      'hi': 'संदेश',
      'ms': 'Mesej',
      'zh_Hans': '信息',
    },
    'o6dd8t1c': {
      'en': 'Enter your message here',
      'hi': 'अपना संदेश यहां दर्ज करें',
      'ms': 'Masukkan mesej anda di sini',
      'zh_Hans': '在此输入您的留言',
    },
    '5m6nm15j': {
      'en': 'Send',
      'hi': 'भेजना',
      'ms': 'Hantar',
      'zh_Hans': '发送',
    },
    '5wit02dt': {
      'en': 'Contact us',
      'hi': '',
      'ms': 'IMPAK ANDA',
      'zh_Hans': '',
    },
    '4rxwutbc': {
      'en': '',
      'hi': '',
      'ms': 'Rumah',
      'zh_Hans': '',
    },
  },
  // Legal
  {
    'vab881ts': {
      'en': 'Privacy Policy',
      'hi': 'गोपनीयता नीति',
      'ms': 'Dasar Privasi',
      'zh_Hans': '隐私政策',
    },
    'bjiinlba': {
      'en': 'Terms and Conditions',
      'hi': 'नियम और शर्तें',
      'ms': 'Terma dan syarat',
      'zh_Hans': '条款和条件',
    },
    'u9azm0wl': {
      'en': 'Legal',
      'hi': '',
      'ms': 'IMPAK ANDA',
      'zh_Hans': '',
    },
    'z9qh9vly': {
      'en': 'Home',
      'hi': 'घर',
      'ms': 'Rumah',
      'zh_Hans': '家',
    },
  },
  // Settings
  {
    'g9ldfgrc': {
      'en': 'Account Details',
      'hi': 'खाता विवरण',
      'ms': 'Butiran Akaun',
      'zh_Hans': '帐户详细资料',
    },
    'li9s4zec': {
      'en': 'Help',
      'hi': 'मदद',
      'ms': 'Tolong',
      'zh_Hans': '帮助',
    },
    '72qbqgfa': {
      'en': 'Log Out',
      'hi': 'लॉग आउट',
      'ms': 'Log keluar',
      'zh_Hans': '登出',
    },
    'qr57xy29': {
      'en': 'Settings',
      'hi': '',
      'ms': 'IMPAK ANDA',
      'zh_Hans': '',
    },
    'd5dl3ct0': {
      'en': '',
      'hi': '',
      'ms': 'Rumah',
      'zh_Hans': '',
    },
  },
  // Account_details
  {
    'qdpp6mlw': {
      'en': 'Email',
      'hi': 'ईमेल',
      'ms': 'E-mel',
      'zh_Hans': '电子邮件',
    },
    '37cz7y2w': {
      'en': 'Username',
      'hi': 'उपयोगकर्ता नाम',
      'ms': 'Nama pengguna',
      'zh_Hans': '用户名',
    },
    '40sdd1v1': {
      'en': '',
      'hi': '',
      'ms': 'E-mel',
      'zh_Hans': '',
    },
    'w7zwzsqr': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '51z8spxy': {
      'en': 'Country',
      'hi': 'भाषा',
      'ms': 'Bahasa',
      'zh_Hans': '语言',
    },
    'qrxzw250': {
      'en': 'Singapore',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'cn5f5cge': {
      'en': 'Malaysia',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '67xi66qa': {
      'en': 'Select Country',
      'hi': 'देश चुनें',
      'ms': 'Pilih negara',
      'zh_Hans': '选择国家',
    },
    '0q2pr6l8': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
      'ms': 'Cari item...',
      'zh_Hans': '搜索一个项目...',
    },
    'ida02qet': {
      'en': 'Language',
      'hi': 'भाषा',
      'ms': 'Bahasa',
      'zh_Hans': '语言',
    },
    '29dm3o2f': {
      'en': 'DELETE ACCOUNT',
      'hi': 'खाता हटा दो',
      'ms': 'PADAM AKAUN',
      'zh_Hans': '删除帐户',
    },
    'rkab2cp4': {
      'en': 'Account Details',
      'hi': '',
      'ms': 'IMPAK ANDA',
      'zh_Hans': '',
    },
    'kyxt5ukl': {
      'en': 'Home',
      'hi': 'घर',
      'ms': 'Rumah',
      'zh_Hans': '家',
    },
  },
  // Orders
  {
    'boczh06k': {
      'en': 'Collect today at ',
      'hi': 'आज ही एकत्र करें',
      'ms': 'Kumpul hari ini di',
      'zh_Hans': '今天收集于',
    },
    'tmkzbna9': {
      'en': ' - ',
      'hi': '-',
      'ms': '-',
      'zh_Hans': '-',
    },
    'gqlke87o': {
      'en': 'Order Number: ',
      'hi': 'क्रम संख्या:',
      'ms': 'Nombor Pesanan:',
      'zh_Hans': '订单号：',
    },
    'xa95ok5h': {
      'en': '#',
      'hi': '#',
      'ms': '#',
      'zh_Hans': '#',
    },
    '9so52ts4': {
      'en': 'More info',
      'hi': 'और जानकारी',
      'ms': 'Maklumat lanjut',
      'zh_Hans': '更多信息',
    },
    'yngtkx1q': {
      'en': 'Orders',
      'hi': '',
      'ms': 'IMPAK ANDA',
      'zh_Hans': '',
    },
    'e3i25s40': {
      'en': 'Home',
      'hi': 'घर',
      'ms': 'Rumah',
      'zh_Hans': '家',
    },
  },
  // order_collected
  {
    'qmu4m33l': {
      'en': 'THANK YOU !',
      'hi': 'धन्यवाद !',
      'ms': 'TERIMA KASIH !',
      'zh_Hans': '谢谢 ！',
    },
    'l031b4y5': {
      'en': 'YOU JUST SAVED A MEAL FROM BEING WASTED',
      'hi': 'आपने अभी-अभी एक भोजन बर्बाद होने से बचाया है',
      'ms': 'ANDA BARU MENYIMPAN MAKAN DARIPADA DIBAZIR',
      'zh_Hans': '您刚刚避免了浪费一顿饭',
    },
    '165anqmo': {
      'en': 'Celebrate with your friends and start saving together.\n\n#StopBy',
      'hi':
          'अपने दोस्तों के साथ जश्न मनाएं और साथ मिलकर बचत करना शुरू करें।\n\n#लुंगटी',
      'ms':
          'Raikan dengan rakan anda dan mulakan menabung bersama-sama.\n\n#lungti',
      'zh_Hans': '与您的朋友一起庆祝并开始一起储蓄。\n\n#隆蒂',
    },
    'l7rsx96u': {
      'en': 'Home',
      'hi': 'घर',
      'ms': 'Rumah',
      'zh_Hans': '家',
    },
  },
  // favourite
  {
    'd0tbi4ds': {
      'en': 'Favourites',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'asrydr73': {
      'en': 'Collect today at ',
      'hi': 'आज ही एकत्र करें',
      'ms': 'Kumpul hari ini di',
      'zh_Hans': '今天收集于',
    },
    '60z53iw0': {
      'en': ' - ',
      'hi': '-',
      'ms': '-',
      'zh_Hans': '-',
    },
    'vkg6d17x': {
      'en': 'Sold out',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'lfr4dzwe': {
      'en': 'Favourites',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
  },
  // Recomend
  {
    '39mvlt7s': {
      'en': 'Do you know a store that should join StopBy',
      'hi': 'क्या आप कोई ऐसा स्टोर जानते हैं जिसे लुंगटी से जुड़ना चाहिए?',
      'ms': 'Adakah anda tahu kedai yang sepatutnya menyertai Lungti',
      'zh_Hans': '你知道哪家店应该加入Lungti吗',
    },
    'l4zgsta2': {
      'en':
          'We love hearing about stores tha want to join the fight against food waste! Feel free to tell the store about StopBy and send us a tip with information about the store.',
      'hi':
          'हमें उन दुकानों के बारे में सुनना अच्छा लगता है जो भोजन की बर्बादी के खिलाफ लड़ाई में शामिल होना चाहते हैं! बेझिझक स्टोर को लुंगटी के बारे में बताएं और स्टोर के बारे में जानकारी के साथ हमें टिप भेजें।',
      'ms':
          'Kami suka mendengar tentang kedai yang ingin menyertai perjuangan menentang sisa makanan! Jangan ragu untuk memberitahu kedai tentang Lungti dan hantarkan petua dengan maklumat tentang kedai itu.',
      'zh_Hans': '我们很高兴听到商店想要加入反对食物浪费的行列！请随时向商店介绍 Lungti，并向我们发送包含商店信息的提示。',
    },
    'b03welyj': {
      'en': 'Store name',
      'hi': 'स्टोर नाम',
      'ms': 'Nama kedai',
      'zh_Hans': '店铺名称',
    },
    'pvfbiwv5': {
      'en': '',
      'hi': '',
      'ms': 'E-mel',
      'zh_Hans': '',
    },
    'f56aavr1': {
      'en': 'Add store name',
      'hi': 'स्टोर का नाम जोड़ें',
      'ms': 'Tambahkan nama kedai',
      'zh_Hans': '添加店铺名称',
    },
    'vc1paerv': {
      'en': 'Store email address',
      'hi': 'स्टोर ईमेल पता',
      'ms': 'Simpan alamat e-mel',
      'zh_Hans': '存储电子邮件地址',
    },
    'ffsnqynz': {
      'en': '',
      'hi': '',
      'ms': 'E-mel',
      'zh_Hans': '',
    },
    '12o92tv5': {
      'en': 'Add store email address',
      'hi': 'स्टोर ईमेल पता जोड़ें',
      'ms': 'Tambahkan alamat e-mel kedai',
      'zh_Hans': '添加商店电子邮件地址',
    },
    'v161vl1b': {
      'en': 'Store phone number',
      'hi': 'फ़ोन नंबर संग्रहित करें',
      'ms': 'Simpan nombor telefon',
      'zh_Hans': '储存电话号码',
    },
    'kpkvcl8d': {
      'en': '',
      'hi': '',
      'ms': 'E-mel',
      'zh_Hans': '',
    },
    'j8l8490i': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'j84wp6ky': {
      'en': '60',
      'hi': '60',
      'ms': '60',
      'zh_Hans': '60',
    },
    '2hgfsrrz': {
      'en': '',
      'hi': '',
      'ms': 'E-mel',
      'zh_Hans': '',
    },
    '2yi4iux2': {
      'en': 'Add store phone number',
      'hi': 'स्टोर फ़ोन नंबर जोड़ें',
      'ms': 'Tambahkan nombor telefon kedai',
      'zh_Hans': '添加商店电话号码',
    },
    't0nysk8h': {
      'en': 'Store country',
      'hi': 'भण्डार देश',
      'ms': 'Negara kedai',
      'zh_Hans': '商店国家',
    },
    '8hodew7u': {
      'en': 'Malaysia',
      'hi': 'मलेशिया',
      'ms': 'Malaysia',
      'zh_Hans': '马来西亚',
    },
    'fl97qcfn': {
      'en': '',
      'hi': '',
      'ms': 'Pilih negara',
      'zh_Hans': '',
    },
    'yjr2hsjs': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
      'ms': 'Cari item...',
      'zh_Hans': '搜索一个项目...',
    },
    'gyk0yhnj': {
      'en': 'Submit',
      'hi': 'जमा करना',
      'ms': 'Hantar',
      'zh_Hans': '提交',
    },
    'k40w837w': {
      'en': 'Recommend a store',
      'hi': '',
      'ms': 'IMPAK ANDA',
      'zh_Hans': '',
    },
    '8k59r8qz': {
      'en': 'Home',
      'hi': 'घर',
      'ms': 'Rumah',
      'zh_Hans': '家',
    },
  },
  // home
  {
    'gpiizk8i': {
      'en': 'Save \nfood with',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'ge4am33s': {
      'en': '\nStopBy',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '6vliuvk2': {
      'en': ' today!',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '32ti31n9': {
      'en': 'New Mystery Bags',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'iq1lr75b': {
      'en': 'More Coming',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'nx2u64ni': {
      'en': 'Baked Goods',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'vtydhbzn': {
      'en': 'More Coming ',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'i8iew0r9': {
      'en': 'Groceries',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '5c14flzd': {
      'en': 'More Coming',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '8nzfor9h': {
      'en': 'Discover',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
  },
  // store_info
  {
    '3fmq05n1': {
      'en': ' m',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'anrs0mhh': {
      'en': 'Pick up ',
      'hi': 'उठाना',
      'ms': 'Angkat',
      'zh_Hans': '捡起',
    },
    'ppq0vl01': {
      'en': ' - ',
      'hi': '-',
      'ms': '-',
      'zh_Hans': '-',
    },
    'rzr1ywt9': {
      'en': 'What you could get',
      'hi': 'बिक्री',
      'ms': 'Jualan',
      'zh_Hans': '销售',
    },
    'zs3tc3fy': {
      'en': 'RM ',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '9msq9cb9': {
      'en': 'RM ',
      'hi': 'एस\$',
      'ms': 'S\$',
      'zh_Hans': '新元',
    },
    'uo82h16j': {
      'en': 'What you need to know',
      'hi': 'बिक्री',
      'ms': 'Jualan',
      'zh_Hans': '销售',
    },
    'itfpsy64': {
      'en':
          'The store will provide packaging for your food, but we encourage you to bring your own bag to carry it home in.',
      'hi': 'बिक्री',
      'ms': 'Jualan',
      'zh_Hans': '销售',
    },
    '85zkb876': {
      'en': 'SOLD OUT',
      'hi': 'आपकी गाड़ी',
      'ms': 'Troli anda',
      'zh_Hans': '你的购物车',
    },
    'f50zbs39': {
      'en': 'Reserve',
      'hi': 'आपकी गाड़ी',
      'ms': 'Troli anda',
      'zh_Hans': '你的购物车',
    },
    'g63i804d': {
      'en': 'Home',
      'hi': 'घर',
      'ms': 'Rumah',
      'zh_Hans': '家',
    },
  },
  // homeBizz
  {
    '4zraegka': {
      'en': 'Welcome to StopBy Bizz',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '4ol0v9j0': {
      'en': 'Get started',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'qy3hj57a': {
      'en': 'START\nNOW',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '6ykcc9ac': {
      'en': 'ADD MYSTERY BAG',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'j8x27u9j': {
      'en': 'Your Mystery Bag',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'exmxcaj2': {
      'en': 'ONLINE',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    't8wclsnz': {
      'en': 'OPEN ORDERS',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'i6cwzmf4': {
      'en': 'Name',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'u8rw1zzy': {
      'en': 'To Pay',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'ckfj5zcn': {
      'en': 'Order Nr',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'pyt3nod7': {
      'en': 'RM ',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'sn4yuei5': {
      'en': '002',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '4hjl9hdu': {
      'en': 'Stock',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '668uxj4h': {
      'en': 'GO LIVE',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'eczbyycv': {
      'en': 'OUT OF STOCK',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'r3z4rw9h': {
      'en': 'Name',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '7lzpxkl5': {
      'en': 'Minimum value per Mystery Bag',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'u9j69g54': {
      'en': ' RM',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '4ki9dtwo': {
      'en': 'Price in app',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'eilms5tf': {
      'en': ' RM',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'd25i0wa6': {
      'en': 'Pick-up time',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'arf8z50b': {
      'en': ' - ',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'nrjtws3o': {
      'en': 'Need more help?',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '4evp6gr4': {
      'en': 'Visit our ',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'b13x95q7': {
      'en': 'Help Center ',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '6yxlgv81': {
      'en': 'or contact us directly at ',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'flim21v0': {
      'en': '+60138181014',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '84ey0hb6': {
      'en': 'StopBy',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '014izm3l': {
      'en': 'STORE',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'fiyhygxj': {
      'en': 'Dashboard',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'sbrg7sv1': {
      'en': 'SUPPORT',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'jqzjb4p3': {
      'en': 'Help Center',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '0xh8e1uk': {
      'en': 'Go to consumer app',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'zcqtmrzt': {
      'en': 'Log out',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'w928a5b6': {
      'en': 'Home',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
  },
  // earnings
  {
    '53pvg1ny': {
      'en': 'Earnings',
      'hi': '',
      'ms': 'IMPAK ANDA',
      'zh_Hans': '',
    },
    'icfjt2r2': {
      'en': 'Total Sales',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'wg158rp1': {
      'en': 'RM ',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'f7lquqwo': {
      'en': 'Next Payout',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'lzxjvuur': {
      'en': 'RM ',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'ob9x3lkn': {
      'en': 'Minimum Payout',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '8yp2qhce': {
      'en': 'RM 100 - Transfer will be made on the 1ste of the mounth',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'w41cd66x': {
      'en': 'Payment Method',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'lnofm9d7': {
      'en': 'Payout History',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '5kpw6uji': {
      'en': 'Home',
      'hi': 'घर',
      'ms': 'Rumah',
      'zh_Hans': '家',
    },
  },
  // Register_store
  {
    'bm8i11bj': {
      'en': 'Sign up your business',
      'hi': '',
      'ms': 'IMPAK ANDA',
      'zh_Hans': '',
    },
    '7ru0q8ht': {
      'en': 'Sign Up',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'ligbdfbj': {
      'en': 'Home',
      'hi': 'घर',
      'ms': 'Rumah',
      'zh_Hans': '家',
    },
  },
  // addBagBizz
  {
    'r4aojoos': {
      'en': 'Mystery Bag',
      'hi': '',
      'ms': 'IMPAK ANDA',
      'zh_Hans': '',
    },
    '84sqd57r': {
      'en': 'GO LIVE',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '4o87xkqc': {
      'en': 'Home',
      'hi': 'घर',
      'ms': 'Rumah',
      'zh_Hans': '家',
    },
  },
  // dash_home
  {
    '8mvzc782': {
      'en': 'Stores',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'v3p6pb8l': {
      'en': 'Search',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '8sngtmp4': {
      'en': 'Feedback',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'ujniykay': {
      'en': 'Home',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
  },
  // dash_store
  {
    'kn5rpiv3': {
      'en': 'Store Info',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'q2u1ck3v': {
      'en': 'Payout Info Verified:',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '45ibpx5t': {
      'en': 'Payout Country:',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '22gwvyel': {
      'en': 'Malaysia',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'gyvvy8n0': {
      'en': 'Singapore',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'y98e6hbp': {
      'en': 'Malaysia',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'ank22wb3': {
      'en': 'Payout Last Date:',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '3q0e3515': {
      'en': '1',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'dbjvacha': {
      'en': '2',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '8otw1sjg': {
      'en': '3',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'ewmyejrr': {
      'en': '4',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '8thazxw0': {
      'en': 'new',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '08phw3v9': {
      'en': 'new',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'agx5dr6n': {
      'en': 'Payout Update Date:',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'vc8cd0ey': {
      'en': '1',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'pwtyaquv': {
      'en': '2',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'cqii3uqg': {
      'en': '3',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '56irn78m': {
      'en': '4',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'p4sor8jb': {
      'en': '1',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'x9eunvnx': {
      'en': 'Verification:',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'bg72vepw': {
      'en': 'BlackList:',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'vymw8n1i': {
      'en': 'Select Location',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'fyak1dhk': {
      'en': 'Verification',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'mhzifhwk': {
      'en': 'Verified - ',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'h6k8lunn': {
      'en': 'Store',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'i4us29lb': {
      'en': 'Name - ',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '88gf23ve': {
      'en': 'Email - ',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'x7q32k4f': {
      'en': 'Phone - ',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '0g8pld4j': {
      'en': 'Country - ',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '81fjpq42': {
      'en': 'Adresse - ',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'amabcp49': {
      'en': 'LatLng - ',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '2rgarrdp': {
      'en': 'Update Location',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'cekpyqfv': {
      'en': 'Update',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'kjvpt6w2': {
      'en': 'BLACKLISTED -',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'd0tq0uvw': {
      'en': 'Delete',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'h8m1s0hx': {
      'en': 'Payout',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'mvbscn8s': {
      'en': 'Home',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
  },
  // completBizzProfiel
  {
    'o18bi7qj': {
      'en': 'Complete Profiel',
      'hi': '',
      'ms': 'IMPAK ANDA',
      'zh_Hans': '',
    },
    '5ytx5ysd': {
      'en': 'Next',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'v390t4n3': {
      'en': 'Home',
      'hi': 'घर',
      'ms': 'Rumah',
      'zh_Hans': '家',
    },
  },
  // helpCenter
  {
    '4xw6eq4g': {
      'en': 'Help Center',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'dmj08b1j': {
      'en':
          'Here you can find answers to most of the questions you might have about how to use MyStore and how StopBy works.',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '3ata9zy9': {
      'en': 'Need more help?',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    's1x1fmfe': {
      'en': 'Contact us directly at ',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'y56enpnr': {
      'en': '+60138181014',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'ftwp7vuu': {
      'en': 'StopBy',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '933nwgjd': {
      'en': 'STORE',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'm6hso3wm': {
      'en': 'Dashboard',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'jtghnrji': {
      'en': 'SUPPORT',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '8pr4bq54': {
      'en': 'Help Center',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'bt959jci': {
      'en': 'Go to consumer app',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '93mmbs1r': {
      'en': 'Log out',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'wokn35xg': {
      'en': 'Home',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
  },
  // dash_feedback
  {
    '0f16l9m6': {
      'en': 'Feedback',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'wfutbdbh': {
      'en': 'Responded',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'yw7bvapy': {
      'en': 'Customer',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'hn95vjs5': {
      'en': 'Responded - ',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'c8kr753w': {
      'en': 'Email - ',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '8a6198tt': {
      'en': 'Subject - ',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'hm8bloth': {
      'en': 'Message - ',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '8d0rdg20': {
      'en': 'Email - ',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'p1wgtr6g': {
      'en': 'Subject - ',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'e2og3hrq': {
      'en': 'Store Name - ',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'w08f3dsz': {
      'en': 'Store Country - ',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'u737m34a': {
      'en': 'Store Number - ',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'uymq6u3t': {
      'en': 'Delete',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'ih0h85jc': {
      'en': 'Bizz',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '3xxy12ws': {
      'en': 'Responded - ',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'i4y9ks3b': {
      'en': 'Email - ',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'a4mamyil': {
      'en': 'Message - ',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '8z83tijg': {
      'en': 'Refund',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '6bixy4nu': {
      'en': 'Home',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
  },
  // Policy_bottom
  {
    'kh1swl77': {
      'en': 'I accept the ',
      'hi': 'मुझे स्वीकार है',
      'ms': 'Saya menerima',
      'zh_Hans': '我接受',
    },
    '635dv1bb': {
      'en': 'Terms & Conditions.',
      'hi': 'नियम एवं शर्तें।',
      'ms': 'Terma & Syarat.',
      'zh_Hans': '条款和条件。',
    },
    '1hgkml4l': {
      'en': 'I accept the ',
      'hi': 'मुझे स्वीकार है',
      'ms': 'Saya menerima',
      'zh_Hans': '我接受',
    },
    '7h6c7owh': {
      'en': 'Privacy Pocily.',
      'hi': 'गोपनीयता शांतिपूर्वक.',
      'ms': 'Polisi Privasi.',
      'zh_Hans': '隐私政策。',
    },
    'ruyhutj1': {
      'en': 'Continue',
      'hi': 'जारी रखना',
      'ms': 'teruskan',
      'zh_Hans': '继续',
    },
  },
  // Need_to_know
  {
    'ajjg7g5n': {
      'en': 'To keep in mind',
      'hi': 'ध्यान में रखेरखना',
      'ms': 'Untuk diingati',
      'zh_Hans': '要牢记',
    },
    'ogrq8u6z': {
      'en': 'Mystery Bag',
      'hi': 'रहस्य बैग',
      'ms': 'Beg Misteri',
      'zh_Hans': '神秘袋',
    },
    'b0cxnv4y': {
      'en':
          'While we\'d love to provide an exact preview of your mystery bag contents, the thrill lies in its unpredictability! Packed with an assortment of unsold items, handpicked by the store. If you have inquiries about specific ingredients, feel free to inquire on the site.',
      'hi':
          'हालाँकि हम आपके मिस्ट्री बैग सामग्री का सटीक पूर्वावलोकन प्रदान करना पसंद करेंगे, लेकिन रोमांच इसकी अप्रत्याशितता में निहित है! स्टोर द्वारा चुनी गई, बिना बिकी वस्तुओं के वर्गीकरण के साथ पैक किया गया। यदि आपके पास विशिष्ट सामग्रियों के बारे में पूछताछ है, तो बेझिझक साइट पर पूछताछ करें।',
      'ms':
          'Walaupun kami ingin memberikan pratonton tepat kandungan beg misteri anda, keseronokan terletak pada ketidakpastiannya! Dikemas dengan pelbagai jenis barang yang tidak terjual, dipilih sendiri oleh kedai. Jika anda mempunyai pertanyaan tentang bahan-bahan tertentu, jangan ragu untuk bertanya di laman web ini.',
      'zh_Hans':
          '虽然我们很乐意为您提供神秘袋内容的准确预览，但刺激之处在于它的不可预测性！里面装满了商店精心挑选的各种未售出商品。如果您对具体成分有疑问，请随时在网站上查询。',
    },
    '1u5jddul': {
      'en': 'Got it!',
      'hi': 'समझ गया!',
      'ms': 'faham!',
      'zh_Hans': '知道了！',
    },
    'jg4smygc': {
      'en': 'Go back',
      'hi': 'वापस जाओ',
      'ms': 'Pergi balik',
      'zh_Hans': '回去',
    },
  },
  // order_confirmation
  {
    'ha0dheaz': {
      'en': 'Succes!',
      'hi': 'सफल!',
      'ms': 'Berjaya!',
      'zh_Hans': '成功了！',
    },
    'oc9y2egm': {
      'en':
          'Your mystery bag order is locked in! Swing by the store at the set pickup time and don\'t forget to present your order number to the store staff. Get ready to uncover the mystery!',
      'hi':
          'आपका मिस्ट्री बैग ऑर्डर लॉक हो गया है! निर्धारित पिकअप समय पर स्टोर पर आएं और स्टोर स्टाफ को अपना ऑर्डर नंबर देना न भूलें। रहस्य उजागर करने के लिए तैयार हो जाइए!',
      'ms':
          'Tempahan beg misteri anda telah dikunci! Berbuai ke kedai pada waktu pengambilan yang ditetapkan dan jangan lupa tunjukkan nombor pesanan anda kepada kakitangan kedai. Bersedia untuk membongkar misteri!',
      'zh_Hans': '您的神秘袋订单已锁定！在设定的取货时间前往商店，不要忘记向商店工作人员出示您的订单号。准备好揭开谜底吧！',
    },
    'mk1el5j0': {
      'en': 'Order Number:',
      'hi': 'क्रम संख्या:',
      'ms': 'Nombor Pesanan:',
      'zh_Hans': '订单号：',
    },
    'iys9g485': {
      'en': '#',
      'hi': '#',
      'ms': '#',
      'zh_Hans': '#',
    },
    'fji1e0b1': {
      'en': 'Pick Up Time:',
      'hi': 'समय लेने:',
      'ms': 'Masa Ambil:',
      'zh_Hans': '接载时间：',
    },
    'vc01ylpt': {
      'en': ' - ',
      'hi': '-',
      'ms': '-',
      'zh_Hans': '-',
    },
    'po3drie7': {
      'en': 'Done',
      'hi': 'समझ गया!',
      'ms': 'faham!',
      'zh_Hans': '知道了！',
    },
  },
  // search_tab
  {
    'kds5ukso': {
      'en': 'Search Store',
      'hi': 'स्टोर खोजें',
      'ms': 'Kedai Carian',
      'zh_Hans': '搜索商店',
    },
    '9dc1telt': {
      'en': 'Collect today at ',
      'hi': 'आज ही एकत्र करें',
      'ms': 'Kumpul hari ini di',
      'zh_Hans': '今天收集于',
    },
    'h8hea8l1': {
      'en': 'x',
      'hi': 'एक्स',
      'ms': 'x',
      'zh_Hans': 'X',
    },
    'c1est1cd': {
      'en': ' - ',
      'hi': '-',
      'ms': '-',
      'zh_Hans': '-',
    },
    'duq2vfbx': {
      'en': 'x',
      'hi': 'एक्स',
      'ms': 'x',
      'zh_Hans': 'X',
    },
    'j8n2biwg': {
      'en': 'No',
      'hi': 'नहीं',
      'ms': 'Tidak',
      'zh_Hans': '不',
    },
    'ptvmth8i': {
      'en': ' m',
      'hi': 'एम',
      'ms': 'm',
      'zh_Hans': '米',
    },
  },
  // location
  {
    'xhy4qk1e': {
      'en': 'Select a distance',
      'hi': 'एक दूरी चुनें',
      'ms': 'Pilih jarak',
      'zh_Hans': '选择距离',
    },
    'q2iucvae': {
      'en': ' km',
      'hi': 'किमी',
      'ms': 'km',
      'zh_Hans': '公里',
    },
    'h8z51n6g': {
      'en': 'Select a city',
      'hi': 'एक शहर चुनें',
      'ms': 'Pilih bandar',
      'zh_Hans': '选择城市',
    },
    'tdxuja1e': {
      'en': 'Use my current location',
      'hi': 'मेरे वर्तमान स्थान का उपयोग करें',
      'ms': 'Gunakan lokasi semasa saya',
      'zh_Hans': '使用我当前的位置',
    },
    'yvqi8xdl': {
      'en': 'Show results',
      'hi': 'परिणाम दिखाएं',
      'ms': 'Tunjukkan keputusan',
      'zh_Hans': '显示结果',
    },
  },
  // diet
  {
    'tzcdigif': {
      'en': 'Food Diet',
      'hi': 'भोजन आहार',
      'ms': 'Diet Makanan',
      'zh_Hans': '食物饮食',
    },
    'zu8jxzkj': {
      'en': 'V',
      'hi': 'वी',
      'ms': 'V',
      'zh_Hans': 'V',
    },
    'f15y6kwi': {
      'en': 'Vegetarian',
      'hi': 'शाकाहारी',
      'ms': 'Vegetarian',
      'zh_Hans': '素食',
    },
    'wa462gef': {
      'en': 'V+',
      'hi': 'वी+',
      'ms': 'V+',
      'zh_Hans': 'V+',
    },
    'z8w158mg': {
      'en': 'Vegan',
      'hi': 'शाकाहारी',
      'ms': 'Vegan',
      'zh_Hans': '素食主义者',
    },
    '67zncrdx': {
      'en': 'H',
      'hi': 'एच',
      'ms': 'H',
      'zh_Hans': 'H',
    },
    '7425fll8': {
      'en': 'Halal',
      'hi': 'हलाल',
      'ms': 'Halal',
      'zh_Hans': '清真',
    },
    '8on1g2ig': {
      'en': 'Offers',
      'hi': 'ऑफर',
      'ms': 'Tawaran',
      'zh_Hans': '优惠',
    },
    'lquqdenw': {
      'en': 'Full Menu',
      'hi': 'पूरा मेन्यू',
      'ms': 'Menu Penuh',
      'zh_Hans': '完整菜单',
    },
    '72571sjm': {
      'en': 'Mystery Bag',
      'hi': 'रहस्य बैग',
      'ms': 'Beg Misteri',
      'zh_Hans': '神秘袋',
    },
  },
  // send_confirm
  {
    '97v1djx8': {
      'en': 'Message received',
      'hi': 'संदेश मिल गया',
      'ms': 'Mesej diterima',
      'zh_Hans': '收到消息',
    },
    '5fglqbx9': {
      'en': 'Thanks for contacting us! We\'ll be in touch shortly.',
      'hi': 'हमसे संपर्क करने के लिए धन्यवाद! हम शीघ्र ही संपर्क करेंगे.',
      'ms':
          'Terima kasih kerana menghubungi kami! Kami akan berhubung sebentar lagi.',
      'zh_Hans': '谢谢您联络我们！我们很快就会联系您。',
    },
    'motkxtno': {
      'en': 'Done',
      'hi': 'हो गया',
      'ms': 'Selesai',
      'zh_Hans': '完毕',
    },
  },
  // reccomend_confirm
  {
    'b00honpk': {
      'en': 'Thank you for your recommendation!',
      'hi': 'आपकी अनुशंसा के लिए धन्यवाद!',
      'ms': 'Terima kasih atas cadangan anda!',
      'zh_Hans': '谢谢您的推荐！',
    },
    '993lys9d': {
      'en':
          'Your recommendation means a lot to us. We truly appreciate your input and for helping us make our app better for everyone!',
      'hi':
          'आपकी अनुशंसा हमारे लिए बहुत मायने रखती है. हम वास्तव में आपके इनपुट और हमारे ऐप को सभी के लिए बेहतर बनाने में हमारी मदद करने के लिए सराहना करते हैं!',
      'ms':
          'Cadangan anda amat bermakna bagi kami. Kami amat menghargai input anda dan kerana membantu kami menjadikan apl kami lebih baik untuk semua orang!',
      'zh_Hans': '您的推荐对我们来说意义重大。我们真诚地感谢您的意见并帮助我们让我们的应用程序更好地为每个人服务！',
    },
    '3vjm71bn': {
      'en': 'Done',
      'hi': 'हो गया',
      'ms': 'Selesai',
      'zh_Hans': '完毕',
    },
  },
  // navigation
  {
    'c32j91uw': {
      'en': 'Directions',
      'hi': 'दिशा-निर्देश',
      'ms': 'Arah',
      'zh_Hans': '路线',
    },
    '9enw3f9b': {
      'en': 'Open in Apple Maps',
      'hi': 'एप्पल मैप्स में खोलें',
      'ms': 'Buka dalam Peta Apple',
      'zh_Hans': '在苹果地图中打开',
    },
    'zpshk25j': {
      'en': 'Open in Google Maps',
      'hi': 'Google मानचित्र में खोलें',
      'ms': 'Buka dalam Peta Google',
      'zh_Hans': '在 Google 地图中打开',
    },
    'g6mkdvqd': {
      'en': 'Open in Waze',
      'hi': 'वेज़ में खोलें',
      'ms': 'Buka dalam Waze',
      'zh_Hans': '在位智中打开',
    },
  },
  // more_info_order
  {
    't2551wob': {
      'en': 'Order Number: ',
      'hi': 'क्रम संख्या:',
      'ms': 'Nombor Pesanan:',
      'zh_Hans': '订单号：',
    },
    'ry1fox8t': {
      'en': '#',
      'hi': '#',
      'ms': '#',
      'zh_Hans': '#',
    },
    '9k1hjri9': {
      'en': 'Order picked up:',
      'hi': 'ऑर्डर उठा लिया गया:',
      'ms': 'Pesanan diambil:',
      'zh_Hans': '订单已取：',
    },
    '8zztv3g9': {
      'en': 'Order has been picked up',
      'hi': 'ऑर्डर उठा लिया गया है',
      'ms': 'Pesanan telah diambil',
      'zh_Hans': '订单已取货',
    },
    'bfec7ike': {
      'en': 'YES',
      'hi': 'हाँ',
      'ms': 'YA',
      'zh_Hans': '是的',
    },
    '6sipupmr': {
      'en': 'Order',
      'hi': 'जगह',
      'ms': 'Lokasi',
      'zh_Hans': '地点',
    },
    '922wpo95': {
      'en': 'Mystery Bag',
      'hi': 'कुल',
      'ms': 'Jumlah',
      'zh_Hans': '全部的',
    },
    '2ginxspn': {
      'en': 'RM ',
      'hi': 'कुल',
      'ms': 'Jumlah',
      'zh_Hans': '全部的',
    },
    'ncwscqbe': {
      'en': 'RM ',
      'hi': 'कुल',
      'ms': 'Jumlah',
      'zh_Hans': '全部的',
    },
    'k2to69xc': {
      'en': 'Location',
      'hi': 'जगह',
      'ms': 'Lokasi',
      'zh_Hans': '地点',
    },
    'duc4yols': {
      'en': 'Open in Apple Maps',
      'hi': 'एप्पल मैप्स में खोलें',
      'ms': 'Buka dalam Peta Apple',
      'zh_Hans': '在苹果地图中打开',
    },
    '9x0we0eo': {
      'en': 'Open in Google Maps',
      'hi': 'Google मानचित्र में खोलें',
      'ms': 'Buka dalam Peta Google',
      'zh_Hans': '在 Google 地图中打开',
    },
    'qnwbehp1': {
      'en': 'Open in Waze',
      'hi': 'वेज़ में खोलें',
      'ms': 'Buka dalam Waze',
      'zh_Hans': '在位智中打开',
    },
  },
  // rate_order
  {
    'k5s4xutt': {
      'en': 'How was your experience with ',
      'hi': 'आपका अनुभव कैसा रहा',
      'ms': 'Bagaimana pengalaman anda dengan',
      'zh_Hans': '您的体验如何',
    },
    'emgty4sb': {
      'en': 'Rate order',
      'hi': 'दर आदेश',
      'ms': 'Pesanan kadar',
      'zh_Hans': '费率订单',
    },
  },
  // soon
  {
    'cwhfmj1b': {
      'en': 'Not available yet',
      'hi': 'संदेश मिल गया',
      'ms': 'Mesej diterima',
      'zh_Hans': '收到消息',
    },
    '8kczdwi6': {
      'en': 'Please check back again soon!',
      'hi': 'हमसे संपर्क करने के लिए धन्यवाद! हम शीघ्र ही संपर्क करेंगे.',
      'ms':
          'Terima kasih kerana menghubungi kami! Kami akan berhubung sebentar lagi.',
      'zh_Hans': '谢谢您联络我们！我们很快就会联系您。',
    },
    'b5ygwvcb': {
      'en': 'Back',
      'hi': 'हो गया',
      'ms': 'Selesai',
      'zh_Hans': '完毕',
    },
  },
  // regiRestauCont
  {
    'c2adbenf': {
      'en': 'Join StopBy and monetize your surplus food!',
      'hi': 'लुंगटी के साथ एक निजी शेफ बनें',
      'ms': 'Jadi tukang masak peribadi dengan Lungti',
      'zh_Hans': '与 Lungti 一起成为私人厨师',
    },
    '21nu0scc': {
      'en':
          'Embrace sustainability, boost revenue, and gain exposure: Convert surplus food into profit while contributing to the climate change cause – Join us today!',
      'hi':
          'क्या आप खाना पकाने के अपने जुनून को एक अतिरिक्त काम में बदलने या अपने भाग्य को नियंत्रित करने वाला एक उद्यमी शेफ बनने के लिए तैयार हैं? हमसे अभी जुड़ो!\n\nबस हमें अपना ईमेल भेजें, और हम आपकी पाक यात्रा को शुरू करने के लिए आपसे संपर्क करेंगे।',
      'ms':
          'Bersedia untuk mengubah minat anda untuk memasak menjadi sibuk sampingan atau menjadi seorang chef usahawan yang mengawal nasib anda sendiri? Sertai kami sekarang!\n\nHanya hantarkan e-mel anda kepada kami, dan kami akan menghubungi kami untuk memulakan perjalanan masakan anda.',
      'zh_Hans':
          '准备好将对烹饪的热情变成副业或成为一名掌控自己命运的企业家厨师吗？现在就加入我们！\n\n只需向我们发送您的电子邮件，我们就会与您联系，开始您的烹饪之旅。',
    },
    'gnebx1rf': {
      'en': 'Type',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'ecrifs5l': {
      'en': 'Meals',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'l221sdh5': {
      'en': 'Groceries',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'lkj046hi': {
      'en': 'Bread & Pastries',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'q8qnuyum': {
      'en': 'Drinks',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '7731fyb7': {
      'en': 'Other',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    't8isa0i7': {
      'en': 'Type',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'tak3ksz0': {
      'en': 'Search for an item...',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'gi5b8oty': {
      'en': 'Email',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'zlmr79rz': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'o2zvj0xk': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'ixgoyqgg': {
      'en': 'Country',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'bprra9sd': {
      'en': 'Malaysia',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'rejkgn8y': {
      'en': 'Malaysia',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '4j3t5zd8': {
      'en': 'Choose Country',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '3jy5d4yc': {
      'en': 'Search for an item...',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'at82at4f': {
      'en': 'Phone Number',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'vmhz319d': {
      'en': '+60',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'l451zm8l': {
      'en': '+60',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'j3ahxs6m': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '4v6lnr6q': {
      'en': 'Search for an item...',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'kehjg6g7': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'j5q8fixe': {
      'en':
          'Enter your store\'s name in the search field below, if you can\'t find your store just put the most accurate address.',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'f0f2assr': {
      'en': 'Location',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '8qx4rb7l': {
      'en': 'Set location',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '7cev6krx': {
      'en': 'Sign Up',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
  },
  // regiRestauCont2
  {
    '1o3tgkhx': {
      'en':
          'Please confirm or edit your store\'s name and address, fill out what is missing.',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'ehvb81za': {
      'en': 'Store Name',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '1nvus77u': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'ldo7nzsi': {
      'en': 'Full Address',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'p451i968': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '5z5qdyc9': {
      'en': 'City',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '3biyikt5': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'sh49rgqp': {
      'en': 'Zip Code',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '7vgiq9u2': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
  },
  // verification
  {
    '7apqh7xj': {
      'en': 'Account Verification',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'ah4rolct': {
      'en':
          'We\'re currently in the process of reviewing your account. Once your account is approved for joining, we\'ll promptly notify you. Thank you!',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
  },
  // completeBizzProfiel
  {
    'wwgy2u0z': {
      'en': 'Upload logo and cover photo',
      'hi': 'लुंगटी के साथ एक निजी शेफ बनें',
      'ms': 'Jadi tukang masak peribadi dengan Lungti',
      'zh_Hans': '与 Lungti 一起成为私人厨师',
    },
    'jupjuql2': {
      'en':
          'Boost your presence on our app! Upload your logo and a cover photo to attract more customers.',
      'hi':
          'क्या आप खाना पकाने के अपने जुनून को एक अतिरिक्त काम में बदलने या अपने भाग्य को नियंत्रित करने वाला एक उद्यमी शेफ बनने के लिए तैयार हैं? हमसे अभी जुड़ो!\n\nबस हमें अपना ईमेल भेजें, और हम आपकी पाक यात्रा को शुरू करने के लिए आपसे संपर्क करेंगे।',
      'ms':
          'Bersedia untuk mengubah minat anda untuk memasak menjadi sibuk sampingan atau menjadi seorang chef usahawan yang mengawal nasib anda sendiri? Sertai kami sekarang!\n\nHanya hantarkan e-mel anda kepada kami, dan kami akan menghubungi kami untuk memulakan perjalanan masakan anda.',
      'zh_Hans':
          '准备好将对烹饪的热情变成副业或成为一名掌控自己命运的企业家厨师吗？现在就加入我们！\n\n只需向我们发送您的电子邮件，我们就会与您联系，开始您的烹饪之旅。',
    },
    '4t5o43mf': {
      'en': 'Logo',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'nmlk4tr4': {
      'en': 'Cover',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
  },
  // mysteryBagInfo
  {
    'bsuvfui9': {
      'en': 'Start selling your surplus food',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'inekhv54': {
      'en':
          'The innovative solution designed exclusively for food businesses aiming to minimize food waste and maximize revenue.',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '0wv5arhm': {
      'en': 'Mystery Bag :\nA Surprise with Purpose',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'n8v84717': {
      'en':
          '\nA Mystery Bag, available through the StopBy app, introduces customers to an engaging and unpredictable shopping experience. Recognizing the challenge of forecasting end-of-day inventory, we intentionally keep the bag contents unspecified. Each day brings a delightful surprise, as the bag\'s contents vary.\n\nOur Mystery Bags serve as an inventive solution to efficiently sell surplus items nearing expiration. By curating a bag with items totaling three times their original value, you can offer these bags at a fraction of the regular price. This approach ensures a win-win scenario – customers revel in the excitement of a surprise, and your store minimizes food waste. It\'s a dynamic and sustainable way to provide value and reduce environmental impact.',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'eixvtxss': {
      'en': 'ADD MYSTERY BAG',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
  },
  // mysteryBagPrice
  {
    't92i0a92': {
      'en': 'Price',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '0pwptbr1': {
      'en':
          'Decide the cost of your Mystery Bag based on the regular prices of the items. We\'ll then calculate the selling price for customers by dividing it by 3.',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'r6pubaq8': {
      'en': 'Price - RM',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'a2bpsev3': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'mqjeecy9': {
      'en': 'Set Price',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
  },
  // mysteryBagDescription
  {
    'b62jebd6': {
      'en': 'Bag Description',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '2j5zlerr': {
      'en':
          'Choose a unique name and describe what you\'d like to include in it. Provide more details if you have them, or simply stick to a pre-made name and description.',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '1uhim6vk': {
      'en': 'Bag Name',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'hxrbnfh0': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '2widsrlp': {
      'en': 'Mystery Bag',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'ul5yri9s': {
      'en': 'Food types',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '6t71d39f': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '81larqvv': {
      'en': 'Meals',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '0cdxixmc': {
      'en': 'Bread & Pastries',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'ymhcvbeo': {
      'en': 'Groceries',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'ca9g87n8': {
      'en': 'Other',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'd50vqxaq': {
      'en': 'Select Food Type',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '5x3wbr44': {
      'en': 'Search for an item...',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'l4ue207k': {
      'en': 'Bag Description',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'bjl2a50x': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'e95wp57t': {
      'en':
          'It\'s a mystery! When you buy a Mystery Bag, it will be filled with the delicious food that the store has left at the end of the day.',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'moo26xhh': {
      'en': 'Next',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
  },
  // mysteryBagTimeQuantity
  {
    'mjmehb2k': {
      'en': 'Time And Quantity',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'c1zmtgva': {
      'en':
          'Specify your preferred pickup time and indicate the quantity of bags you can sell.',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    't7s8fabt': {
      'en': 'Collect Time',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'yexnv7c6': {
      'en': '-',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'zqpny8sf': {
      'en': 'Quantity',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'znqi2q2v': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'hdvalo4z': {
      'en': '0',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'mku3euuu': {
      'en': 'Next',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
  },
  // mysteryBagDescriptionUpdate
  {
    'psrs62hu': {
      'en': 'Bag Name',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'f2z4toi0': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '7lv3rkjn': {
      'en': 'Food types',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'goypcslr': {
      'en': 'Meals',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'yz7ip208': {
      'en': 'Bread & Pastries',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'sp7b1qwl': {
      'en': 'Groceries',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '6we09uyr': {
      'en': 'Drinks',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'v5w0x55h': {
      'en': 'Other',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'csec2ira': {
      'en': 'Select Food Type',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'mn3eazsp': {
      'en': 'Search for an item...',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'uetzmxv6': {
      'en': 'Bag Description',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'p7bffu7e': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '56ewqedx': {
      'en': 'Save',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
  },
  // mysteryBagPriceUpdate
  {
    'v07ur1im': {
      'en': 'Price - RM',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '80h8nolu': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'crt17s62': {
      'en': 'Set Price',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '99ce2zia': {
      'en': 'Save',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
  },
  // mysteryBagTimeUpdate
  {
    'fsh62fzm': {
      'en': 'Collect Time',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '1mgk3f6f': {
      'en': '-',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
  },
  // mysteryBagGoLive
  {
    'uz7rt80e': {
      'en': 'Collect Time',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '1zgkpylx': {
      'en': '-',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'mmyk1h7s': {
      'en': 'Quantity',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'vqvz8iv7': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'j82ycftx': {
      'en': 'GO LIVE',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
  },
  // mysteryBagPictureUpdate
  {
    'h0t61mn9': {
      'en': 'Logo',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    't5ndneyh': {
      'en': 'Cover',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
  },
  // tipsResources
  {
    '7p1pb7u9': {
      'en': 'Tips and resources',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'fyhpeyrv': {
      'en': 'What is a Mystery Bag?',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'hugdqfrw': {
      'en':
          'A Mystery Bag is what customers buy from you on the StopBy app. As most stores can\'t predict what will be left at the end of the day, we make sure not to specify exactly what the contents of the bags will be. The contents will vary from day to day and always be a surprise to the customer.',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'uc0zis0r': {
      'en': 'Earnings and payouts',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'cdcfu9yf': {
      'en':
          'We institute a reservation fee of 10% + 2RM for each Mystery Bag purchased through our app. This fee is paid by the customer via the app at the time of reservation. Upon picking up the bag, the customer will settle the remaining price directly with your store, covering the full cost of the bag using either cash or card. This two-step payment process not only ensures that you receive the complete earnings you\'ve set for your Mystery Bag but also provides the flexibility for customers to add extra products during their in-store visit. Our goal is to seamlessly integrate this reservation fee into the transaction, maximizing your earnings without introducing any extra payment processing charges. Consider this fee as a convenient way for the customer to secure the Mystery Bag and handle the remaining payment at the time of pickup.additional payment processing charges. Consider this fee as a reservation cost for the customer, facilitating a smooth pickup process for their Mystery Bag.',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'jx0uu61p': {
      'en': 'How do I sell my surplus food on your app?',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'gfsilfus': {
      'en':
          'After establishing your account, your store becomes visible to customers on our app. When you have surplus food available, activate your store on the app for that day. Specify the quantity of bags and the pickup time. Once your store is active, customers can reserve a bag through the app and collect it at the scheduled pickup time. Verify the reservation receipt on each customer\'s phone, hand over their Mystery Bag, and settle the remaining payment according to your preference.',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
  },
  // tabStore
  {
    '4k9xgykx': {
      'en': 'Collect today at ',
      'hi': 'आज ही एकत्र करें',
      'ms': 'Kumpul hari ini di',
      'zh_Hans': '今天收集于',
    },
    '8o82m3ha': {
      'en': ' - ',
      'hi': '-',
      'ms': '-',
      'zh_Hans': '-',
    },
    'i9mxu5bx': {
      'en': ' m',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'dfjow64s': {
      'en': 'RM ',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '4tt0x8de': {
      'en': 'Sold out',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
  },
  // paymentTab
  {
    'kmq7kv62': {
      'en': 'Collect today at ',
      'hi': 'आज ही एकत्र करें',
      'ms': 'Kumpul hari ini di',
      'zh_Hans': '今天收集于',
    },
    'qxfeivew': {
      'en': ' - ',
      'hi': '-',
      'ms': '-',
      'zh_Hans': '-',
    },
    '9d595pp4': {
      'en':
          'Make the reservation fee payment now, the rest is due at the store during pickup.',
      'hi':
          'हालाँकि हम आपके मिस्ट्री बैग सामग्री का सटीक पूर्वावलोकन प्रदान करना पसंद करेंगे, लेकिन रोमांच इसकी अप्रत्याशितता में निहित है! स्टोर द्वारा चुनी गई, बिना बिकी वस्तुओं के वर्गीकरण के साथ पैक किया गया। यदि आपके पास विशिष्ट सामग्रियों के बारे में पूछताछ है, तो बेझिझक साइट पर पूछताछ करें।',
      'ms':
          'Walaupun kami ingin memberikan pratonton tepat kandungan beg misteri anda, keseronokan terletak pada ketidakpastiannya! Dikemas dengan pelbagai jenis barang yang tidak terjual, dipilih sendiri oleh kedai. Jika anda mempunyai pertanyaan tentang bahan-bahan tertentu, jangan ragu untuk bertanya di laman web ini.',
      'zh_Hans':
          '虽然我们很乐意为您提供神秘袋内容的准确预览，但刺激之处在于它的不可预测性！里面装满了商店精心挑选的各种未售出商品。如果您对具体成分有疑问，请随时在网站上查询。',
    },
    'ogwqzroe': {
      'en': 'Select quantity',
      'hi': 'ध्यान में रखेरखना',
      'ms': 'Untuk diingati',
      'zh_Hans': '要牢记',
    },
    'qgniaksz': {
      'en': 'By reserving this meal you agree to StopBy\nTerms and Conditions',
      'hi': 'इस भोजन को आरक्षित करके आप लुंगती से सहमत हैं',
      'ms': 'Dengan menempah makanan ini anda bersetuju dengan Lungti',
      'zh_Hans': '预订此餐即表示您同意 Lungti',
    },
    'tw2s5o21': {
      'en': 'Mystery Bag',
      'hi': 'कुल',
      'ms': 'Jumlah',
      'zh_Hans': '全部的',
    },
    'dvrr5nc9': {
      'en': 'RM ',
      'hi': 'कुल',
      'ms': 'Jumlah',
      'zh_Hans': '全部的',
    },
    'p957g92g': {
      'en': 'RM ',
      'hi': 'कुल',
      'ms': 'Jumlah',
      'zh_Hans': '全部的',
    },
    '8w1re62z': {
      'en': 'Reservation fee',
      'hi': 'कुल',
      'ms': 'Jumlah',
      'zh_Hans': '全部的',
    },
    '8rfdlk30': {
      'en': 'RM ',
      'hi': 'कुल',
      'ms': 'Jumlah',
      'zh_Hans': '全部的',
    },
    'poyk5tu7': {
      'en': 'RM ',
      'hi': 'कुल',
      'ms': 'Jumlah',
      'zh_Hans': '全部的',
    },
    '7iugofin': {
      'en': 'Total',
      'hi': 'कुल',
      'ms': 'Jumlah',
      'zh_Hans': '全部的',
    },
    'yp9f1gzi': {
      'en': 'RM ',
      'hi': 'कुल',
      'ms': 'Jumlah',
      'zh_Hans': '全部的',
    },
    'mk8b03n2': {
      'en': 'RM ',
      'hi': 'कुल',
      'ms': 'Jumlah',
      'zh_Hans': '全部的',
    },
    'hgxhtfzc': {
      'en': 'Reserve Now',
      'hi': 'जमा करना / खर्च करना का कार्ड',
      'ms': 'Kad Kredit/Debit',
      'zh_Hans': '信用卡/借记卡',
    },
  },
  // order_pickedUp
  {
    'hobur14s': {
      'en': 'Order Number',
      'hi': 'सफल!',
      'ms': 'Berjaya!',
      'zh_Hans': '成功了！',
    },
    'hfuc6ahj': {
      'en': '#',
      'hi': '#',
      'ms': '#',
      'zh_Hans': '#',
    },
    'lvzmtu4v': {
      'en': 'Price',
      'hi': 'सफल!',
      'ms': 'Berjaya!',
      'zh_Hans': '成功了！',
    },
    '1xh7owcx': {
      'en': 'RM ',
      'hi': '#',
      'ms': '#',
      'zh_Hans': '#',
    },
    'emrmc37l': {
      'en': 'PICKED UP',
      'hi': 'समझ गया!',
      'ms': 'faham!',
      'zh_Hans': '知道了！',
    },
  },
  // Miscellaneous
  {
    'w138z658': {
      'en':
          ' In order to search stores nearby, this app requires acces to your current location.',
      'hi':
          'आस-पास के स्टोर खोजने के लिए, इस ऐप को आपके वर्तमान स्थान तक पहुंच की आवश्यकता होती है।',
      'ms':
          'Untuk mencari kedai berdekatan, apl ini memerlukan akses ke lokasi semasa anda.',
      'zh_Hans': '为了搜索附近的商店，此应用程序需要访问您当前的位置。',
    },
    'xb354glg': {
      'en':
          'In order to take a picture or video, this app requires permission to access the camera.',
      'hi':
          'चित्र या वीडियो लेने के लिए, इस ऐप को कैमरे तक पहुंचने की अनुमति की आवश्यकता होती है।',
      'ms':
          'Untuk mengambil gambar atau video, aplikasi ini memerlukan kebenaran untuk mengakses kamera.',
      'zh_Hans': '为了拍摄照片或视频，此应用程序需要访问相机的权限。',
    },
    'yuff14dj': {
      'en':
          'To upload photos, please grant the app access to your photos in Settings.',
      'hi':
          'फ़ोटो अपलोड करने के लिए, कृपया सेटिंग में ऐप को अपनी फ़ोटो तक पहुंच प्रदान करें।',
      'ms':
          'Untuk memuat naik foto, sila berikan apl akses kepada foto anda dalam Tetapan.',
      'zh_Hans': '要上传照片，请在“设置”中授予应用程序访问您照片的权限。',
    },
    'jcs2ooyr': {
      'en':
          'Get notified about availability, feature updates, promotions, and more.',
      'hi':
          'उपलब्धता, फीचर अपडेट, प्रमोशन और बहुत कुछ के बारे में सूचना प्राप्त करें।',
      'ms':
          'Dapatkan pemberitahuan tentang ketersediaan, kemas kini ciri, promosi dan banyak lagi.',
      'zh_Hans': '获取有关可用性、功能更新、促销等信息的通知。',
    },
    'owm3xjgc': {
      'en':
          'In order to search stores nearby, this app requires acces to your current location.',
      'hi':
          'आस-पास के स्टोर खोजने के लिए, इस ऐप को आपके वर्तमान स्थान तक पहुंच की आवश्यकता होती है।',
      'ms':
          'Untuk mencari kedai berdekatan, apl ini memerlukan akses ke lokasi semasa anda.',
      'zh_Hans': '为了搜索附近的商店，此应用程序需要访问您当前的位置。',
    },
    'klhrhf9b': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'u3ih4lld': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'lkdt1bsp': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'peotsp07': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'm6q2u3a8': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'o6aon7kn': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'b0doh5vi': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'wy3a2wu9': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'yv698lm2': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'xady3bl8': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '53p6y87l': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '85tydgkb': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'sjwnxp6z': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '2hlj2u4j': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    's3blsatn': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'xacmf9b8': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'w9st2x83': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'jjtupz97': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'zjrwv7yt': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'in6hun8i': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'pzu224nf': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'nfow688b': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    'ilyrctg2': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
    '5e0q19ln': {
      'en': '',
      'hi': '',
      'ms': '',
      'zh_Hans': '',
    },
  },
].reduce((a, b) => a..addAll(b));
