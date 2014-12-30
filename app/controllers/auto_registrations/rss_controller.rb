class AutoRegistrations::RssController < ApplicationController
  def new
    @form = Form::Rss.new
    @form.coordination_conditions.build
  end

  def create
  end

  def edit
  end

  def update
  end
end
