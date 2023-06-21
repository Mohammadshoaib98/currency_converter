import 'package:equatable/equatable.dart';

class Currency extends Equatable{
  final double difference;
  final double rate;
  final String date;
  final int amount;
  final String from;
  final String to;

  const Currency({
    required this.difference,
    required this.rate,
    required this.date,
    required this.amount,
    required this.from,
    required this.to,
  });

  factory Currency.fromJSON({required Map<String, dynamic> data}) {
    return Currency(
      difference: data["result"],
      date: data["date"],
      rate: data["info"]["rate"],
      from: data["query"]["from"],
      to: data["query"]["to"],
      amount: data["query"]["amount"],
    );
  }
  
  @override
  List<Object?> get props =>[difference,rate,amount,from,to,date];
}
