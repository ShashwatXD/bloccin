import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class FormEvent {}

class UpdateName extends FormEvent {
  final String name;
  UpdateName(this.name);
}

class UpdateEmail extends FormEvent {
  final String email;
  UpdateEmail(this.email);
}

class UpdatePhone extends FormEvent {
  final String phone;
  UpdatePhone(this.phone);
}

class UpdateGender extends FormEvent {
  final String gender;
  UpdateGender(this.gender);
}

class UpdateCountry extends FormEvent {
  final String country;
  UpdateCountry(this.country);
}

class UpdateState extends FormEvent {
  final String state;
  UpdateState(this.state);
}

class UpdateCity extends FormEvent {
  final String city;
  UpdateCity(this.city);
}

// State
class UserFormState {
  final String name;
  final String email;
  final String phone;
  final String gender;
  final String country;
  final String state;
  final String city;

  UserFormState({
    this.name = '',
    this.email = '',
    this.phone = '',
    this.gender = '',
    this.country = '',
    this.state = '',
    this.city = '',
  });

  UserFormState copyWith({
    String? name,
    String? email,
    String? phone,
    String? gender,
    String? country,
    String? state,
    String? city,
  }) {
    return UserFormState(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      country: country ?? this.country,
      state: state ?? this.state,
      city: city ?? this.city,
    );
  }
}

// Bloc
class FormBloc extends Bloc<FormEvent, UserFormState> {
  FormBloc() : super(UserFormState()) {
    on<UpdateName>((event, emit) => emit(state.copyWith(name: event.name)));
    on<UpdateEmail>((event, emit) => emit(state.copyWith(email: event.email)));
    on<UpdatePhone>((event, emit) => emit(state.copyWith(phone: event.phone)));
    on<UpdateGender>((event, emit) => emit(state.copyWith(gender: event.gender)));
    on<UpdateCountry>((event, emit) => emit(state.copyWith(country: event.country)));
    on<UpdateState>((event, emit) => emit(state.copyWith(state: event.state)));
    on<UpdateCity>((event, emit) => emit(state.copyWith(city: event.city)));
  }
}
