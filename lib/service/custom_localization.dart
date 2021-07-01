import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class CustomLocalizations {
  CustomLocalizations(this.locale);

  final Locale locale;

  static CustomLocalizations of(BuildContext context) {
    return Localizations.of<CustomLocalizations>(context, CustomLocalizations);
  }

  static Map<String, Map<String, String>> _resources = {
    /* 'en': {'title': 'Demo', 'message': 'Hello World'},
    'id': {'title': 'Simulasi', 'message': 'Halo Dunia'}, */
    'en': {
      'login': 'Login',
      'register': 'Register',
      'welcome_message1': 'Connect',
      'welcome_message2': 'With Everyone',
      'welcome_message3': 'Don’t forget to say Hello to people you love!',
      'login_page_message1': 'Welcome',
      'login_page_message2': 'Login to continue!',
      'forgotPasswordText': 'Forgot your password?',
      'dontHaveAccountText': "didn't have account yet?",
      'passwordText': 'Password',
      'confirmPasswordText': 'Confirm Password',
      'confirmPasswordMessage': 'Password does not match',
      'haveAccountText': 'already have an account?',
      'registerPageMessage1': 'Create Account',
      'registerPageMessage2': 'Register to get started!',
      'signUpMessage1': 'Create account success',
      'signUpMessage2': 'Please sign in',
      'newChatText': 'New Chat',
      'newGroupText': 'New Group',
      'newContactText': 'New Contact',
      'selectFromContactText': 'Select from contact',
      'addGroupParticipantsText': 'Add Group Participants',
      'typeContactNameText': 'Type Contact Name',
      'addText': 'Add',
      'todayText': 'Today',
      'yesterdayText': 'Yesterday',
      'messageHereText': 'Message here...',
      'settingsText': 'Settings',
      'profileText': 'Profile',
      'changePasswordText': 'Change password',
      'noText': 'No',
      'yesText': 'Yes',
      'passwordResetText': 'Password reset',
      'changeYourPasswordText': 'change your password?',
      'logoutText': 'Logout',
      'joinedSinceText': 'Joined since ',
      'contactInfoText': 'Contact info',
      'yournameText': 'Your Name',
      'aboutText': 'About',
      'saveText': 'Save',
    },
    'id': {
      'login': 'Masuk',
      'register': 'Daftar',
      'welcome_message1': 'Terhubung',
      'welcome_message2': 'Dengan Setiap Orang',
      'welcome_message3': 'Jangan lupa menyapa orang yang kamu sayangi!',
      'login_page_message1': 'Selamat datang',
      'login_page_message2': 'Masuk untuk melanjutkan!',
      'forgotPasswordText': 'Lupa password?',
      'dontHaveAccountText': "Belum memiliki akun?",
      'passwordText': 'Kata Sandi',
      'confirmPasswordText': 'Konfimasi Kata Sandi',
      'confirmPasswordMessage': 'Kata sandi tidak sesuai',
      'haveAccountText': 'Sudah memiliki akun?',
      'registerPageMessage1': 'Membuat Akun',
      'registerPageMessage2': 'Mendaftar untuk memulai!',
      'signUpMessage1': 'Berhasil membuat akun',
      'signUpMessage2': 'Silahkan masuk',
      'newChatText': 'Obrolan Baru',
      'newGroupText': 'Grup Baru',
      'newContactText': 'Kontak Baru',
      'selectFromContactText': 'Pilih kontak',
      'addGroupParticipantsText': 'Tambah Anggota Grup',
      'typeContactNameText': 'Tulis Nama Kontak',
      'addText': 'Tambah',
      'todayText': 'Hari ini',
      'yesterdayText': 'Kemarin',
      'messageHereText': 'Tulis pesan...',
      'settingsText': 'Pengaturan',
      'profileText': 'Profil',
      'changePasswordText': 'Ubah Password',
      'noText': 'Tidak',
      'yesText': 'Ya',
      'passwordResetText': 'Atur ulang password',
      'changeYourPasswordText': 'ubah password?',
      'logoutText': 'Keluar',
      'joinedSinceText': 'Bergabung sejak ',
      'contactInfoText': 'Info kontak',
      'yournameText': 'Nama anda',
      'aboutText': 'Tentang',
      'saveText': 'Simpan',
    },
  };

  String get login {
    return _resources[locale.languageCode]['login'];
  }

  String get register {
    return _resources[locale.languageCode]['register'];
  }

  String get welcomeMessage1 {
    return _resources[locale.languageCode]['welcome_message1'];
  }

  String get welcomeMessage2 {
    return _resources[locale.languageCode]['welcome_message2'];
  }

  String get welcomeMessage3 {
    return _resources[locale.languageCode]['welcome_message3'];
  }

  String get loginPageMessage1 {
    return _resources[locale.languageCode]['login_page_message1'];
  }

  String get loginPageMessage2 {
    return _resources[locale.languageCode]['login_page_message2'];
  }

  String get forgotPasswordText {
    return _resources[locale.languageCode]['forgotPasswordText'];
  }

  String get dontHaveAccountText {
    return _resources[locale.languageCode]['dontHaveAccountText'];
  }

  String get passwordText {
    return _resources[locale.languageCode]['passwordText'];
  }

  String get confirmPasswordText {
    return _resources[locale.languageCode]['confirmPasswordText'];
  }

  String get confirmPasswordMessage {
    return _resources[locale.languageCode]['confirmPasswordMessage'];
  }

  String get haveAccountText {
    return _resources[locale.languageCode]['haveAccountText'];
  }

  String get registerPageMessage1 {
    return _resources[locale.languageCode]['registerPageMessage1'];
  }

  String get registerPageMessage2 {
    return _resources[locale.languageCode]['registerPageMessage2'];
  }

  String get signUpMessage1 {
    return _resources[locale.languageCode]['signUpMessage1'];
  }

  String get signUpMessage2 {
    return _resources[locale.languageCode]['signUpMessage2'];
  }

  String get newChatText {
    return _resources[locale.languageCode]['newChatText'];
  }

  String get newGroupText {
    return _resources[locale.languageCode]['newGroupText'];
  }

  String get newContactText {
    return _resources[locale.languageCode]['newContactText'];
  }

  String get selectFromContactText {
    return _resources[locale.languageCode]['selectFromContactText'];
  }

  String get addGroupParticipantsText {
    return _resources[locale.languageCode]['addGroupParticipantsText'];
  }

  String get typeContactNameText {
    return _resources[locale.languageCode]['typeContactNameText'];
  }

  String get addText {
    return _resources[locale.languageCode]['addText'];
  }

  String get todayText {
    return _resources[locale.languageCode]['todayText'];
  }

  String get yesterdayText {
    return _resources[locale.languageCode]['yesterdayText'];
  }

  String get messageHereText {
    return _resources[locale.languageCode]['messageHereText'];
  }

  String get settingsText {
    return _resources[locale.languageCode]['settingsText'];
  }

  String get profileText {
    return _resources[locale.languageCode]['profileText'];
  }

  String get changePasswordText {
    return _resources[locale.languageCode]['changePasswordText'];
  }

  String get noText {
    return _resources[locale.languageCode]['noText'];
  }

  String get yesText {
    return _resources[locale.languageCode]['yesText'];
  }

  String get passwordResetText {
    return _resources[locale.languageCode]['passwordResetText'];
  }

  String get changeYourPasswordText {
    return _resources[locale.languageCode]['changeYourPasswordText'];
  }

  String get logoutText {
    return _resources[locale.languageCode]['logoutText'];
  }

  String get joinedSinceText {
    return _resources[locale.languageCode]['joinedSinceText'];
  }

  String get contactInfoText {
    return _resources[locale.languageCode]['contactInfoText'];
  }

  String get yourNameText {
    return _resources[locale.languageCode]['yournameText'];
  }

  String get aboutText {
    return _resources[locale.languageCode]['aboutText'];
  }

  String get saveText {
    return _resources[locale.languageCode]['saveText'];
  }
}

class CustomLocalizationsDelegate
    extends LocalizationsDelegate<CustomLocalizations> {
  const CustomLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => [
        'en',
        'id',
      ].contains(locale.languageCode);

  @override
  Future<CustomLocalizations> load(Locale locale) {
    return SynchronousFuture<CustomLocalizations>(CustomLocalizations(locale));
  }

  @override
  bool shouldReload(CustomLocalizationsDelegate old) => false;
}
