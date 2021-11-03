import 'package:career_app/view/earning_deduction.dart';
import 'package:career_app/view/loan_simulator.dart';
import 'package:career_app/view/perfil-screen.dart';
import 'package:career_app/view/settings.dart';
import 'package:career_app/view/tax.dart';
import 'package:career_app/view/wage_mapping.dart';

class Routes {
  static const String perfil = PersfilScreen.profileRoute;
  static const String wageMapping = WageMappingScreen.wageMappingRoute;
  static const String earningDeduction =
      EarningAndDeductionScreen.earningDeductionRoute;
  static const String tax = TaxScreen.taxRoute;
  static const String loanSimulator = LoanSimulatorScreen.loanSimulatorRoute;
  static const String settings = SettingsScreen.settingsRoute;
}
