class Destination < ActiveRecord::Base
  resort!
  belongs_to :trip
  belongs_to :pin

  #TODO worry about concurrency

  def move_later
    nekst = self.next
    self.append_to(nekst) if nekst
  end

  def move_to_end
    last = self.class.last_in_order
    self.append_to(last) if self != last
  end

  def move_earlier
    previous = self.previous
    previous.append_to(self) if previous
  end

  def move_to_start
    first = self.class.first_in_order
    first.append_to(self) if self != first
  end

  private

  def default_order
    # place destination in order when it is created
  end

end
