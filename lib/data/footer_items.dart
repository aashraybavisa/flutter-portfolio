import 'package:portfolio_app/models/footer_item.dart';
import 'package:portfolio_app/utils/constants.dart';

const List<FooterItem> footerItems = [
  FooterItem(
    iconPath: 'assets/phone.png',
    title: 'PHONE',
    text1: phone1,
    text2: '',
    link: phoneLink,
  ),
  FooterItem(
    iconPath: 'assets/email.png',
    title: 'EMAIL',
    text1: email1,
    text2: '',
    link: emailLink,
  ),
  // FooterItem(
  //   iconPath: 'assets/linkedin.png',
  //   title: 'LINKEDIN',
  //   text1: linkedIn,
  //   text2: '',
  //   link: linkedinLink,
  // ),
  FooterItem(
    iconPath: 'assets/github.png',
    title: 'GITHUB',
    text1: github,
    text2: '',
    link: githubLink,
  ),
  FooterItem(
    iconPath: 'assets/whatsapp.png',
    title: 'WhatsApp',
    text1: phone1,
    text2: '',
    link: whatsappLink,
  )
];
