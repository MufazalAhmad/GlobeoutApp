enum AuthFormStep {
  enterPhone,
  enterOTP,
  enterName;

  bool get isEnterPhone => this == AuthFormStep.enterPhone;

  bool get isEnterOTP => this == AuthFormStep.enterOTP;

  bool get isEnterName => this == AuthFormStep.enterName;
}
