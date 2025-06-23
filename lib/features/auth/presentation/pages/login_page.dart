import 'package:flutter/material.dart';
import 'package:winnipos/shared/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Simulate login process
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _isLoading = false;
      });

      // Navigate to /home after successful login
      Navigator.of(context).pushReplacementNamed('/home');
    }
  }

  void _handleForgotPassword() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Forgot Password', style: h4TextStyle),
        content: Text(
          'Please contact your system administrator to reset your password.',
          style: bodyMediumTextStyle,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK', style: greenTextStyle.copyWith(fontWeight: semiBold)),
          ),
        ],
      ),
    );
  }

  void _handleCreateAccount() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Create Account', style: h4TextStyle),
        content: Text(
          'Please contact your system administrator to create a new account.',
          style: bodyMediumTextStyle,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK', style: greenTextStyle.copyWith(fontWeight: semiBold)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.xl),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.xl),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Logo Section
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            color: lightGreenColor,
                            borderRadius: BorderRadius.circular(AppRadius.xxl),
                            border: Border.all(color: greenColor, width: 2),
                          ),
                          child: Icon(
                            Icons.point_of_sale_rounded,
                            size: 60,
                            color: greenColor,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.lg),

                        // Welcome Text
                        Text(
                          'Welcome Back',
                          style: h2TextStyle,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        Text(
                          'Sign in to your POS account',
                          style: bodyMediumTextStyle.copyWith(color: greyColor),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: AppSpacing.xl),

                        // Email Field
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: labelTextStyle,
                            prefixIcon: Icon(Icons.email_outlined, color: greyColor),
                            hintText: 'Enter your email',
                            hintStyle: bodyMediumTextStyle.copyWith(color: greyColor),
                          ),
                          style: bodyMediumTextStyle,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: AppSpacing.md),

                        // Password Field
                        TextFormField(
                          controller: _passwordController,
                          obscureText: !_isPasswordVisible,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: labelTextStyle,
                            prefixIcon: Icon(Icons.lock_outline, color: greyColor),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                                color: greyColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                            hintText: 'Enter your password',
                            hintStyle: bodyMediumTextStyle.copyWith(color: greyColor),
                          ),
                          style: bodyMediumTextStyle,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                          onFieldSubmitted: (_) => _handleLogin(),
                        ),
                        const SizedBox(height: AppSpacing.md),

                        // Forgot Password
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: _handleForgotPassword,
                            child: Text(
                              'Forgot Password?',
                              style: greenTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: AppSpacing.lg),

                        // Login Button
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: _isLoading ? null : _handleLogin,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: greenColor,
                              foregroundColor: whiteColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(AppRadius.md),
                              ),
                              elevation: 2,
                            ),
                            child: _isLoading
                                ? SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(whiteColor),
                                    ),
                                  )
                                : Text(
                                    'Sign In',
                                    style: buttonTextStyle,
                                  ),
                          ),
                        ),
                        const SizedBox(height: AppSpacing.lg),

                        // Divider
                        Row(
                          children: [
                            Expanded(child: Divider(color: borderColor)),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                              child: Text(
                                'OR',
                                style: captionTextStyle.copyWith(
                                  fontWeight: medium,
                                  color: greyColor,
                                ),
                              ),
                            ),
                            Expanded(child: Divider(color: borderColor)),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.lg),

                        // Create Account Button
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: OutlinedButton(
                            onPressed: _handleCreateAccount,
                            style: OutlinedButton.styleFrom(
                              foregroundColor: greenColor,
                              side: BorderSide(color: greenColor, width: 1.5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(AppRadius.md),
                              ),
                            ),
                            child: Text(
                              'Create New Account',
                              style: buttonSecondaryTextStyle,
                            ),
                          ),
                        ),
                        const SizedBox(height: AppSpacing.lg),

                        // Footer Text
                        Text(
                          '© 2024 POS System. All rights reserved.',
                          style: captionTextStyle.copyWith(color: greyColor),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}