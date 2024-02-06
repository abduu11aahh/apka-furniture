import 'package:frontend/data/models/proposal_model.dart';

abstract class ProposalState {}

class ProposalInitialState extends ProposalState {}

class ProposalLoadingState extends ProposalState {}

class ProposalSuccessState extends ProposalState {
  final List<ProposalModel> proposals;

  ProposalSuccessState(this.proposals);
}

class ProposalErrorState extends ProposalState {
  final String error;

  ProposalErrorState(this.error);
}
