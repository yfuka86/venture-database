class Organization < ActiveRecord::Base
  has_many :joins
  has_many :investments, class_name: 'Investment', foreign_key: :investor_id, as: :investor
  has_many :be_invested, class_name: 'Investment', foreign_key: :investee_id
  has_many :acquisitions, class_name: 'Acquisition', foreign_key: :parent_id
  has_many :be_acquired, class_name: 'Acquisition', foreign_key: :child_id

  has_many :employees, through: :joins, class_name: 'Person'
  has_many :acquired_companies, through: :acquisition, class_name: 'Organization', source: :child
  has_many :acquired_by_companies, through: :be_acquired, class_name: 'Organization', source: :parent

  def acquire!(company, amount)
    Acquisition.new(parent: self, child: company, amount: amount).save!
  end

  def invest!(company, amount)
    Investment.new(investor: self, investee: company, amount: amount).save!
  end

  def invested_companies
    Organization.where(id: investments.pluck(:investee_id))
  end

  def investors
    be_invested.map do |investment|
      if (investment.investor_type == 'Organization')
        Organization.find_by(id: investment.investor_id)
      elsif (investment.investor_type == 'Person')
        Person.find_by(id: investment.investor_id)
      end
    end
  end
end
