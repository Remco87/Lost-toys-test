class Toy < ActiveRecord::Base
  VALID_STATUSES = %w(LOST FOUND)
  validates_presence_of :description, :status, :title, :zipcode, :lat, :lng
  validates_inclusion_of :status, :in => VALID_STATUSES
  belongs_to :user
  
  has_attached_file :photo,
    :styles => {:medium => '300x300>', :thumb => "100x100>"}
    
  acts_as_mappable :auto_geocode => {:field => :zipcode}
  
  named_scope :lost, :conditions => "status = 'LOST'"
  named_scope :found, :conditions => "status = 'FOUND'"
  named_scope :recent, :order => "created_at DESC"
  
  def self.find_with_search(zipcode = nil, status = nil)
    search_scopes = %w(Toy recent)
    search_scopes << "lost" if status == "LOST"
    search_scopes << "found" if status == "FOUND"
    search_scopes << Toy.return_zipcode_search(zipcode)
    
    command_to_call = search_scopes.join(".")
    eval(command_to_call)
  end
  
  def self.return_zipcode_search(zipcode)
    if zipcode =~ /^[\d]{5}+$/
      return "find(:all, :origin => '#{zipcode}', :within => 50)"
    else
      return "find(:all)"
    end
  end
end
