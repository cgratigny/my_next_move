class OpportunityRating < ClassyEnum::Base
  def self.selectable
    all.select{ |option| option.to_i > 0 }
  end

  def to_i
    # adding the -1 to make this start with zero for the to_i for no rating on some
    index - 1
  end

  def text
    to_i
  end
end

class OpportunityRating::Zero < OpportunityRating
end

class OpportunityRating::One < OpportunityRating
end

class OpportunityRating::Two < OpportunityRating
end

class OpportunityRating::Three < OpportunityRating
end

class OpportunityRating::Four < OpportunityRating
end

class OpportunityRating::Five < OpportunityRating
end
