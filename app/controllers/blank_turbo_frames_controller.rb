class BlankTurboFramesController < ApplicationController

  def show
    render inline: '<%= turbo_frame_tag(params[:id]) %>'
  end
end
