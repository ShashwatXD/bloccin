
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class FormEvent {}

class SubmitFormEvent extends FormEvent {
  final String name;
  final String email;
  final String phone;
  final String gender;
  final String country;
  final String state;
  final String city;

  SubmitFormEvent({
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.country,
    required this.state,
    required this.city,
  });
}

abstract class FormBlocState {}

class FormInitial extends FormBlocState {}

class FormSubmitting extends FormBlocState {}

class FormSuccess extends FormBlocState {
  final String name;
  final String email;
  final String phone;
  final String gender;
  final String country;
  final String state;
  final String city;

  FormSuccess({
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.country,
    required this.state,
    required this.city,
  });
}

class FormFailure extends FormBlocState {
  final String errorMessage;

  FormFailure(this.errorMessage);
}

class FormBloc extends Bloc<FormEvent, FormBlocState> {
  FormBloc() : super(FormInitial()) {
    on<SubmitFormEvent>(_onSubmitForm);
  }

  void _onSubmitForm(SubmitFormEvent event, Emitter<FormBlocState> emit) {
    print("Form submission started"); 
    emit(FormSubmitting()); 

    if (event.name.isEmpty || 
        event.email.isEmpty || 
        event.phone.isEmpty ||
        event.gender.isEmpty ||
        event.country.isEmpty ||
        event.state.isEmpty ||
        event.city.isEmpty) {
      emit(FormFailure('Please fill in all fields'));
      return;
    }

    if (!_isValidName(event.name)) {
      emit(FormFailure('Name must be at least 3 characters and contain no numbers'));
      return;
    }

    if (!_isValidLocation(event.country)) {
      emit(FormFailure('Please enter a valid country name'));
      return;
    }
    
    if (!_isValidLocation(event.state)) {
      emit(FormFailure('Please enter a valid state name'));
      return;
    }
    
    if (!_isValidLocation(event.city)) {
      emit(FormFailure('Please enter a valid city name'));
      return;
    }

    if (!_isValidEmail(event.email)) {
      emit(FormFailure('Invalid email format'));
      return;
    }
    
    if (!_isValidPhone(event.phone)) {
      emit(FormFailure('Phone number must be 10 digits'));
      return;
    }

    print("Form validation successful"); 
    emit(FormSuccess(
      name: event.name,
      email: event.email,
      phone: event.phone,
      gender: event.gender,
      country: event.country,
      state: event.state,
      city: event.city,
    ));
  }

  bool _isValidName(String name) {
    if (name.length < 3) return false;
    final hasNumbers = RegExp(r'[0-9]').hasMatch(name);
    return !hasNumbers;
  }
  
  bool _isValidLocation(String value) {
    return value.length >= 3;
  }

  bool _isValidEmail(String email) {
    final regex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    return regex.hasMatch(email);
  }

  bool _isValidPhone(String phone) {
    final regex = RegExp(r"^\d{10}$");
    return regex.hasMatch(phone);
  }
}