// ignore_for_file: deprecated_member_use

import 'package:blood_bridge/src/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/app_defaults.dart';
import '../../../../constants/app_images.dart';
import '../../components/network_image.dart';


class VerifiedDialog extends StatelessWidget {
  const VerifiedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: AppDefaults.borderRadius),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppDefaults.padding * 3,
            horizontal: AppDefaults.padding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                child: const AspectRatio(
                  aspectRatio: 1 / 1,
                  child: NetworkImageWithLoader(
                    AppImages.verified,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: AppDefaults.padding),
              Text(
                'Verified!',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: AppDefaults.padding),
              const Text(
                'Hurrah!!  You have successfully\nverified the account.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppDefaults.padding),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.pop();
                  },
                      
                  child: const Text('Close'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
