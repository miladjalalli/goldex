import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goldex/app_localizations.dart';
import 'package:goldex/theme/theme.dart';
import 'package:goldex/widget/custom_button.dart';
import '../assets.dart';
import 'cubit/profile_cubit.dart';
import 'edit_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              decoration: BoxDecoration(
                color: colorGreenBack,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(Asset.support),
                  SizedBox(width: 8),
                  Text(context.translate('support'),
                    style: TextStyle(fontSize: 16, color: colorGreen),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                Asset.person,
                fit: BoxFit.cover,
                height: 78,
                width: 78,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Scott Williams', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: colorLightGreyModal)),
                Text(context.translate('notVerified'), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: colorRedLight)),
                Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 24.0),
                  child: CustomButton(
                    text: context.translate('editProfile'),
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                    height: 50,
                    width: 143,
                    borderColor: Colors.black,
                    borderRadius: BorderRadius.circular(25),
                    textStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                      MaterialPageRoute(builder: (context) => BlocProvider(
                        create: (context) => ProfileCubit(),
                        child: EditProfileScreen(),
                      )),
                      );
                    },
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(15, 24, 0, 11),
                    child: Row(
                      children: [
                        Text(context.translate('goldexEntryGifts'), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: colorLightGreyModal)),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                              child: ListTile(
                                leading: SvgPicture.asset(Asset.gift, width: 17, height: 17),
                                title: Text(
                                  context.translate('getFreeGift'),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24, right: 24),
                          child: const Divider(height: 1, color: colorLightGreyModal4),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                  // MaterialPageRoute(builder: (context) => BlocProvider(
                                  //   create: (context) => GiftCardCubit(),
                                  //   child: GiftCardScreen(),
                                  // )),
                                // );
                              },
                              child: ListTile(
                                leading: SvgPicture.asset(
                                  Asset.invite,
                                  width: 17,
                                  height: 17,
                                ),
                                title: Text(
                                  context.translate('inviteFriend'),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(15, 18, 0, 11),
                    child: Row(
                      children: [
                        Text(context.translate('settings'), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: colorLightGreyModal)),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                              child: ListTile(
                                leading: SvgPicture.asset(Asset.lock, width: 17, height: 17),
                                title: Text(
                                  context.translate('security'),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24, right: 24),
                          child: const Divider(height: 1, color: colorLightGreyModal4),
                        ),
                        ClipRRect(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                // MaterialPageRoute(builder: (context) => BlocProvider(
                                //   create: (context) => GiftCardCubit(),
                                //   child: GiftCardScreen(),
                                // )),
                                // );
                              },
                              child: ListTile(
                                leading: SvgPicture.asset(
                                  Asset.hideProfile,
                                  width: 17,
                                  height: 17,
                                ),
                                title: Text(
                                  context.translate('appearances'),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24, right: 24),
                          child: const Divider(height: 1, color: colorLightGreyModal4),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                // MaterialPageRoute(builder: (context) => BlocProvider(
                                //   create: (context) => GiftCardCubit(),
                                //   child: GiftCardScreen(),
                                // )),
                                // );
                              },
                              child: ListTile(
                                leading: SvgPicture.asset(
                                  Asset.info,
                                  width: 17,
                                  height: 17,
                                ),
                                title: Text(
                                  context.translate('aboutGoldex'),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: CustomButton(
                      text: context.translate('logout'),
                      isIconEnabled: true,
                      icon: Asset.logOut,
                      backgroundColor: colorRedBack,
                      textColor: colorRed,
                      height: 50,
                      width: 229,
                      borderColor: colorRed,
                      borderRadius: BorderRadius.circular(25),
                      textStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      onPressed: () {
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 150,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}









