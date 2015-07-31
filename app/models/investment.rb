class Investment < ActiveRecord::Base
  belongs_to :investor, polymorphic: true
  belongs_to :investee, polymorphic: true
end
