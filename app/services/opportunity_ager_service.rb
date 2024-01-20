class OpportunityAgerService < ApplicationService
  attr_accessor :opportunity, :opportunity_state

  def perform
    OpportunityState.ageable.each do |opportunity_state|
      Opportunity.by_state(opportunity_state.to_s).where("#{opportunity_state.ageable_attribute} <= ?", opportunity_state.ageable_days.days.ago).each do |opportunity|
        OpportunityAgerService.new(opportunity: opportunity, opportunity_state: opportunity_state).perform_single
      end
    end
  end

  def perform_single
    return unless ageable_date_value.present?

    Note.create!(
      notable: opportunity, 
      body: build_note_body, 
      source: :system,
      notable_attributes: {
        id: opportunity.id,
        state: :stale
      }
    )
  end

  def build_note_body
    body_parts = []
    body_parts << "Marking opportunity as stale because value of"
    body_parts << opportunity_state.ageable_attribute.to_s.titleize
    if ageable_date_value.present? && ageable_date_value.respond_to?(:to_fs)
      body_parts << "is"
      body_parts << ageable_date_value.to_fs
      body_parts << "and is more than"
    else
      body_parts << "is blank, which calculates to more than"
    end
    body_parts << opportunity_state.ageable_days
    body_parts << "days ago."
    body_parts.join(" ")
  end

  def ageable_date_value
    opportunity.public_send(opportunity_state.ageable_attribute)
  end
end
