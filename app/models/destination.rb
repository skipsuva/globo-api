class Destination < ActiveRecord::Base
  resort!
  belongs_to :trip
  belongs_to :pin

  private

  def default_order
    # place destination in order when it is created
  end

end
