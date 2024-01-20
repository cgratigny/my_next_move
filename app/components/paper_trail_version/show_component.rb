# frozen_string_literal: true

class PaperTrailVersion::ShowComponent < ApplicationComponent
  attr_reader :version

  def render?
    version.present?
  end

  def changes
    tmp_changes = []
    self.version.changeset.each do |key, value|
      next if [:updated_at, :created_at].include?(key.to_sym)
      tmp_changes << OpenStruct.new(
        key: key,
        old_value: value.first,
        new_value: value.last
      )
    end
    tmp_changes
  end
end
