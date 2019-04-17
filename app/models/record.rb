class Record < ApplicationRecord
  belongs_to :user

  after_create :add_iptable_record
  before_destroy :remove_iptable_record

  def add_iptable_record
    system("sudo bash add_ip.sh #{self.source_ip}")
  end

  def remove_iptable_record
    system("sudo bash remove_ip.sh #{self.source_ip}")
  end

  def get_internet_usage
    result = `sudo bash analysis.sh #{self.source_ip}`.strip()
  end
end

