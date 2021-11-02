import 'package:career_app/screens/earning_deduction.dart';
import 'package:career_app/screens/loan_simulator.dart';
import 'package:career_app/screens/perfil-screen.dart';
import 'package:career_app/screens/settings.dart';
import 'package:career_app/screens/tax.dart';
import 'package:career_app/screens/wage_mapping.dart';

class Routes {
  static const String perfil = PersfilScreen.profileRoute;
  static const String wageMapping = WageMappingScreen.wageMappingRoute;
  static const String earningDeduction =
      EarningAndDeductionScreen.earningDeductionRoute;
  static const String tax = TaxScreen.taxRoute;
  static const String loanSimulator = LoanSimulatorScreen.loanSimulatorRoute;
  static const String settings = SettingsScreen.settingsRoute;
}
