class Join < ActiveRecord::Base
  belongs_to :company, class_name: 'Organization', foreign_key: :company_id
  belongs_to :person
end
