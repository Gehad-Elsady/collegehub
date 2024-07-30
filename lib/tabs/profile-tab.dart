import 'package:collegehub/providers/userprofile_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatefulWidget {
  ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController governorateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController universityController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String? userName;

  @override
  void initState() {
    super.initState();
    final userProvider =
        Provider.of<UserProfileProvider>(context, listen: false);
    userProvider.fetchCurrentUser().then((_) {
      userProvider.fetchUserData().then((_) {
        final user = userProvider.user;
        if (user != null) {
          userName = user.firstName;
        }
      });
    });
  }

  Future<void> _saveUserData() async {
    final userProvider =
        Provider.of<UserProfileProvider>(context, listen: false);
    try {
      await userProvider.saveUserData(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        governorate: governorateController.text,
        city: cityController.text,
        university: universityController.text,
        phone: phoneController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Data saved successfully!')));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProfileProvider>(context);
    final user = userProvider.user;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.2,
              backgroundImage: AssetImage(
                  "assets/images/yuji-itadori-in-action-blue-desktop-wallpaper.jpg"),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              userName ?? "User-name".tr(),
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: firstNameController,
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.abc,
                          size: 30,
                        ),
                        labelText: 'user-name-f'.tr(),
                        hintText: 'hint-text'.tr(),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: lastNameController,
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.abc,
                          size: 30,
                        ),
                        labelText: 'user-name-l'.tr(),
                        hintText: 'hint-text'.tr(),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'email'.tr(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'email-hint'.tr(),
                  suffixIcon: Icon(
                    Icons.mail,
                    size: 30,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: governorateController,
                      decoration: InputDecoration(
                        labelText: 'governorate'.tr(),
                        hintText: 'governorate-hint'.tr(),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: Icon(
                          Icons.location_on_outlined,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: cityController,
                      decoration: InputDecoration(
                        hintText: 'city-hint'.tr(),
                        labelText: 'city'.tr(),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: Icon(
                          Icons.location_city_outlined,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: universityController,
                decoration: InputDecoration(
                  labelText: 'uname'.tr(),
                  hintText: 'hint-text'.tr(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: ImageIcon(
                    AssetImage("assets/images/school.png"),
                    size: 10,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: phoneController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'phone'.tr(),
                  hintText: 'phon-hint'.tr(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: Icon(
                    Icons.phone_android_rounded,
                    size: 30,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      child: ElevatedButton(
                        onPressed: _saveUserData,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: Text(
                          'save'.tr(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      child: ElevatedButton(
                        onPressed: () {
                          if (user != null) {
                            userProvider.updateUserData(
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              governorate: governorateController.text,
                              city: cityController.text,
                              university: universityController.text,
                              phone: phoneController.text,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Data updated successfully!')));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: Text(
                          'update'.tr(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
