import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'zh_Hans'];

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
    String? zh_HansText = '',
  }) =>
      [enText, zh_HansText][languageIndex] ?? '';

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
  // loginPage
  {
    'o07j3mgv': {
      'en': 'Welcome back',
      'zh_Hans': '欢迎回来',
    },
    'fzxvw3mu': {
      'en': 'Login to access your account below.',
      'zh_Hans': '登录后即可访问下面您的帐户。',
    },
    'a9j78va9': {
      'en': 'Email Address',
      'zh_Hans': '电子邮件',
    },
    'i7f18cve': {
      'en': 'Enter your email...',
      'zh_Hans': '输入您的电子邮件...',
    },
    'wztjmbn8': {
      'en': 'Password',
      'zh_Hans': '密码',
    },
    'lw1jpm1f': {
      'en': 'Enter your password...',
      'zh_Hans': '输入您的密码...',
    },
    'm2xyjvuf': {
      'en': 'Forgot Password?',
      'zh_Hans': '忘记密码？',
    },
    'qbmoi1av': {
      'en': 'Login',
      'zh_Hans': '登录',
    },
    'cjqb8ial': {
      'en': 'Don\'t have an account?',
      'zh_Hans': '沒有帳戶？',
    },
    'a0iimirx': {
      'en': 'Create',
      'zh_Hans': '创造',
    },
    '1zqiw31h': {
      'en': 'Continue as Guest',
      'zh_Hans': '继续作为访客',
    },
    '2bb3vct7': {
      'en': 'Home',
      'zh_Hans': '家',
    },
  },
  // registerAccount
  {
    'gpokmd81': {
      'en': 'Get Started',
      'zh_Hans': '立即开始',
    },
    'oitrrwgg': {
      'en': 'Create your account below.',
      'zh_Hans': '在下面创建您的帐户。',
    },
    'gcwdqm4g': {
      'en': 'Email Address',
      'zh_Hans': '电子邮件',
    },
    'iam0xgwx': {
      'en': 'Enter your email...',
      'zh_Hans': '输入您的电子邮件...',
    },
    'bqv15dcf': {
      'en': 'Password',
      'zh_Hans': '密码',
    },
    'joih97mn': {
      'en': 'Enter your password...',
      'zh_Hans': '输入您的密码...',
    },
    'rzpiwq9p': {
      'en': 'Confirm Password',
      'zh_Hans': '确认密码',
    },
    'eyfkffka': {
      'en': 'Enter your password...',
      'zh_Hans': '输入您的密码...',
    },
    '5kmjfwsk': {
      'en': 'Create Account',
      'zh_Hans': '创建账户',
    },
    '3twynvfz': {
      'en': 'Login',
      'zh_Hans': '登录',
    },
    '9ssznj0g': {
      'en': 'Already have an account?',
      'zh_Hans': '已有账户？',
    },
    '3ugmx2zp': {
      'en': 'Continue as Guest',
      'zh_Hans': '继续作为访客',
    },
    'momge5oj': {
      'en': 'Home',
      'zh_Hans': '家',
    },
  },
  // completeProfile
  {
    'yhcaf7r2': {
      'en': 'Complete Profile',
      'zh_Hans': '完整简介',
    },
    'r6npjsue': {
      'en': 'Upload a photo for us to easily identify you.',
      'zh_Hans': '上传一张照片以便我们轻松识别您。',
    },
    'sdptn7dd': {
      'en': 'Your Name',
      'zh_Hans': '您的名字',
    },
    'n636qnrx': {
      'en': 'Your Age',
      'zh_Hans': '你的年龄',
    },
    's7yvjzbs': {
      'en': 'i.e. 34',
      'zh_Hans': '即 34',
    },
    '72ii0waq': {
      'en': 'Your Title',
      'zh_Hans': '你的头衔',
    },
    'pf8glhkg': {
      'en': 'What is your position?',
      'zh_Hans': '你的立场是什么？',
    },
    'hbhd3bdt': {
      'en': 'Complete Profile',
      'zh_Hans': '完整简介',
    },
    'w75dikic': {
      'en': 'Skip for Now',
      'zh_Hans': '暂时跳过',
    },
    '1eac148w': {
      'en': 'Field is required',
      'zh_Hans': '必填字段',
    },
    'ew7dbn3s': {
      'en': 'Field is required',
      'zh_Hans': '必填字段',
    },
    'jhhlgzk5': {
      'en': 'Field is required',
      'zh_Hans': '必填字段',
    },
    '4k3jnl38': {
      'en': 'Home',
      'zh_Hans': '家',
    },
  },
  // forgotPassword
  {
    'g416xg9f': {
      'en': 'Forgot Password',
      'zh_Hans': '忘记密码',
    },
    'xaiad71o': {
      'en':
          'Enter the email associated with your account and we will send you a verification code.',
      'zh_Hans': '输入与您的帐户关联的电子邮件，我们将向您发送验证码。',
    },
    'u4nuk910': {
      'en': 'Email Address',
      'zh_Hans': '电子邮件',
    },
    '37kotxi0': {
      'en': 'Enter your email...',
      'zh_Hans': '输入您的电子邮件...',
    },
    'hiwpaze1': {
      'en': 'Send Reset Link',
      'zh_Hans': '发送重置链接',
    },
    '598b8d3m': {
      'en': 'Home',
      'zh_Hans': '家',
    },
  },
  // onboarding
  {
    'i8hl2uua': {
      'en': 'Sleep Better',
      'zh_Hans': '创建预算',
    },
    'hxtwax0y': {
      'en': 'Start adopting healthier sleep habits',
      'zh_Hans': '创建可以与交易绑定的预算，以便于跟踪。',
    },
    'mjy3ljln': {
      'en': 'Complete Quests',
      'zh_Hans': '记录支出',
    },
    'uf9k1spp': {
      'en':
          'Quests and Programs that are completed gives you Points which can be converted to Prizes',
      'zh_Hans': '轻松添加交易并将其与已创建的预算关联。',
    },
    '9c4outzf': {
      'en': 'Hit the Leaderboard!',
      'zh_Hans': '预算分析',
    },
    'q30ina4f': {
      'en': 'Compete with your Buddies and Climb Up the Leaderboard!',
      'zh_Hans': '了解您的预算在哪里以及如何调整预算。',
    },
    'ypt7b97g': {
      'en': 'Create Your Account',
      'zh_Hans': '创建您的预算',
    },
    'oo0kk9qe': {
      'en': 'Home',
      'zh_Hans': '家',
    },
  },
  // MY_Card
  {
    'xn2so8km': {
      'en': 'My Card',
      'zh_Hans': '我的信用卡',
    },
    '6t7n9ugd': {
      'en': 'Balance',
      'zh_Hans': '平衡',
    },
    'h3086ma4': {
      'en': '\$7,630',
      'zh_Hans': '\$7,630',
    },
    'lr97k2rc': {
      'en': '**** 0149',
      'zh_Hans': '**** 0149',
    },
    'l9racj60': {
      'en': '05/25',
      'zh_Hans': '05/25',
    },
    '9b0j67se': {
      'en': 'Income',
      'zh_Hans': '收入',
    },
    'axrvkhrv': {
      'en': '+\$12,402',
      'zh_Hans': '+12,402美元',
    },
    '0d7w9e0i': {
      'en': '4.5% ',
      'zh_Hans': '4.5％',
    },
    'mggh8wu7': {
      'en': 'Spending',
      'zh_Hans': '开支',
    },
    'c5bszisf': {
      'en': '-\$8,392',
      'zh_Hans': '-8,392美元',
    },
    '85pb8msl': {
      'en': '4.5% ',
      'zh_Hans': '4.5％',
    },
    'yet7zk5d': {
      'en': 'Quick Service',
      'zh_Hans': '快速服务',
    },
    '8bnd6lco': {
      'en': 'Transfer',
      'zh_Hans': '转移',
    },
    'roobc02h': {
      'en': 'Pause Card',
      'zh_Hans': '暂停卡',
    },
    '27pb7ji4': {
      'en': 'Transaction',
      'zh_Hans': '交易',
    },
    'xs4cn7uk': {
      'en': 'Income',
      'zh_Hans': '收入',
    },
    'm8rhanhc': {
      'en': 'Sleep',
      'zh_Hans': '•',
    },
  },
  // paymentDetails
  {
    'j0yzgf4n': {
      'en': 'Details',
      'zh_Hans': '细节',
    },
    'zv72ekdw': {
      'en': 'Amount',
      'zh_Hans': '数量',
    },
    '0rjyjwed': {
      'en': 'Vendor',
      'zh_Hans': '小贩',
    },
    'eeyn6dk2': {
      'en': 'When',
      'zh_Hans': '什么时候',
    },
    'lccxx6eu': {
      'en': 'Reason',
      'zh_Hans': '原因',
    },
    'jzyax4hn': {
      'en': 'Spent by',
      'zh_Hans': '花费',
    },
    'i4r9jqwn': {
      'en': 'Home',
      'zh_Hans': '家',
    },
  },
  // MY_profilePage
  {
    'f1bvbey3': {
      'en': 'My Account',
      'zh_Hans': '我的账户',
    },
    'i61y9ibx': {
      'en': 'Edit Profile',
      'zh_Hans': '編輯資料',
    },
    '03k0vw86': {
      'en': 'Change Password',
      'zh_Hans': '更改密码',
    },
    '6w6wv95p': {
      'en': 'Notification Settings',
      'zh_Hans': '通知设置',
    },
    '9aogde79': {
      'en': 'Tutorial',
      'zh_Hans': '教程',
    },
    'eojlfs66': {
      'en': 'Privacy Policy',
      'zh_Hans': '隐私政策',
    },
    '2ll42t1u': {
      'en': 'Dark Mode',
      'zh_Hans': '暗黑模式',
    },
    '8d386226': {
      'en': 'Light Mode',
      'zh_Hans': '灯光模式',
    },
    '8srr2k0j': {
      'en': 'Profile',
      'zh_Hans': '•',
    },
  },
  // transferComplete
  {
    'xf8d4sm8': {
      'en': 'Transfer Complete',
      'zh_Hans': '传输完成',
    },
    'iq9jjji8': {
      'en':
          'Great work, you successfully transferred funds. It may take a few days for the funds to leave your account.',
      'zh_Hans': '太棒了，您已成功转账。资金可能需要几天时间才能转出您的账户。',
    },
    'wrbg19ed': {
      'en': 'Okay',
      'zh_Hans': '好的',
    },
    'ndkybnrt': {
      'en': 'Home',
      'zh_Hans': '家',
    },
  },
  // transferFunds
  {
    'pe3o18oh': {
      'en': 'Transfer Funds',
      'zh_Hans': '转移资金',
    },
    'kyzwrfh4': {
      'en': 'Balance',
      'zh_Hans': '平衡',
    },
    'zq4ozx20': {
      'en': '\$7,630',
      'zh_Hans': '\$7,630',
    },
    'qukh7yo1': {
      'en': '**** 0149',
      'zh_Hans': '**** 0149',
    },
    'n87hkr7d': {
      'en': '05/25',
      'zh_Hans': '05/25',
    },
    '3ct4fj7p': {
      'en': 'Change Account',
      'zh_Hans': '更改帐户',
    },
    'w4smsh2i': {
      'en': 'Internal Transfer',
      'zh_Hans': '内部转帐',
    },
    '6uxty3hy': {
      'en': 'External Transfer',
      'zh_Hans': '外部转移',
    },
    'p4ngma0d': {
      'en': 'ACH Payment',
      'zh_Hans': 'ACH付款',
    },
    'uxo87fjc': {
      'en': 'Transfer Type',
      'zh_Hans': '传输类型',
    },
    'fddma8xl': {
      'en': 'Select Account',
      'zh_Hans': '选择帐户',
    },
    '23l6kqgm': {
      'en': 'Account ****2010',
      'zh_Hans': '帐户****2010',
    },
    '3hwdfadf': {
      'en': 'Account ****2011',
      'zh_Hans': '帐户****2011',
    },
    'xvj00xg1': {
      'en': 'Account ****2012',
      'zh_Hans': '帐户****2012',
    },
    'ok5xluvk': {
      'en': 'Choose an Account',
      'zh_Hans': '选择一个帐户',
    },
    'ynie0pc5': {
      'en': '\$ Amount',
      'zh_Hans': '\$ 金额',
    },
    'wngoi0v4': {
      'en': 'Your new account balance is:',
      'zh_Hans': '您的新帐户余额为：',
    },
    'g6bfec2g': {
      'en': '\$7,630',
      'zh_Hans': '\$7,630',
    },
    'xaw2jdst': {
      'en': 'Send Transfer',
      'zh_Hans': '发送转账',
    },
    'xku4zxbe': {
      'en': 'Tap above to complete transfer',
      'zh_Hans': '点击上方即可完成转移',
    },
    'imaejg7x': {
      'en': 'Home',
      'zh_Hans': '家',
    },
  },
  // requestFunds
  {
    'wv1862li': {
      'en': 'Request Funds',
      'zh_Hans': '请求资金',
    },
    'xvj3fan8': {
      'en': '\$ Amount',
      'zh_Hans': '\$ 金额',
    },
    'wwjahvpl': {
      'en': 'Office Budget',
      'zh_Hans': '办公室预算',
    },
    'sx0vvzxd': {
      'en': 'External Transfer',
      'zh_Hans': '外部转移',
    },
    'ai453kej': {
      'en': 'ACH Payment',
      'zh_Hans': 'ACH付款',
    },
    'wo9cebk7': {
      'en': 'Select Transfer',
      'zh_Hans': '选择转移',
    },
    'rcevwwju': {
      'en': 'Reason',
      'zh_Hans': '原因',
    },
    'uvrt7im0': {
      'en': 'Request Funds',
      'zh_Hans': '请求资金',
    },
    '7y89msg9': {
      'en': 'Tap above to complete request',
      'zh_Hans': '点按上方以完成请求',
    },
    'xk0bwox3': {
      'en': 'Home',
      'zh_Hans': '家',
    },
  },
  // transaction_ADD
  {
    'qywon4k1': {
      'en': 'Add Transaction',
      'zh_Hans': '添加交易',
    },
    'bh9tad8e': {
      'en': 'Amount',
      'zh_Hans': '数量',
    },
    'ohewrgsv': {
      'en': 'Spent At',
      'zh_Hans': '花费在',
    },
    '3170k9n1': {
      'en': 'Office Budget',
      'zh_Hans': '办公室预算',
    },
    'abz6nm8z': {
      'en': 'External Transfer',
      'zh_Hans': '外部转移',
    },
    '3y95vtb6': {
      'en': 'ACH Payment',
      'zh_Hans': 'ACH付款',
    },
    '861el4k4': {
      'en': 'Select Budget',
      'zh_Hans': '选择预算',
    },
    'swxms7ln': {
      'en': 'Reason',
      'zh_Hans': '原因',
    },
    'uqfgu088': {
      'en': 'Add Transaction',
      'zh_Hans': '添加交易',
    },
    '9stmpsf0': {
      'en': 'Tap above to complete request',
      'zh_Hans': '点按上方以完成请求',
    },
    'gzhmf1t6': {
      'en': 'Please enter an amount',
      'zh_Hans': '请输入金额',
    },
    '7trcsuiu': {
      'en': 'Home',
      'zh_Hans': '家',
    },
  },
  // transaction_EDIT
  {
    's300dyxl': {
      'en': 'Edit Transaction',
      'zh_Hans': '編輯交易',
    },
    '5xgwlwjj': {
      'en': 'Amount',
      'zh_Hans': '数量',
    },
    '720k2d98': {
      'en': 'Spent At',
      'zh_Hans': '花费在',
    },
    'df1ingy2': {
      'en': 'Office Budget',
      'zh_Hans': '办公室预算',
    },
    '5kzmka3y': {
      'en': 'External Transfer',
      'zh_Hans': '外部转移',
    },
    'nvtz0bpd': {
      'en': 'ACH Payment',
      'zh_Hans': 'ACH付款',
    },
    'l3bqo3oh': {
      'en': 'Select Budget',
      'zh_Hans': '选择预算',
    },
    '0lw03w43': {
      'en': 'Reason',
      'zh_Hans': '原因',
    },
    '3eftlbxd': {
      'en': 'Update Transaction',
      'zh_Hans': '更新交易',
    },
    '4atjd0yh': {
      'en': 'Tap above to save your changes.',
      'zh_Hans': '点击上方即可保存您的更改。',
    },
    'pg18rcyu': {
      'en': 'Please enter an amount',
      'zh_Hans': '请输入金额',
    },
    '12if11ss': {
      'en': 'Home',
      'zh_Hans': '家',
    },
  },
  // editProfile
  {
    '4rzqov3y': {
      'en': 'Edit Profile',
      'zh_Hans': '編輯資料',
    },
    'zoxan2gi': {
      'en': 'Change Photo',
      'zh_Hans': '更改照片',
    },
    '3p9y21e2': {
      'en': 'Your Name',
      'zh_Hans': '您的名字',
    },
    'dw9gmjdc': {
      'en': 'Please enter a valid number...',
      'zh_Hans': '请输入有效的数字...',
    },
    'z4fstn5l': {
      'en': 'Email Address',
      'zh_Hans': '电子邮件',
    },
    'jozgvwyg': {
      'en': 'Your email',
      'zh_Hans': '您的电子邮件地址',
    },
    '8h1cjk5a': {
      'en': 'Your Age',
      'zh_Hans': '你的年龄',
    },
    '5v21r6gb': {
      'en': 'i.e. 34',
      'zh_Hans': '即 34',
    },
    'zvymbfia': {
      'en': 'Your Title',
      'zh_Hans': '你的头衔',
    },
    'i6edcl52': {
      'en': 'Save Changes',
      'zh_Hans': '保存更改',
    },
    '59naq8ur': {
      'en': 'Home',
      'zh_Hans': '家',
    },
  },
  // changePassword
  {
    'l5iggwaz': {
      'en': 'Change Password',
      'zh_Hans': '更改密码',
    },
    '2b97u8y5': {
      'en':
          'Enter the email associated with your account and we will send you link to reset your password.',
      'zh_Hans': '输入与您的帐户关联的电子邮件，我们将向您发送重置密码的链接。',
    },
    'ajy1c3r9': {
      'en': 'Email Address',
      'zh_Hans': '电子邮件',
    },
    'hsqfoxya': {
      'en': 'Enter your email...',
      'zh_Hans': '输入您的电子邮件...',
    },
    'if4pz6lm': {
      'en': 'Send Reset Link',
      'zh_Hans': '发送重置链接',
    },
    '5tvk9lv0': {
      'en': 'Home',
      'zh_Hans': '家',
    },
  },
  // notificationsSettings
  {
    'sc4ff4ce': {
      'en': 'Notifications',
      'zh_Hans': '通知',
    },
    'r72zvrv5': {
      'en':
          'Choose what notifcations you want to recieve below and we will update the settings.',
      'zh_Hans': '选择您想要接收的通知，我们将更新设置。',
    },
    'gjygkr0n': {
      'en': 'Push Notifications',
      'zh_Hans': '推送通知',
    },
    '3y3yhxbk': {
      'en':
          'Receive Push notifications from our application on a semi regular basis.',
      'zh_Hans': '定期从我们的应用程序接收推送通知。',
    },
    '1ytebj35': {
      'en': 'Email Notifications',
      'zh_Hans': '电子邮件通知',
    },
    '9lvh5nst': {
      'en':
          'Receive email notifications from our marketing team about new features.',
      'zh_Hans': '接收我们的营销团队发送的有关新功能的电子邮件通知。',
    },
    '69d2j74u': {
      'en': 'Location Services',
      'zh_Hans': '定位服务',
    },
    '3k8cuv0d': {
      'en':
          'Allow us to track your location, this helps keep track of spending and keeps you safe.',
      'zh_Hans': '允许我们追踪您的位置，这有助于追踪您的消费并确保您的安全。',
    },
    'isgrgbfs': {
      'en': 'Save Changes',
      'zh_Hans': '保存更改',
    },
    'a96mlyeh': {
      'en': 'Home',
      'zh_Hans': '家',
    },
  },
  // privacyPolicy
  {
    'alczfiiy': {
      'en': 'Privacy Policy',
      'zh_Hans': '隐私政策',
    },
    'fvsfg5on': {
      'en': 'How we use your data',
      'zh_Hans': '我们如何使用您的数据',
    },
    'nbiyrnzl': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. Non consectetur a erat nam. Donec ultrices tincidunt arcu non sodales. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis at erat pellentesque adipiscing. Mauris nunc congue nisi vitae. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla.\n\nEuismod lacinia at quis risus sed vulputate odio. Velit dignissim sodales ut eu sem integer vitae justo eget. Risus feugiat in ante metus. Leo vel orci porta non pulvinar neque laoreet suspendisse interdum. Suscipit tellus mauris a diam maecenas sed enim ut sem. Sem integer vitae justo eget magna fermentum iaculis eu. Lacinia at quis risus sed. Faucibus purus in massa tempor. Leo a diam sollicitudin tempor id eu. Nisi scelerisque eu ultrices vitae auctor. Vulputate dignissim suspendisse in est ante in. Enim neque volutpat ac tincidunt vitae semper quis. Ipsum dolor sit amet consectetur adipiscing elit.\n\nEt malesuada fames ac turpis egestas maecenas pharetra convallis. Sed sed risus pretium quam vulputate. Elit pellentesque habitant morbi tristique senectus et. Viverra maecenas accumsan lacus vel facilisis volutpat est. Sit amet mattis vulputate enim nulla. Nisi lacus sed viverra tellus in hac habitasse. Sit amet risus nullam eget felis eget nunc lobortis. Pretium lectus quam id leo in vitae. Adipiscing diam donec adipiscing tristique. Commodo sed egestas egestas fringilla. Ipsum dolor sit amet consectetur adipiscing. Ipsum dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Montes nascetur ridiculus mus mauris. Ut etiam sit amet nisl purus in. Arcu ac tortor dignissim convallis aenean et tortor at. Ornare suspendisse sed nisi lacus sed viverra.',
      'zh_Hans':
          'Lorem ipsum dolor sat amet，consectetur adipiscing elit，sed do eiusmod tempor incididunt ut Labore et dolore magna aliqua。 Accumsan 坐在 amet nulla facilisi morbi tempus。 Non consectetur aerat nam。 Donec ultrices Tincidunt arcu non sodales。 Velit sed ullamcorper morbi tincidunt。 Molestie a iaculis aterat pellentesque adipiscing。 Mauris nunc congue nisi vitae。 Nisl Tincidunt eget nullam non nisi。 Faucibus nisl Tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla。\n\nEuismod lacinia at quis risus sed vulputate odio。 Velit dignissim sodales ut eu sem 整数生命 justo eget。 Risus feugiat 在 ante metus 中。 Leo vel orci porta non pulvinar neque laoreet suspendisse interdum。 Suscipit Tellus Mauris a diam maecenas sed enim ut sem。 Sem 完整的生命只是 eget magna 发酵 iaculis eu。 Lacinia 位于 quis risus sed。 Faucibus purus in Massa tempor。狮子座在欧盟的时间是短暂的。 Nisi celerisque eu ultrices vitae auctor。 Vulputate dignissim suspendisse in est ante in. Enim neque volutpat actincidunt vitae semper quis。 Ipsum dolor 坐在 amet consectetur adipiscing elit。\n\nEtmalesuada 名声 ac turpis egestas maecenas pharetra convallis。 Sed sed risus pretium quam vulputate。 Elit pellentesque 栖息地 morbi tristique senectus et. Viverra maecenas accumsan lacus vel facilisis volutpat est. Sit amet mattis vulputate enim nulla。 Nisi lacus sed viverra Tellus in hachabitasse。坐 amet risus nullam eget felis eget nunc lobortis。 Pretium lectus quam id leo 的简历。 Adipiscing diam donec adipiscing tristique。 Commodo sed egestas egestas fringilla。 Ipsum dolor 坐 amet consectetur adipiscing。 Ipsum dolor sat amet consectetur adipiscing elit pellentesque 居民莫比。 Montes nascetur rodiculus mus mauris。 Ut etiam 坐 amet nisl purus in。Arcu ac tortor dignissim convallis aenean et totor at。 Ornare suspendisse sed nisi lacus sed viverra。',
    },
    'oks4x95o': {
      'en': 'Home',
      'zh_Hans': '家',
    },
  },
  // homePage_alt
  {
    'xdh0z8qh': {
      'en': 'Welcome,',
      'zh_Hans': '欢迎，',
    },
    'v74pa882': {
      'en': 'Andrew',
      'zh_Hans': '安德鲁',
    },
    'rzpg3cvh': {
      'en': 'Your latest updates are below.',
      'zh_Hans': '您的最新更新如下。',
    },
    'flto6ti8': {
      'en': 'Total Balance',
      'zh_Hans': '总余额',
    },
    'g07h0azf': {
      'en': '\$25,281',
      'zh_Hans': '\$25,281',
    },
    'v9ghmn0y': {
      'en': 'Total Balance',
      'zh_Hans': '总余额',
    },
    '7vf40ybo': {
      'en': '\$25,281',
      'zh_Hans': '\$25,281',
    },
    'k4scs2cu': {
      'en': 'Total Balance',
      'zh_Hans': '总余额',
    },
    'cvrbfozm': {
      'en': '\$25,281',
      'zh_Hans': '\$25,281',
    },
    'a33ldz0h': {
      'en': 'Next Payroll',
      'zh_Hans': '下一个工资单',
    },
    '3dgzzz79': {
      'en': '\$25,281',
      'zh_Hans': '\$25,281',
    },
    'hp28r17l': {
      'en': 'Debit Date',
      'zh_Hans': '付款日期',
    },
    'k04gl6sz': {
      'en': 'Aug 31, 2021',
      'zh_Hans': '2021 年 8 月 31 日',
    },
    'd5tcdo3w': {
      'en': '4 days left',
      'zh_Hans': '还剩 4 天',
    },
    '8wofym4i': {
      'en': '1 New Alert',
      'zh_Hans': '1 个新警报',
    },
    'kaq4nzj6': {
      'en': 'Fraud Alert',
      'zh_Hans': '欺诈警报',
    },
    '7zcrtqx6': {
      'en':
          'We noticed a small charge that is out of character of this account, please review.',
      'zh_Hans': '我们注意到有一笔与该帐户不符的小额费用，请审核。',
    },
    '23yxoc9m': {
      'en': 'View Now',
      'zh_Hans': '立即查看',
    },
    'a86mwddx': {
      'en': 'Marketing Budget',
      'zh_Hans': '营销预算',
    },
    '6c2o39hz': {
      'en': '\$3,000',
      'zh_Hans': '3,000 美元',
    },
    '5subrra4': {
      'en': 'Total Spent',
      'zh_Hans': '总花费',
    },
    '0wtm2m51': {
      'en': '\$2,502',
      'zh_Hans': '\$2,502',
    },
    'bp9d56pc': {
      'en': '4 days left',
      'zh_Hans': '还剩 4 天',
    },
    'b8oj0pck': {
      'en': 'Team Name',
      'zh_Hans': '团队名称',
    },
    '87ospwsq': {
      'en': '\$5,000',
      'zh_Hans': '5,000 美元',
    },
    'jzfejglt': {
      'en': 'Head of Design',
      'zh_Hans': '设计主管',
    },
    'zm0lhm2a': {
      'en': '[Time Stamp]',
      'zh_Hans': '[时间戳]',
    },
    '8hu2v2im': {
      'en': '•',
      'zh_Hans': '•',
    },
  },
  // homePage_alt_1
  {
    '51kawpgz': {
      'en': 'Welcome,',
      'zh_Hans': '欢迎，',
    },
    'izgc0c6r': {
      'en': 'Andrew',
      'zh_Hans': '安德鲁',
    },
    '30kx6e5v': {
      'en': 'Your latest updates are below.',
      'zh_Hans': '您的最新更新如下。',
    },
    'wknu2tm4': {
      'en': 'Balance',
      'zh_Hans': '平衡',
    },
    'syy689nt': {
      'en': '\$7,630',
      'zh_Hans': '\$7,630',
    },
    'hhyb9x4x': {
      'en': '**** 0149',
      'zh_Hans': '**** 0149',
    },
    'kg2tmby7': {
      'en': '05/25',
      'zh_Hans': '05/25',
    },
    'y7zomzzp': {
      'en': 'Quick Service',
      'zh_Hans': '快速服务',
    },
    'rfozud9v': {
      'en': 'Transfer',
      'zh_Hans': '转移',
    },
    'pcrarg0a': {
      'en': 'Activity',
      'zh_Hans': '活动',
    },
    'zmjsfzgg': {
      'en': 'My Bank',
      'zh_Hans': '我的银行',
    },
    'dfjtbkbo': {
      'en': 'Transaction',
      'zh_Hans': '交易',
    },
    'g7t9krj7': {
      'en': 'Go Far Rewards',
      'zh_Hans': '远行奖励',
    },
    'vupu5y5p': {
      'en': 'Income',
      'zh_Hans': '收入',
    },
    'bj5qnrj5': {
      'en': '\$50.00',
      'zh_Hans': '50.00 美元',
    },
    'd1n5mbq7': {
      'en': 'Hello World',
      'zh_Hans': '你好世界',
    },
    '2thn73jc': {
      'en': 'Go Far Rewards',
      'zh_Hans': '远行奖励',
    },
    '1fjdiibo': {
      'en': 'Income',
      'zh_Hans': '收入',
    },
    'ld7s2fpn': {
      'en': '\$50.00',
      'zh_Hans': '50.00 美元',
    },
    'ft8bu1we': {
      'en': 'Hello World',
      'zh_Hans': '你好世界',
    },
    '8t6ddwco': {
      'en': 'Go Far Rewards',
      'zh_Hans': '远行奖励',
    },
    'td15kjsa': {
      'en': 'Income',
      'zh_Hans': '收入',
    },
    'qmjqp9a6': {
      'en': '\$50.00',
      'zh_Hans': '50.00 美元',
    },
    '9qc797et': {
      'en': 'Hello World',
      'zh_Hans': '你好世界',
    },
    '8pdmehj2': {
      'en': 'Go Far Rewards',
      'zh_Hans': '远行奖励',
    },
    'krrhjgc4': {
      'en': 'Income',
      'zh_Hans': '收入',
    },
    '53m2u0s2': {
      'en': '\$50.00',
      'zh_Hans': '50.00 美元',
    },
    'aks5zz4f': {
      'en': 'Hello World',
      'zh_Hans': '你好世界',
    },
    'f3hxl69y': {
      'en': 'Home',
      'zh_Hans': '家',
    },
  },
  // profilepage
  {
    'fgf8icmv': {
      'en': 'Lessons',
      'zh_Hans': '23,000美元',
    },
    'fdh9awxz': {
      'en': 'Complete each of the programs below to earn \n1000 XP!',
      'zh_Hans': '',
    },
    'vewa5op5': {
      'en': 'Mental Wellbeing',
      'zh_Hans': '比特币',
    },
    '9oun2uok': {
      'en': 'Enhance coping skills for \nmanaging stress and anxiety',
      'zh_Hans': '\$7,302',
    },
    '7hsm7t9z': {
      'en': ' ',
      'zh_Hans': '',
    },
    'opob20j8': {
      'en': 'Nutrition',
      'zh_Hans': '索罗纳',
    },
    'fi3cleyj': {
      'en': 'Maintain healthy eating and \nsleeping habits\n',
      'zh_Hans': '\$7,302',
    },
    'qx0ykpbm': {
      'en': ' ',
      'zh_Hans': '',
    },
    'l2io5lul': {
      'en': 'Physical Health',
      'zh_Hans': '狗狗币',
    },
    'krsyyttw': {
      'en': 'Incorporate physical activity \ninto daily routines ',
      'zh_Hans': '\$7,302',
    },
    '6cm4jjje': {
      'en': ' ',
      'zh_Hans': '',
    },
    'vox9t1s0': {
      'en': 'Programs',
      'zh_Hans': '家',
    },
  },
  // Dashboard5
  {
    'adfbcdjy': {
      'en': 'Current Leaderboards',
      'zh_Hans': '',
    },
    'a6urvwho': {
      'en': 'Compete with your Buddies\nand Climb the Leaderboards!',
      'zh_Hans': '',
    },
    '0bgvg7p8': {
      'en': '16/26',
      'zh_Hans': '',
    },
    'ljft1qg2': {
      'en': 'Route progress',
      'zh_Hans': '',
    },
    'phjtnt70': {
      'en': '10',
      'zh_Hans': '',
    },
    '9vkgiwbs': {
      'en': 'Quests to be completed',
      'zh_Hans': '',
    },
    'w0sjisdd': {
      'en': 'Current Quests',
      'zh_Hans': '',
    },
    'um3g8w46': {
      'en': 'Earn points and get Prizes!',
      'zh_Hans': '',
    },
    'ayrn3kok': {
      'en': 'Read A Book',
      'zh_Hans': '',
    },
    '887b3h1c': {
      'en':
          'Choose something light or comforting rather than a suspenseful thriller.',
      'zh_Hans': '',
    },
    '71jmzjwl': {
      'en': 'Due:',
      'zh_Hans': '',
    },
    'e1ooowct': {
      'en': 'Today, 10:00pm',
      'zh_Hans': '',
    },
    'w7ml0wcc': {
      'en': 'Update',
      'zh_Hans': '',
    },
    'l2yq1w2v': {
      'en': '1',
      'zh_Hans': '',
    },
    'gjn3ooav': {
      'en': 'Journaling',
      'zh_Hans': '',
    },
    'mkqsswqm': {
      'en':
          'Reflect on your day, write down any worries, or jot down things you’re grateful for to clear your mind.',
      'zh_Hans': '',
    },
    '6u635k2l': {
      'en': 'Due:',
      'zh_Hans': '',
    },
    'if2wi868': {
      'en': 'Today, 10:00pm',
      'zh_Hans': '',
    },
    '2pi3tcy5': {
      'en': 'Update',
      'zh_Hans': '',
    },
    'kt27bd9u': {
      'en': '1',
      'zh_Hans': '',
    },
    'nq2edlff': {
      'en': 'Recent Activities',
      'zh_Hans': '',
    },
    'se92dzmo': {
      'en': 'Below is an overview of challenges & activity completed.',
      'zh_Hans': '',
    },
    '4jua0hyt': {
      'en': 'Challenges',
      'zh_Hans': '',
    },
    '2dlsg4k0': {
      'en': 'Completed',
      'zh_Hans': '',
    },
    'e27pr09w': {
      'en': 'Launches',
      'zh_Hans': '',
    },
    'zc3n838c': {
      'en': '   Thu     Fri     Sat     Sun     Mon     Tue    Wed',
      'zh_Hans': '',
    },
    'nl6hxhgz': {
      'en': 'Avg. Grade',
      'zh_Hans': '',
    },
    'qmtjh3j3': {
      'en': 'Dashboard',
      'zh_Hans': '',
    },
    'ddrjk6ch': {
      'en': 'Dashboard',
      'zh_Hans': '',
    },
  },
  // dashboar
  {
    '2yy5zc9l': {
      'en': 'Parvez Kurniawan',
      'zh_Hans': '',
    },
    'slm4p4xd': {
      'en': 'Good morning Parvez!',
      'zh_Hans': '',
    },
    'edy26xt9': {
      'en': 'Find your task...',
      'zh_Hans': '',
    },
    '3pq7bsmr': {
      'en': 'My Programs',
      'zh_Hans': '',
    },
    'y4zvdyfl': {
      'en': 'Mental Wellbeing',
      'zh_Hans': '',
    },
    'z02b19bs': {
      'en': '12 Projects',
      'zh_Hans': '',
    },
    'xljtz7fk': {
      'en': '30%',
      'zh_Hans': '',
    },
    'onkkm480': {
      'en': 'Nutrition',
      'zh_Hans': '',
    },
    '51q4pzi6': {
      'en': '12 Projects',
      'zh_Hans': '',
    },
    'yzd9q46d': {
      'en': '40%',
      'zh_Hans': '',
    },
    'm26z3n92': {
      'en': 'My Quests',
      'zh_Hans': '',
    },
    'cvgue7ms': {
      'en': '33%',
      'zh_Hans': '',
    },
    'munzzngj': {
      'en': 'Today',
      'zh_Hans': '',
    },
    '8huvx0dy': {
      'en': 'Read a Book',
      'zh_Hans': '',
    },
    'ax9m8hic': {
      'en': 'Due',
      'zh_Hans': '',
    },
    'p9iv7mgo': {
      'en': 'Today, 10:00 p.m.',
      'zh_Hans': '',
    },
    'b3l66phs': {
      'en': 'In Progress',
      'zh_Hans': '',
    },
    '7uyidnex': {
      'en': 'Journal',
      'zh_Hans': '',
    },
    '7b7nl5wo': {
      'en': 'Due',
      'zh_Hans': '',
    },
    'yfauzvpp': {
      'en': 'Today, 10:00 p.m.',
      'zh_Hans': '',
    },
    'jezt30gq': {
      'en': 'In Progress',
      'zh_Hans': '',
    },
    'c4zbs6cn': {
      'en': 'Upcoming',
      'zh_Hans': '',
    },
    'a1841ci7': {
      'en': 'Stretching',
      'zh_Hans': '',
    },
    '0nyzre11': {
      'en': 'Due',
      'zh_Hans': '',
    },
    '9yivewok': {
      'en': 'Tomorrow, 9:00 p.m.',
      'zh_Hans': '',
    },
    'g7xqaofa': {
      'en': 'In Progress',
      'zh_Hans': '',
    },
    '4bso2q0q': {
      'en': 'Bedtime Yoga',
      'zh_Hans': '',
    },
    '8r7z3hkf': {
      'en': 'Due',
      'zh_Hans': '',
    },
    's4piw76s': {
      'en': 'Tomorrow, 9:00 p.m.',
      'zh_Hans': '',
    },
    'o6zkhscw': {
      'en': 'In Progress',
      'zh_Hans': '',
    },
    '0x8r96b0': {
      'en': 'Completed',
      'zh_Hans': '',
    },
    'piradg0p': {
      'en': 'Make a To-Do List',
      'zh_Hans': '',
    },
    '55eva01r': {
      'en': 'Completed',
      'zh_Hans': '',
    },
    'b0s0dv0v': {
      'en': 'Tuesday, 10:00am',
      'zh_Hans': '',
    },
    'n6q8ub11': {
      'en': 'Complete',
      'zh_Hans': '',
    },
    '22vee7jf': {
      'en': 'Set Out Clothes',
      'zh_Hans': '',
    },
    '3d5ci564': {
      'en': 'Completed',
      'zh_Hans': '',
    },
    '2uw65isr': {
      'en': 'Tuesday, 10:00am',
      'zh_Hans': '',
    },
    '22iz1qll': {
      'en': 'Complete',
      'zh_Hans': '',
    },
    'c563rqxl': {
      'en': 'Home',
      'zh_Hans': '',
    },
  },
  // Calendar1
  {
    'zsoh8rzv': {
      'en': 'Month',
      'zh_Hans': '',
    },
    'gnw5sqzy': {
      'en': 'Coming Up',
      'zh_Hans': '',
    },
    'xn8ykgmq': {
      'en': 'Dinner',
      'zh_Hans': '',
    },
    'q1q7lotr': {
      'en': '7:00pm',
      'zh_Hans': '',
    },
    'qf5j0kai': {
      'en': 'Wed, 03/08/2022',
      'zh_Hans': '',
    },
    '38ab5go3': {
      'en': 'Past Due',
      'zh_Hans': '',
    },
    'sascpfuc': {
      'en': 'Take a Light Jog',
      'zh_Hans': '',
    },
    'z5vggsgi': {
      'en': '2:20pm',
      'zh_Hans': '',
    },
    'jqzirt4r': {
      'en': 'Wed, 03/08/2022',
      'zh_Hans': '',
    },
    'n6876hg0': {
      'en': 'Week',
      'zh_Hans': '',
    },
    'xfy9j6tg': {
      'en': 'Coming Up',
      'zh_Hans': '',
    },
    'la5r7b3z': {
      'en': 'Doctors Check In',
      'zh_Hans': '',
    },
    '5qv3jnb7': {
      'en': '2:20pm',
      'zh_Hans': '',
    },
    'gmcnlk7i': {
      'en': 'Wed, 03/08/2022',
      'zh_Hans': '',
    },
    '6x7xww7i': {
      'en': 'Past Due',
      'zh_Hans': '',
    },
    '3d8qchw7': {
      'en': 'Check In',
      'zh_Hans': '',
    },
    '0qrvvwkr': {
      'en': '2:20pm',
      'zh_Hans': '',
    },
    'sntwf8t6': {
      'en': 'Wed, 03/08/2022',
      'zh_Hans': '',
    },
    'bws2onc5': {
      'en': 'Calendar',
      'zh_Hans': '',
    },
    'wbia3tbl': {
      'en': '1',
      'zh_Hans': '',
    },
    'r6kn3whv': {
      'en': 'Calendar',
      'zh_Hans': '',
    },
  },
  // Details43WorkoutSummary
  {
    'ulp5cmwu': {
      'en': 'Daily',
      'zh_Hans': '',
    },
    '63s2lbmq': {
      'en': 'Calories',
      'zh_Hans': '',
    },
    '6btelbjy': {
      'en': '1,592',
      'zh_Hans': '',
    },
    'tx7cqiqp': {
      'en': ' Kcl',
      'zh_Hans': '',
    },
    'x3nkp2yk': {
      'en': 'View Now',
      'zh_Hans': '',
    },
    'rh064dz6': {
      'en': 'Weight',
      'zh_Hans': '',
    },
    '3ubx148t': {
      'en': '63.5',
      'zh_Hans': '',
    },
    '6aynfy9m': {
      'en': ' Kg',
      'zh_Hans': '',
    },
    'uit7e9uk': {
      'en': 'View Now',
      'zh_Hans': '',
    },
    'l2wimqzi': {
      'en': 'Your Workouts',
      'zh_Hans': '',
    },
    'iw27fd21': {
      'en': 'Daily Warmup',
      'zh_Hans': '',
    },
    'gxd8awlb': {
      'en': '8 Mins',
      'zh_Hans': '',
    },
    'l6w65701': {
      'en': ' || ',
      'zh_Hans': '',
    },
    'pwz3aobn': {
      'en': '3 workouts',
      'zh_Hans': '',
    },
    'wucd90fx': {
      'en': 'Shoulder Session',
      'zh_Hans': '',
    },
    '98h129js': {
      'en': '12 Mins',
      'zh_Hans': '',
    },
    'dfrobfah': {
      'en': ' || ',
      'zh_Hans': '',
    },
    '7r0ak9ns': {
      'en': '3 workouts',
      'zh_Hans': '',
    },
    'vfdco712': {
      'en': 'Weekly',
      'zh_Hans': '',
    },
    '4huyxbfe': {
      'en': 'Calories',
      'zh_Hans': '',
    },
    'zurflze1': {
      'en': '7,520',
      'zh_Hans': '',
    },
    'pb54n3xh': {
      'en': ' Kcl',
      'zh_Hans': '',
    },
    'sdke4u63': {
      'en': 'View Now',
      'zh_Hans': '',
    },
    '2mf7mgyv': {
      'en': 'Workouts',
      'zh_Hans': '',
    },
    '96jr819p': {
      'en': '4',
      'zh_Hans': '',
    },
    'zw88zltd': {
      'en': ' /7',
      'zh_Hans': '',
    },
    'm84tmgui': {
      'en': 'View Now',
      'zh_Hans': '',
    },
    '2tubdvbz': {
      'en': 'Top Workouts',
      'zh_Hans': '',
    },
    'fid0smv3': {
      'en': 'Pushups',
      'zh_Hans': '',
    },
    '1cen6fqo': {
      'en': '225',
      'zh_Hans': '',
    },
    'hpc2bad6': {
      'en': '\n34% than last week',
      'zh_Hans': '',
    },
    'kyezshum': {
      'en': '37%',
      'zh_Hans': '',
    },
    'izno4azt': {
      'en': 'Pull Ups',
      'zh_Hans': '',
    },
    'yk3sqgid': {
      'en': '105',
      'zh_Hans': '',
    },
    'j65yd3bw': {
      'en': '\n12% than last week',
      'zh_Hans': '',
    },
    'bokqdyzg': {
      'en': '82%',
      'zh_Hans': '',
    },
    'ae63mi6e': {
      'en': 'Progress',
      'zh_Hans': '',
    },
    'e1t5hrvl': {
      'en': 'Home',
      'zh_Hans': '',
    },
  },
  // CALENDAR
  {
    'okdu6glx': {
      'en': 'Custom Calendar',
      'zh_Hans': '',
    },
    'qwyo7c7z': {
      'en': 'Integrated with Google Calendar and NTULearn',
      'zh_Hans': '',
    },
    '4kifyo8g': {
      'en': 'Upload Calendar Image',
      'zh_Hans': '',
    },
    'xnpkt9ar': {
      'en': 'Upload Image',
      'zh_Hans': '',
    },
    'et5l84xy': {
      'en': 'Analyze Image',
      'zh_Hans': '',
    },
    'n2u2795b': {
      'en': 'Analyze',
      'zh_Hans': '',
    },
    'xkelo5vh': {
      'en': 'Individual Schedule',
      'zh_Hans': '',
    },
    'me86ra6y': {
      'en': 'Notifications',
      'zh_Hans': '',
    },
    'c982ayvf': {
      'en': 'Generate Notifications',
      'zh_Hans': '',
    },
    'sbtam5fs': {
      'en': 'Calendar',
      'zh_Hans': '',
    },
  },
  // loginhealthai
  {
    '0b409ocf': {
      'en': 'Email Address',
      'zh_Hans': '',
    },
    '4pjtu9er': {
      'en': 'Enter your email...',
      'zh_Hans': '',
    },
    '9jdbbcq2': {
      'en': 'Home',
      'zh_Hans': '',
    },
  },
  // pauseCard
  {
    'dt7m486y': {
      'en': 'Pause Card',
      'zh_Hans': '暂停卡',
    },
    '6edae99k': {
      'en': 'Are you sure you want to pause your card?',
      'zh_Hans': '您确定要暂停您的卡吗？',
    },
    'omtrfcm5': {
      'en': 'Nevermind',
      'zh_Hans': '没关系',
    },
    'hw07mkb9': {
      'en': 'Yes, Pause',
      'zh_Hans': '是的，暂停',
    },
  },
  // Notification
  {
    'oh8pguph': {
      'en': 'Reminders and Alerts are On',
      'zh_Hans': '',
    },
    'j8qavfuz': {
      'en': 'Your events are scheduled and reminded every time',
      'zh_Hans': '',
    },
  },
  // Miscellaneous
  {
    'lzyb73wy': {
      'en': '',
      'zh_Hans': '',
    },
    'kx9cdks4': {
      'en': '',
      'zh_Hans': '',
    },
    'efvtwj7k': {
      'en': '',
      'zh_Hans': '',
    },
    'ec5hfa1e': {
      'en': '',
      'zh_Hans': '',
    },
    'q5ljwvfo': {
      'en': '',
      'zh_Hans': '',
    },
    'j4rmwb3h': {
      'en': '',
      'zh_Hans': '',
    },
    '6ah1b18f': {
      'en': '',
      'zh_Hans': '',
    },
    '2kos1hen': {
      'en': '',
      'zh_Hans': '',
    },
    '8frsagh4': {
      'en': '',
      'zh_Hans': '',
    },
    'm479gi0i': {
      'en': '',
      'zh_Hans': '',
    },
    't6dafz4s': {
      'en': '',
      'zh_Hans': '',
    },
    'oxycfcif': {
      'en': '',
      'zh_Hans': '',
    },
    'jgs5g8ol': {
      'en': '',
      'zh_Hans': '',
    },
    'aox3s4fb': {
      'en': '',
      'zh_Hans': '',
    },
    'l8hv5a7z': {
      'en': '',
      'zh_Hans': '',
    },
    '4pjwb70a': {
      'en': '',
      'zh_Hans': '',
    },
    '0xlokf4y': {
      'en': '',
      'zh_Hans': '',
    },
    '8twlwiwt': {
      'en': '',
      'zh_Hans': '',
    },
    'ogjoq0za': {
      'en': '',
      'zh_Hans': '',
    },
    '99x4hi4g': {
      'en': '',
      'zh_Hans': '',
    },
    'zohkvnuk': {
      'en': '',
      'zh_Hans': '',
    },
    'z9kg3ryu': {
      'en': '',
      'zh_Hans': '',
    },
    'v68dmezk': {
      'en': '',
      'zh_Hans': '',
    },
    'xfp9cm1h': {
      'en': '',
      'zh_Hans': '',
    },
    't4xzlq9q': {
      'en': '',
      'zh_Hans': '',
    },
    '513nj4m0': {
      'en': '',
      'zh_Hans': '',
    },
    'a1jxfgju': {
      'en': '',
      'zh_Hans': '',
    },
  },
].reduce((a, b) => a..addAll(b));
