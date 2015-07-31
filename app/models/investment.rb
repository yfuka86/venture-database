class Investment < ActiveRecord::Base
  belongs_to :investor, polymorphic: true
  belongs_to :investee, class_name: 'Organization', foreign_key: :investee_id
end
