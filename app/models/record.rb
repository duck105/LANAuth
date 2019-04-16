class Record < ApplicationRecord
  belongs_to :user

  after_create :add_iptable_record
  after_destroy :remove_iptable_record

  def add_iptable_record
    
  end

  def remove_iptable_record

  end

end
