import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/SimpleListDivider.dart';
import 'package:flutter_app/widgets/SimpleListTile.dart';

Dialog createAccountDialog(BuildContext context) {
  return Dialog(
    insetPadding: EdgeInsets.all(24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
          children: [
        ListTile(
            contentPadding: EdgeInsets.only(left: 4.0, right: 4.0),
            title: Transform.translate(
              offset: Offset(-16, 0),
              child: Text(
                "Yasin Cidem",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13.0),
              ),
            ),
            subtitle: Transform.translate(
              offset: Offset(-16, 0),
              child: Text(
                "yasincidem@gmail.com",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.0),
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.account_circle),
              iconSize: 32.0,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {},
            ),
            trailing: IconButton(
                icon: Icon(Icons.cloud_circle),
                iconSize: 32.0,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {})),
        Container(
            padding: EdgeInsets.only(top: 2.0, bottom: 12.0),
            child: Center(
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(32)),
                highlightColor: Colors.transparent,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 6.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(32))),
                  child: Text(
                    "Manage your Google Account",
                    maxLines: 1,
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 12.0,
                        letterSpacing: 0.2),
                  ),
                ),
                onTap: () {},
              ),
            )),
        SimpleListDivider(),
        SimpleListTile(
          title: "Add another account",
          icon: Icons.add_circle,
        ),
        SimpleListTile(
          title: "Manage accounts on this device",
          icon: Icons.supervisor_account_outlined,
        ),
        SimpleListTile(
          title: "Use without an account",
          icon: Icons.exit_to_app_rounded,
        ),
        SimpleListDivider(),
        SimpleListTile(
          title: "Podcasts settings",
          icon: Icons.settings_outlined,
        ),
        SimpleListTile(
          title: "Help",
          icon: Icons.help_outline,
        ),
        SimpleListTile(
          title: "Send app feedback",
          icon: Icons.feedback_outlined,
        ),
        SimpleListDivider(),
        ListTile(
          dense: true,
          contentPadding: EdgeInsets.zero,
          title: Center(
            child: Text(
              "Privacy Policy  •  Terms of Service",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13.0),
            ),
          ),
        )
      ]));
}
