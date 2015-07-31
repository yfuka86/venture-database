class Organization < ActiveRecord::Base
  has_many :join
  has_many :investment, class_name: 'Investment', foreign_key: :investor_id
  has_many :be_invested, class_name: 'Investment', foreign_key: :investee_id
  has_many :acquisition, class_name: 'Acquisition', foreign_key: :parent_id
  has_many :be_acquired, class_name: 'Acquisition', foreign_key: :child_id

  has_many :employees, through: :join, class_name: 'Person'
  has_many :invested_companies, through: :investment, class_name: 'Investment', source: :investee, source_type: "Organization"
  has_many :invested_by_companies, through: :be_invested, class_name: 'Investment', source: :investor, source_type: "Organization"
  has_many :acquired_companies, through: :acquition, class_name: 'Organization', source: :child
  has_many :acquired_by_companies, through: :be_acquire, class_name: 'Organization', source: :parent

  def acquire!(company, amount)
    Acquisition.new(parent: self, child: company, amount: amount).save!
  end

  def invest!(company, amount)
    Investment.new(investor: self, investee: company, amount: amount).save!
  end
end
