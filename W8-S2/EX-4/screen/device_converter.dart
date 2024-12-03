import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/enum.dart';

class DeviceConverter extends StatefulWidget {
  const DeviceConverter({super.key});

  @override
  State<DeviceConverter> createState() => _DeviceConverterState();
}

class _DeviceConverterState extends State<DeviceConverter> {
  Currency? _selectedCurrency;
  final _amountController = TextEditingController();
  double? _convertedAmount;

  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );

  void _onCurrencyChanged(Currency? newCurrency) {
    setState(() {
      _selectedCurrency = newCurrency;
      _convertAmount();
    });
  }

  void _convertAmount() {
    if (_amountController.text.isEmpty || _selectedCurrency == null) {
      setState(() => _convertedAmount = null);
      return;
    }

    final amount = double.tryParse(_amountController.text);
    if (amount == null) {
      setState(() => _convertedAmount = null);
      return;
    }

    setState(() {
      switch (_selectedCurrency) {
        case Currency.euro:
          _convertedAmount = amount * 0.95;
        case Currency.dong:
          _convertedAmount = amount * 25377;
        case Currency.riel:
          _convertedAmount = amount * 4100;
        default:
          _convertedAmount = null;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _amountController.addListener(_convertAmount);
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.money,
              size: 60,
              color: Colors.white,
            ),
            const Center(
              child: Text(
                "Converter",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            const SizedBox(height: 50),
            const Text("Amount in dollars:"),
            const SizedBox(height: 10),
            TextField(
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              controller: _amountController,
              decoration: InputDecoration(
                prefix: const Text('\$ '),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 1.0),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Enter an amount in dollar',
                hintStyle: const TextStyle(color: Colors.white),
              ),
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 30),
            DropdownButton<Currency>(
              value: _selectedCurrency,
              hint: const Text('Select Currency'),
              isExpanded: true,
              items: Currency.values.map((currency) {
                return DropdownMenuItem<Currency>(
                  value: currency,
                  child: Row(
                    children: [
                      const SizedBox(width: 8),
                      Text(currency.name),
                    ],
                  ),
                );
              }).toList(),
              onChanged: _onCurrencyChanged,
            ),
            const SizedBox(height: 30),
            const Text("Amount in selected currency:"),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: textDecoration,
              child: Text(
                _convertedAmount != null
                    ? '${_convertedAmount!.toStringAsFixed(2)} ${_selectedCurrency?.name ?? ""}'
                    : 'Select currency and enter amount',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
