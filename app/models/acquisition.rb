class Acquisition < ActiveRecord::Base
  belongs_to :parent, class_name: 'Organization', foreign_key: :parent_id
  belongs_to :child, class_name: 'Organization', foreign_key: :child_id
end
