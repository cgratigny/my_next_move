class OpportunityState < ClassyEnum::Base
end

class OpportunityState::Interested < OpportunityState
end

class OpportunityState::ApplicationSubmitted < OpportunityState
end

class OpportunityState::OnHold < OpportunityState
end

class OpportunityState::Withdrawn < OpportunityState
end

class OpportunityState::Rejected < OpportunityState
end
