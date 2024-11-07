import 'dart:async';

import 'package:cuan/blocs/auth/auth_bloc.dart';
import 'package:cuan/shared/helper.dart';
import 'package:cuan/shared/theme.dart';
import 'package:cuan/ui/pages/topup/topup_success_page.dart';
import 'package:cuan/ui/widgets/buttons.dart';
import 'package:cuan/ui/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewTopUpPage extends StatefulWidget {
  final String title;
  final String redirectUrl;
  const WebViewTopUpPage({super.key, required this.title, required this.redirectUrl});

  @override
  State<WebViewTopUpPage> createState() => _WebViewTopUpPageState();
}

class _WebViewTopUpPageState extends State<WebViewTopUpPage> {
  late final WebViewController wvController;
  bool isLoading = true;
  bool isPayment = false;

  @override
  void initState() {
    super.initState();
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthSuccess) {
      wvController = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {},
            onPageStarted: (String url) {},
            onPageFinished: (String url) {
              wvController.runJavaScript('''
                document.body.style.filter = 'invert(1) hue-rotate(180deg)';
                document.querySelectorAll('img').forEach((img) => img.style.filter = 'invert(1) hue-rotate(180deg)');
                var nameMerchant = document.querySelector('.merchant-name');
                var eleTest = document.querySelector('.test-notice');
                if (eleTest && nameMerchant && eleTest.parentNode && nameMerchant.parentNode ) {
                  eleTest.remove();
                  nameMerchant.innerText = 'Cuan';
                }
                var elements = document.querySelectorAll('p');
                elements.forEach(function(element) {
                  if (element.textContent.includes('Juara Koding')) {
                    element.innerText = element.innerText.replace('Juara Koding', 'Cuan');
                  }
                });
              ''');

              Timer(const Duration(seconds: 2), () {
                  setState(() {
                  isLoading = false;
                });
                });

              if (url.contains('success') && mounted) {
                setState(() {
                  isPayment = true;
                });
              }
            },
            onNavigationRequest: (NavigationRequest request) {
              if (request.url.contains('.ngrok.io')) {
                if (isPayment) {
                  showCustomSnackbar(context, 'Pembayaran Berhasil');
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TopupSuccessPage(
                                user: authState.data,
                              )),
                      (context) => false);
                  return NavigationDecision.prevent;
                } else {
                  showCustomSnackbar(context, 'Pembayaran Dibatalkan');
                  Navigator.pushNamedAndRemoveUntil(context, '/home', (context) => false);
                  return NavigationDecision.prevent;
                }
              }
              return NavigationDecision.navigate;
            },
          ),
        )
        ..loadRequest(Uri.parse(widget.redirectUrl));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: darkBackgroundColor,
        appBar: AppBar(
          title: Text(
            'Top Up : ${widget.title.replaceAll('_va', '').toUpperCase()}',
            style: whiteTextStyle.copyWith(fontSize: 16),
          ),
          elevation: 2,
          centerTitle: false,
          backgroundColor: darkBackgroundColor,
          bottom: PreferredSize(preferredSize: const Size(20, 30), child: Container()),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: whiteColor,
            ),
            onPressed: () {
              showDialog(context: context, builder: (context) => const WebViewTopUpDialog());
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0, top: 30),
              child: Image.asset(
                'assets/img_logo_dark.png',
                width: 100,
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
        body: (isLoading)
            ? Center(
                child: CircularProgressIndicator(
                  color: orangeColor,
                ),
              )
            : WebViewWidget(
                controller: wvController,
              ));
  }
}

class WebViewTopUpDialog extends StatelessWidget {
  const WebViewTopUpDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
        isDark: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/ic_wallet.png',
              width: 24,
              color: orangeColor,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Are you sure cancel your payment.",
              style: whiteTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            const Spacer(),
            CustomFilledButton(
              title: 'Cancel Payment',
              onTaps: () {
                showCustomSnackbar(context, 'Pembayaran Dibatalkan');
                Navigator.pushNamedAndRemoveUntil(context, '/home', (context) => false);
              },
            )
          ],
        ));
  }
}
