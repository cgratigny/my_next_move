class OpportunityState < ClassyEnum::Base
  def tailwind_class
    (tailwind_classes + ["rounded-sm", "p-0.5", "text-xs", "border", "border-slate-100", "dark:text-gray-800", "mr-1", "whitespace-nowrap"]).join(" ")
  end
end

class OpportunityState::Interested < OpportunityState
  def tailwind_classes
    ["bg-green-100"]
  end
end

class OpportunityState::ApplicationSubmitted < OpportunityState
  def tailwind_classes
    ["bg-yellow-100"]
  end
end

class OpportunityState::InScreening < OpportunityState
  def tailwind_classes
    ["bg-yellow-100"]
  end
end

class OpportunityState::OnHold < OpportunityState
  def tailwind_classes
    ["bg-orange-100"]
  end
end

class OpportunityState::Withdrawn < OpportunityState
  def tailwind_classes
    ["bg-true-gray-100"]
  end
end

class OpportunityState::NotInterested < OpportunityState
  def tailwind_classes
    ["bg-red-100"]
  end
end

class OpportunityState::Rejected < OpportunityState
  def tailwind_classes
    ["bg-red-100"]
  end
end
