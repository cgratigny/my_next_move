module Notable
  extend ActiveSupport::Concern
  
  included do
    # this is necessary to track changes when a note is made
    has_paper_trail

    has_many :notes, as: :notable
  end

  def embedded_params_to_permit
    []
  end
end