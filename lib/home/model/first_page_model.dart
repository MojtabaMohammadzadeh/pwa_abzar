






import 'all_brand_categories.dart';
import 'all_brands.dart';
import 'last_price.dart';
import 'slider.dart';

class FirstPageModel {
  FirstPageModel({
    required this.success,
    required this.error,
    required this.error_code,
    required this.msg,
    required this.suggestion,
    required this.base_url_site,
    required this.version_app,
    required this.link_app,
    required this.institute_tell,
    required this.address_contact,
    required this.email_contact,
    required this.about_us,
    required this.instagram,
    required this.telegram,
    required this.google_plus,
    required this.tweeter,
    required this.whatsapp,
    required this.new_version_text,
    required this.msg_share_reagent,
    required this.law,
    required this.status_device_id,
    required this.user_phone,
    required this.is_active,
    required this.message_count,
    required this.sms_code,
    required this.max_upload_img_places,
    required this.sliders1,
    required this.sliders2,
    required this.mostViewedBrands,
    required this.newBrands,
    required this.allBrandCategories,
    required this.lastPrices,
    required this.allBrands,
    required this.today_date,});

  factory FirstPageModel.fromJson(dynamic json) {
    List<dynamic>suggestion = [];
    if (json['suggestion'] != null) {
      json['suggestion'].forEach((v) {
        suggestion.add(AllBrands.fromJson(v));
      });
    }
    List<Sliders1> sliders1 = [];
    if (json['sliders1'] != null) {

      json['sliders1'].forEach((v) {
        sliders1.add(Sliders1.fromJson(v));
      });
    }
    List<Sliders1> sliders2 = [];
    if (json['sliders2'] != null) {
      json['sliders2'].forEach((v) {
        sliders2.add(Sliders1.fromJson(v));
      });
    }
    List<AllBrands> mostViewedBrands = [];
    if (json['mostViewedBrands'] != null) {

      json['mostViewedBrands'].forEach((v) {
        mostViewedBrands.add(AllBrands.fromJson(v));
      });
    }
    List<AllBrands> newBrands = [];
    if (json['newBrands'] != null) {
      json['newBrands'].forEach((v) {
        newBrands.add(AllBrands.fromJson(v));
      });
    }
    List<AllBrandCategories> allBrandCategories = [];
    if (json['allBrandCategories'] != null) {

      json['allBrandCategories'].forEach((v) {
        allBrandCategories.add(AllBrandCategories.fromJson(v));
      });
    }
    List<LastPrices> lastPrices = [];
    if (json['lastPrices'] != null) {

      json['lastPrices'].forEach((v) {
        lastPrices.add(LastPrices.fromJson(v));
      });
    }
    List<AllBrands> allBrands = [];
    if (json['allBrands'] != null) {

      json['allBrands'].forEach((v) {
        allBrands.add(AllBrands.fromJson(v));
      });
    }
    return FirstPageModel(
      success : json['success'],
      error : json['error'],
      error_code : json['error_code'],
      msg : json['msg'],
      suggestion : suggestion,
      base_url_site : json['base_url_site'],
      version_app : json['version_app'],
      link_app : json['link_app'],
      institute_tell : json['institute_tell'],
      address_contact : json['address_contact'],
      email_contact : json['email_contact'],
      about_us : json['about_us'],
      instagram : json['instagram'],
      telegram : json['telegram'],
      google_plus : json['google_plus'],
      tweeter : json['tweeter'],
      whatsapp : json['whatsapp'],
      new_version_text : json['new_version_text'],
      msg_share_reagent : json['msg_share_reagent'],
      law : json['law'],
      status_device_id : json['status_device_id'],
      user_phone : json['user_phone'],
      is_active : json['is_active'],
      message_count : json['message_count'],
      sms_code : json['sms_code'],
      max_upload_img_places : json['max_upload_img_places'],
      sliders1 :  sliders1,
      sliders2 : sliders2,
      mostViewedBrands : mostViewedBrands,
      newBrands : newBrands,
      allBrandCategories : allBrandCategories,
      lastPrices :lastPrices ,
      allBrands : allBrands,
      today_date : json['today_date'],
    );
  }
  int? success;
  int? error;
  int? error_code;
  String? msg;
  List<dynamic>? suggestion;
  String? base_url_site;
  String? version_app;
  String? link_app;
  String? institute_tell;
  String? address_contact;
  String? email_contact;
  String? about_us;
  String? instagram;
  String? telegram;
  String? google_plus;
  String? tweeter;
  String? whatsapp;
  String? new_version_text;
  String? msg_share_reagent;
  String? law;
  int? status_device_id;
  String? user_phone;
  int? is_active;
  int? message_count;
  String? sms_code;
  int? max_upload_img_places;
  List<Sliders1>? sliders1;
  List<Sliders1>? sliders2;
  List<AllBrands>? mostViewedBrands;
  List<AllBrands>? newBrands;
  List<AllBrandCategories>? allBrandCategories;
  List<LastPrices>? lastPrices;
  List<AllBrands>? allBrands;
  String? today_date;



}