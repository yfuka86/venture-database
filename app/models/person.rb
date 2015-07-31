class Person < ActiveRecord::Base
  has_many :joins
  has_many :investments, class_name: 'Investment', foreign_key: :investor_id, as: :investor

  has_many :employers, through: :joins, class_name: 'Organization', source: :company

  def join!(company)
    Join.new(person: self, company: company).save!
  end

  def invest!(company, amount)
    Investment.new(investor: self, investee: company, amount: amount).save!
  end

  def invested_companies
    Organization.where(id: investments.pluck(:investee_id))
  end
end
