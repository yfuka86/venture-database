class Person < ActiveRecord::Base
  has_many :join
  has_many :investment, class_name: 'Investment', foreign_key: :investor_id

  has_many :employers, through: :join, class_name: 'Organization'
  has_many :invested_companies, through: :investment, class_name: 'Investment', source: :investee, source_type: "Organization"

  def join!(company)
    Join.new(person: self, company: company).save!
  end

  def invest!(company, amount)
    Investment.new(investor: self, investee: company, amount: amount).save!
  end
end
