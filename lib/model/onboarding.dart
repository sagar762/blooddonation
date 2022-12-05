

import 'package:blooddonation/bottomNavBar/donationrequest.dart';
import 'package:blooddonation/donorlist.dart';
import 'package:flutter/cupertino.dart';

import '../request/createrequest.dart';

class OnboardingContent {
  String image;
  String title;
  String description;
  
  OnboardingContent({required this.image,required this.description, required this.title});
}

List<OnboardingContent> contents = [
  OnboardingContent(image: 'assets/images/bro.png', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec elementum ligula id ligula.', title: 'Find Blood Donors'),
  OnboardingContent(image: 'assets/images/rafiki.png', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec elementum ligula id ligula.', title: 'Post A Blood Request'),
];

class HomeContent {
  String image;
  String name;
  final Widget route;

  HomeContent({required this.name, required this.image, required this.route});
}

List<HomeContent> details = [
  HomeContent(name: 'Donors List', image: 'assets/images/ion_search-outline.svg', route: DonorList() ),
  HomeContent(name: 'Request Blood', image: 'assets/images/si-glyph_blood-bag.svg', route: DontaionRequest()),
  HomeContent(name: 'My Request', image: 'assets/images/openmoji_blood-transfusion.svg', route: DontaionRequest())
];

class DropDownContent {
  String title;
  String? valueChoose ;
  final List<String> names;
  // List listItem = [
  //   'A+', 'A-', 'B+', 'B-', 'O+', 'AB+', 'AB-'
  // ];
  DropDownContent({required this.title,required this.valueChoose, required this.names});
}

List<DropDownContent> values =[
  DropDownContent(title: 'Blood Type',valueChoose: 'A+', names: ['A+', 'A-', 'B+', 'B-', 'O+', 'AB+', 'AB-']),
  DropDownContent(title: 'Location',valueChoose: 'Kathmandu', names: ['Kathmandu', 'Pokhara', 'Bhaktapur', 'Lalitpur']),
  DropDownContent(title:'Blood Bank',valueChoose: 'A+', names: ['A+', 'A-', 'B+', 'B-', 'O+', 'AB+', 'AB-']),
  DropDownContent(title:'Donors',valueChoose: 'Sagar', names: ['Sagar', 'Ram', 'Nirmal', 'Sita'])
];

class DonorDetails {
  String image1;
  String? name;
  String? location;
  String image2;

  DonorDetails({required this.image1, required this.image2});


}
List<DonorDetails> donors = [
  DonorDetails(image1: 'assets/images/Rectangle 24.png', image2: 'assets/images/Blood Group.png'),
  DonorDetails(image1: 'assets/images/Rectangle 24 (1).png', image2: 'assets/images/Blood Group.png'),
  DonorDetails(image1: 'assets/images/Rectangle 24 (2).png', image2: 'assets/images/Blood Group.png'),
  DonorDetails(image1: 'assets/images/Rectangle 24 (3).png', image2: 'assets/images/Blood Group.png'),
  DonorDetails(image1: 'assets/images/Rectangle 24 (2).png', image2: 'assets/images/Blood Group.png'),
  DonorDetails(image1: 'assets/images/Rectangle 24 (1).png', image2: 'assets/images/Blood Group.png'),

];

class ProfileButton {
  String image;
  String title;
  Color color;
  ProfileButton({required this.image, required this.title, required this.color});
}

List<ProfileButton> person = [
  ProfileButton(image:'assets/images/Group.svg' , title: 'Call Now', color: Color(0xFF0689593)),
  ProfileButton(image:'assets/images/Vector (2).svg' , title: 'Request', color: Color(0xFFE22030)),
  
];

class ProfileDetails{
  String image;
  String number;
  String text;
  
  ProfileDetails({required this.image, required this.number, required this.text});
}

List<ProfileDetails> detail = [
  ProfileDetails(image: 'assets/images/Group 32.svg', number: 'A+', text: 'Blood Group'),
  ProfileDetails(image: 'assets/images/Vector (3).svg', number: '05', text: 'Donated'),
  ProfileDetails(image: 'assets/images/Vector (2).svg', number: '02', text: 'Requested'),
];

class Profileextra{
  String image;
  String title;
  Icon? icon1;

  Profileextra({required this.image, required this.title});
}

List<Profileextra> extras = [
  // Profileextra(image: 'assets/images/carbon_event-schedule.svg', title: 'Available for donation'),
  Profileextra(image: 'assets/images/bpmn_start-event-message.svg', title: 'Invite a friend'),
  Profileextra(image: 'assets/images/clarity_help-info-line.svg', title: 'Get help'),
  Profileextra(image: 'assets/images/la_sign-out-alt.svg', title: 'Sign out'),

];

