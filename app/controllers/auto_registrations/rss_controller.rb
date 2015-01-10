class AutoRegistrations::RssController < ApplicationController
  def new
    @form = Form::Rss.new
  end

  def create
    binding.pry
    @form = Form::Rss.new(registration_params)
    if @form.save
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def registration_params
    params.require(:form_rss).permit(PERMITTED_ATTRIBUTES)
 "form_rss"=>
  {"title"=>"A",
   "url"=>"B",
   "category_id"=>"2",
   "tagging"=>"1",
   "filter_ids"=>["1", ""],
   "coordination_conditions_attributes"=>
    {"1420884193755"=>{"condition_key"=>"title", "condition_value"=>"AAA", "predicate"=>"cont", "_destroy"=>"false"}, "1420884197566"=>{"condition_key"=>"title", "condition_value"=>"BBB", "predicate"=>"cont", "_destroy"=>"false"}}},
  end
end
